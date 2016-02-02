class SubmissionsController < ApplicationController
  before_action :find_submission, :only => [:show, :edit, :update, :destroy]

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)
    if @submission.save
      redirect_to submissions_path
    else
      redirect_to new_submission_path
    end
  end

  def show
  end

  private
  def find_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:problem_id, :contest_id, :result, :runtime, :memory, :language, :code)
  end
end
