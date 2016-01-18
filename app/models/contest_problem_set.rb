class ContestProblemSet < ActiveRecord::Base
  include ProblemsHelper
  belongs_to :contest
  belongs_to :problem

  validates_presence_of :problem_id, :on => :create

  before_validation :link_to_problem

  def link_to_problem
    begin
      set_problem_id
    rescue
      params = ActionController::Parameters.new({
        problem: {
          source: self.source,
          judge_id: self.judge_id
        }
      })
      begin
        problem = Problem.create(params.require(:problem).permit(:judge_id, :source, :title, :content, :input, :output, :sample_input, :sample_output, :hint))
        if problem.save
          set_problem_id
        else
        end
      rescue
      end
    end
  end

  def set_problem_id
    self.problem_id = Problem.all.where(judge_id: self.judge_id).where(source: self.source).first.id
  end

end
