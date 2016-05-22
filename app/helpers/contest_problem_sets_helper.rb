module ContestProblemSetsHelper
  def contest_over?(contest)
    DateTime.now > contest.end_time
  end
end
