class Admins::AttendanceInformationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @ais = AttendanceInformation.all.reverse
  end

  def update
    @ai = AttendanceInformation.find(params[:id])
    @ai.update(status: params[:status])
    if @ai.status == "applying"
      ApprovalHistory.where(attendance_information_id: @ai.id).destroy_all
      redirect_to admins_attendance_informations_path
    else
      redirect_to new_admins_attendance_information_path(ai_id: @ai.id)
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
