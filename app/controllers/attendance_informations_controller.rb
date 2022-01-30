class AttendanceInformationsController < ApplicationController
  before_action :authenticate_member!

  def index
    params[:selected_month] = Date.today.strftime('%Y-%m') unless params[:selected_month].present?
    @ais = AttendanceInformation.where(member_id: current_member.id).reverse
    #params[:selected_month] = '2022-01'
    if Rails.env.production?
      @ais=  AttendanceInformation.where("DATE_FORMAT('%Y-%m',time_in)='#{params[:selected_month]}'").where(member_id: current_member.id).reverse
    else
      @ais=  AttendanceInformation.where("strftime('%Y-%m',time_in)='#{params[:selected_month]}'").where(member_id: current_member.id).reverse
    end
    ## pp params[:selected_month]
    yymmdd = params[:selected_month].split('-')
    ## pp yymmdd
    @base_month = Date.new(yymmdd[0].to_i,yymmdd[1].to_i,1)

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
