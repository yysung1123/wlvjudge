class Problem < ActiveRecord::Base
  has_many :contest_problem_sets
  has_many :contests, :through => :contest_problem_sets
  has_many :submissions
  belongs_to :judge
  validates :judge, uniqueness: { scope: :source }
  #validates , presence: true
end
