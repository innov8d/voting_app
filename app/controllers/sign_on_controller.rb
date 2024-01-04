class SignOnController < ApplicationController
  def new
    if helpers.valid_login?
      redirect_to "/vote"
    end
  end

  def create
    email = params[:email]
    zip = params[:zip]
    user = User.where(email: email, zip: zip).first

    if user.nil?
      user = User.new(email: email, zip: zip, sign_on_at: DateTime.now)
    else
      user.sign_on_at = DateTime.now
    end

    user.save!

    Rails.cache.write("user_id", user.id)

    redirect_to "/"
  end
end
