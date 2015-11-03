class Problem < ActiveRecord::Base
  has_many :contest_problem_sets, :dependent => :destroy
  has_many :contests, :through => :contest_problem_sets
  has_many :submissions
  belongs_to :judge
end
