class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def signup
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      flash[:success] = "create account success"
      redirect_to :login_path
    else
      puts @user
      flash.now[:danger] = "create account failed"
      render 'new'
    end
  end

  def user_courses
    @users = User.all
  end

  def enroll
    if (Enrollment.where(course_id: params[:course_id], user_id: session[:user_id]).size >= 1)
      flash[:danger] = "You have alread enrolled in this course!"
      redirect_to "/"
    else
      flash[:success] = "You have successfully enrolled in this course!"
      Enrollment.new(course_id: params[:course_id], user_id: session[:user_id]).save
      redirect_to "/"
    end
  end

  def unenroll
    if (Enrollment.where(course_id: params[:course_id], user_id: session[:user_id]).first.destroy)
      flash[:success] = "You have successfully delete in this course!"
      redirect_to "/"
    end
  end

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
