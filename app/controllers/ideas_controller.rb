class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
    
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Created Successfully!"
      redirect_to idea_path(@idea)
    else
      flash[:notice] = "Idea not saved..."
      render :new
    end
  end

  def show
    @comment = Comment.new
  end


  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
