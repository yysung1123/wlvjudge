class ProblemsController < ApplicationController
  before_action :find_problem, :only => [ :show, :edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
    @judges = Judge.all
  end

  def create
  end

  def show
  end

  private
  def find_problem
    @problem = Problem.find(params[:id])
  end
end
