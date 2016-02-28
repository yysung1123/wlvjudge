class ContestsController < ApplicationController

  before_action :find_contest, :only => [ :show, :edit, :update, :destroy]

  def index
    @contests = Contest.all
  end

  def show
    @contest_problem_sets = @contest.contest_problem_sets.includes(:problem)
  end

  def new
    @contest = Contest.new
    @judges = Judge.all
    5.times do
      @contest.contest_problem_sets.build
    end
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
    redirect_to contests_path
  end

  private
  def contest_params
    params.require(:contest).permit(:title, :begin_time, :end_time, contest_problem_sets_attributes: [:id, :judge_id, :source, :_destroy]);
  end

  def find_contest
    @contest = Contest.find(params[:id])
  end
end
