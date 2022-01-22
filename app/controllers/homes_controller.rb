class HomesController < ApplicationController
  def index
    if member_signed_in?
      redirect_to new_attendance_information_path
    end

    if admin_signed_in?
      redirect_to admins_members_path
    end
  end
end
