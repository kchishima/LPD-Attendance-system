class Admins::AttendanceInformationsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @ai = AttendanceInformation.find(params[:id])
  end

  def index
    @month = params[:month] ? Time.parse(params[:month]) : Time.zone.today
    start_month = @month.beginning_of_month
    end_month = @month.end_of_month

    @ais = AttendanceInformation.where(time_in: start_month..end_month).page(params[:page]).per(10).order('updated_at DESC')
  end

  def update
    @ai = AttendanceInformation.find(params[:id])
    @ai.update(status: params[:status])
    if @ai.status == "applying"
      ApprovalHistory.where(attendance_information_id: @ai.id).destroy_all
      redirect_to admins_attendance_informations_path
    elsif @ai.status == "approval"
      if !(@ai.temp_time_in.nil? || @ai.temp_time_out.nil?)
        @ai.update(time_in: @ai.temp_time_in, time_out: @ai.temp_time_out, temp_time_in: nil, temp_time_out: nil)
      end
      redirect_to new_admins_attendance_information_path(ai_id: @ai.id)
    elsif @ai.status == "nonapproval"
      redirect_to new_admins_attendance_information_path(ai_id: @ai.id)
    else
      redirect_to admins_attendance_informations_path
    end
  end

  def new
    @reason = ApprovalHistory.new
  end

  def create
    @reason = ApprovalHistory.new(approval_history_params)
    if @reason.save
      redirect_to admins_attendance_informations_path
    else
      render :new
    end
  end

  private

  def approval_history_params
    params.require(:approval_history).permit(:reason).merge(
      admin_id: current_admin.id,
      attendance_information_id: params[:ai_id]
      )
  end

end
