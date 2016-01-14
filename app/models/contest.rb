class Contest < ActiveRecord::Base
  has_many :contest_problem_sets
  has_many :problems, :through => :contest_problem_sets
  accepts_nested_attributes_for :contest_problem_sets, :reject_if => :all_blank, :allow_destroy => true
  has_many :submissions

  validate :begin_time_cannot_be_before_now, on: :create
  validate :end_time_cannot_be_before_the_begin_time
  validates :title, :begin_time, :end_time, presence: true

  def begin_time_cannot_be_before_now
    if begin_time < DateTime.now - 1.minute
      errors.add(:begin_time, "can't be before now")
    end
  end

  def end_time_cannot_be_before_the_begin_time
    if end_time < begin_time
      errors.add(:end_time, "can't be before the begin_time")
    end
  end
end
