class CandidateController < ApplicationController
  def create
    unless helpers.valid_login?
      redirect_to "/" and return
    end

    candidate = Candidate.new(name: params[:name])
    candidate.save!

    # Adding a new user results causes the user to vote for the new candidate
    user = helpers.current_user
    user.candidate_id = candidate.id
    user.save!

    redirect_to "/vote"
  end
end