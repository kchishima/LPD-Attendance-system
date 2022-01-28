class  WorkScheduledsController < ApplicationController
  def new
    @date = params[:date]
    @yesterday = Date.parse(@date).yesterday
    @tomorrow = Date.parse(@date).tomorrow
    @work_scheduled = WorkScheduled.new
    @works = WorkScheduled.new
  end

  def create
     @work_scheduled = WorkScheduled.new(work_scheduled_params)
     # time_in = params[:work_scheduled][:time_in]
     # time_out = params[:work_scheduled][:time_out]
     # @date = params[:work_scheduled][:date]
     # pp time_in, time_out
    # binding.pry
    # @work_scheduled.time_in = time_in
    # @work_scheduled.time_out = time_out
    # @work_scheduled.time_in = params[:work_scheduled][:date] + time_in
    #   @work_scheduled.time_out = params[:work_scheduled][:date] + time_out
    # @work_scheduled.time_in = params[:work_scheduled][:date] + " "+ time_in["time_in(4i)"]+time_in["time_in(5i)"]
    # @work_scheduled.time_out = params[:work_scheduled][:date] + " "+ time_out["time_out(4i)"]+time_out["time_out(5i)"]
     @work_scheduled.member_id = current_member.id
    # binding.pry

     @work_scheduled.save
  redirect_to work_scheduleds_path
  end

  def index
    # binding.pry
     # @ais = WorkScheduled.all
     @ais = WorkScheduled.where(member_id: current_member.id)
  end


   def work_scheduled_params
    params.require(:work_scheduled).permit(:time_in, :time_out)
   end
end

