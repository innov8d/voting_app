class VoteController < ApplicationController
  def index
    unless helpers.valid_login?
      redirect_to "/" and return
    end
    @current_user = helpers.current_user
    @candidates = Candidate.all
  end

  def create
    unless helpers.valid_login?
      redirect_to "/" and return
    end

    user = helpers.current_user
    user.candidate_id = params[:candidate_id]
    user.save!

    redirect_to "/vote"
  end
end
