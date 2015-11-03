class Contest < ActiveRecord::Base
  has_many :contest_problem_sets, :dependent => :destroy
  has_many :problems, :through => :contest_problem_sets
  has_many :submissions
end
