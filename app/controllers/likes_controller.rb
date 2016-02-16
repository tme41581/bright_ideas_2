class LikesController < ApplicationController
	before_action :require_login, only: [:create, :destroy]
  before_action :require_correct_user
	def create
		idea = Idea.find(params[:idea_id])
		Like.create(user: current_user, idea: idea)
		redirect_to :back
	end
end
