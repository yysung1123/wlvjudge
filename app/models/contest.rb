class Contest < ActiveRecord::Base
  has_many :contest_problem_sets
  has_many :problems, :through => :contest_problem_sets
  has_many :submissions

  validate :start_time_cannot_be_before_now, on: :create
  validate :end_time_cannot_be_before_the_start_time
  validates :title, :start_time, :end_time, presence: true

  def start_time_cannot_be_before_now
    if start_time < DateTime.now - 1.minute
      errors.add(:start_time, "can't be before now")
    end
  end

  def end_time_cannot_be_before_the_start_time
    if end_time < start_time
      errors.add(:end_time, "can't be before the start_time")
    end
  end
end
