class Admins::WorkScheduledsController < ApplicationController
  def index
    @month = Date.parse("#{params[:year]}/#{params[:month]}").in_time_zone("Tokyo")
    @members = Member.all
    @all_scheduled = WorkScheduled.where(time_in: @month.all_month)
    # [[name, nil,nil,12:00~19:00,nil,nil],[name2, nil,nil,...nil]]

    @members_scheduled = []
    @members.each do |member|
      work_schedule = []
      member_work_schedule = @all_scheduled.where(member_id: member.id)
      days = @month.to_datetime.all_month
      days.each_with_index do |day, index|
        work = ''
        member_work_schedule.each do |mwd|
          if index == 22
             #byebug
          end
          if (day.in_time_zone("Tokyo") <= mwd.time_in) && (mwd.time_out < day.in_time_zone("Tokyo").next_day(1))
            work = [mwd.id , "#{mwd.time_in.strftime("%H:%M")} ~ #{mwd.time_out.strftime("%H:%M")}"]
            break
          else
            work = ''
          end
        end
        work_schedule << work
      end
      @members_scheduled << ["#{member.first_name} #{member.last_name}", *work_schedule]
    end
  end

end
