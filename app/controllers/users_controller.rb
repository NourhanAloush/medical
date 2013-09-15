class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 3)
  end

  def create
    @user = User.new(user_params)
    @user.avatar = nil
    if @user.save
      sign_in @user
      flash[:success] = "Created Successfully!"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to users_url
    else
      render 'edit'
    end
  end

  private

   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :mobile, :avatar)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
