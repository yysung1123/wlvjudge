class ContestProblemSetsController < ApplicationController

  before_action :find_contest, :only => [ :show, :edit, :update, :destroy]

  def new
  end

  def show
    @problem = @contest.contest_problem_sets.find(params[:id]).problem
  end

  private
  def find_contest
    @contest = Contest.find(params[:contest_id])
  end

end
