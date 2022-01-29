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

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update

    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admins_member_path(@member)
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admins_members_path
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
