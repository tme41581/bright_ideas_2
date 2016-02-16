class IdeasController < ApplicationController
  def index
  	@user = User.find(current_user)
  	@ideas = Idea.all
  end

  def create
  	@idea = Idea.new(content: params[:content], user: current_user)

  	if @idea.save
  		redirect_to bright_ideas_path
  	else
  		flash[:errors] = @idea.errors.full_messages
      redirect_to :back
    end
  end

  def show
  	@idea = Idea.find(params[:id])
  end

end
