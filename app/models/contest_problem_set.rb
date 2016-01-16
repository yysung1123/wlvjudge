class ContestProblemSet < ActiveRecord::Base
  belongs_to :contest
  belongs_to :problem

  before_create :link_to_problem

  def link_to_problem
    begin
      self.problem_id = Problem.all.where(judge_id: self.judge_id).where(source: self.source).first.id
    rescue
    end
  end
end
