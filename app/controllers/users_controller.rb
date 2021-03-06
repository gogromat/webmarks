class UsersController < ApplicationController

  before_filter :signed_in_user,     only: [:index, :edit, :update, :destroy]
  before_filter :not_signed_in_user, only: [:new, :create]
  before_filter :correct_user,       only: [:edit, :update]
  before_filter :admin_user,         only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Webmarks!"
      redirect_to root_url #@user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end

    def not_signed_in_user
      if signed_in?
        redirect_to root_path, notice: "Already signed in. Sign out and try again."
      end
    end

end