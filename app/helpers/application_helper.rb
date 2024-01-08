module ApplicationHelper
  MAX_LOGIN_REAUTH_TIME = 300

  def current_user
    user_id = Rails.cache.fetch("user_id")
    user = nil

    if user_id
      user = User.where(id: user_id).first
    end

    user
  end

  def valid_login?
    user = current_user
    user && ((DateTime.now.to_i - user.sign_on_at.to_i) <= MAX_LOGIN_REAUTH_TIME)
  end
end
