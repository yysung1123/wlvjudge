class SubmissionsController < ApplicationController
  before_action :find_submission, :only => []

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
  end

  private
  def find_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:problem_id, :contest_id, :result, :runtime, :memory, :language)
  end
end
