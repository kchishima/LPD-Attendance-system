class Admins::MembersController < ApplicationController

  before_action :authenticate_admin!

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to admins_members_path
    else
      render :new
    end
  end

  def index
     @members = Member.all
  end

  private

  def member_params
    params.require(:member).permit(
        :member_id,
        :email, :password,
        :first_name_kana, :last_name_kana,
        :first_name, :last_name,
        :postal_code, :address,
        :phone_number
      )
  end
end
