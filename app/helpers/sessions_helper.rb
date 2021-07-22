module SessionsHelper

  # AUTHENTICATION

  # SIGN IN
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  # SIGN OUT
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  # SELF CURRENT USER
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # VERIFICATIONS

  # IS CURRENT USER?
  def current_user?(user)
    user == current_user
  end

  # IS CURRENT USER SIGNED IN?
  def signed_in?
    !current_user.nil?
  end

  # IS CURRENT USER AN ADMIN?
  def isAdmin?
    !current_user.nil? && current_user.admin
  end
end

private

# PERMISSIONS

# CHECK IF USER SIGNED IN
def is_user_signed_in
  unless signed_in?
    flash[:info] = 'A login is required!'
    redirect_to :root
  end
end

# CHECK IF USER IS AN ADMIN
def is_user_admin
  unless isAdmin?
    flash[:error] = "Restricted access!"
    redirect_to :root
  end
end
