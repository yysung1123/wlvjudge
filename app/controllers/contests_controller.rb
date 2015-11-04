class ContestsController < ApplicationController

  before_action :find_contest, :only => [ :show, :edit, :update, :destroy]

  def index
    @contests = Contest.all
  end

  def show
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create(contest_params)
    if @contest.save
      redirect_to contests_path
    else
      render new_contest_path
    end
  end

  def edit
  end

  def update
    @contest.update(contest_params)
  end

  def destroy
    @contest.destroy
  end

  private
  def contest_params
    params.require(:contest).permit(:title, :start_time, :end_time);
  end

  def find_contest
    @contest = Contest.find(params[:id])
  end
end
