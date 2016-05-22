class ProblemsController < ApplicationController
  include ProblemsHelper
  before_action :find_problem, :only => [ :show, :edit, :update, :destroy]

  def index
    @problems = Problem.all.includes(:judge)
  end

  def new
    @problem = Problem.new
    @judges = Judge.all
  end

  def create
    @problem = Problem.create(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      redirect_to new_problem_path
    end
  end

  def show
  end

  private
  def find_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:judge_id, :source, :title, :content, :input, :output, :sample_input, :sample_output, :hint)
  end

end
