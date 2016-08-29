class UsersController < ApplicationController
  
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the Sample App!"
      redirect_to @user #showが呼び出される
    else
      render 'new'
    end
  end 
  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    permitted_params = params.require(:user).permit(:name, :email, :profile, :area)
    if @user.update(permitted_params)
      flash[:success]="Updated."
      redirect_to @user #showが呼び出される
    else
      flash[:failed]="Update failed."
      redirect_to @user #showが呼び出される
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :area)
  end

end
