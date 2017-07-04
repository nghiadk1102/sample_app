class UsersController < ApplicationController
  before_action :logged_in_user, except: [:show, :create, :new]
  before_action :correct_user, only: [:edit, :update]
  before_action :verify_admin!, only: :destroy
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.where(activated: true)
      .select(:id, :name, :email).paginate page: params[:page],
      per_page: Settings.controller.user_controller.size_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t ".check_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = @user.microposts.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".user_delete"
    else
      flash[:success] = t ".error"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".find_rerror"
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".please"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user.is_user? @user
  end

  def verify_admin!
    redirect_to root_url unless current_user.admin?
  end
end
