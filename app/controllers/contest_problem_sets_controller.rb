class ContestProblemSetsController < ApplicationController
  before_action :find_contest_problem_set, :only => [ :show ]

  def show
    @problem = Problem.find(@contest_problem_set.problem_id)
  end

  private
  def find_contest_problem_set
    @contest_problem_set = ContestProblemSet.find(params[:id])
  end
end
