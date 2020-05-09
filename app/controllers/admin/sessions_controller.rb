class Admin::SessionsController < AdminController
  before_action :set_no_layout
  def login
    return(redirect_to(admin_dashboard_interview_path)) unless current_user.nil?
    @form_auth_token = form_authenticity_token
    return if request.get?
    # return redirect_to root_path, flash: { alert: I18n.t("registration.banned.fail") } if check_auth_deleted
    @user = User.where(login: params[:username]).or(User.where(email: params[:username])).last
    return redirect_to login_path, flash: { alert: I18n.t("form.login_faild_username_or_password") } if @user.nil?
    if @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to admin_dashboard_interview_path
    else
      return redirect_to login_path, flash: { alert: I18n.t("form.login_faild_username_or_password") } if @user.nil?
    end
  end

  def lostpassword
    return if request.get?
    @user = User.where(login: params[:username]).or(User.where(email: params[:username])).last
    return redirect_to lostpassword_path, flash: { alert: I18n.t("form.password_reset_sent") } if @user.nil?
  end


  def logout
    session.delete(:user_id)
    return redirect_to login_path, flash: { alert: I18n.t("flash.user.logouted") }
  end

  private 

  def set_no_layout
    @no_layout = true
  end
  
end
