class MembersController < ApplicationController

  before_action :authenticate_member!

  def show
     @member = Member.find(params[:id])
     @member_new = Member.new
  end

  def update
    @member = Member.find(params[:id])
    @member.update(password_params)
    redirect_to member_path(@member)
  end

  private

  def password_params
    params.require(:member).permit(:password, :password_confirmation)
  end
end
