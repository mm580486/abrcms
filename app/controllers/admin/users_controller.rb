class Admin::UsersController < AdminController
  before_action :find_user, only: [:edit,:update,:destroy,:do_destroy]
  def users
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    raise params.inspect
    @user = User.new(user_params)
    if @user.save
      redirect_to({action: :users},flash: {success: t('flash.user.created')})
    else
      flash[:danger] = t('flash.has_error')
      flash[:errors] = @user.errors.full_messages
      render({action: :new})
    end
  end

  def edit
  end

  def update

  end


  def destroy
  end

  def do_destroy
  end
  private
  def find_user
    @user = User.find_by_id(params[:id])
  end
  def user_params
    params.require(:user).permit(:login,:email,:name,:family,:website,:password,metum_attributes: [:id,:key,:value])
  end
end
