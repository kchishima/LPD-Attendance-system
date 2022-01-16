class Admins::AttendanceInformationsController < ApplicationController
  def index
    @ais = AttendanceInformation.all
  end
end
