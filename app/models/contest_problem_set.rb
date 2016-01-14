class ContestProblemSet < ActiveRecord::Base
  belongs_to :contest
  belongs_to :problem

  before_create :link_to_problem

  def link_to_problem
    source = self.source
    self.problem_id = Problem.all.where(judge_id: self.problem_id).where(source: source).first.id
  end
end
