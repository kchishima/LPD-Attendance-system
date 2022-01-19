class AttendanceInformationsController < ApplicationController
  before_action :authenticate_member!

  def index
    @ais = AttendanceInformation.where(member_id: current_member.id).reverse
  end

  def new
    @ais = AttendanceInformation.where(member_id: current_member.id).reverse.take(5)
  end

  def show
    @ai = AttendanceInformation.find(params[:id])
  end

  def time_in
    ai = AttendanceInformation.new
    ai.member_id = current_member.id
    ai.time_in = Time.current
    ai.save
    redirect_to new_attendance_information_path
  end

  def time_out
    ai = AttendanceInformation.where(member_id: current_member.id).where.not(time_in: nil).last
    if ai.time_out.nil?
      ai.update(time_out: Time.current)
    end
    redirect_to new_attendance_information_path
  end

  def edit
    @ai = AttendanceInformation.find(params[:id])
  end

  def update
    @ai = AttendanceInformation.find(params[:id])
    @ai.update(attendance_information_params.merge(status: "applying"))
    render :edit
  end

  private
  def attendance_information_params
    params
      .require(:attendance_information)
      .permit(:temp_time_in, :temp_time_out)
  end
end
