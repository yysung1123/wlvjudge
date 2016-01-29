class Submission < ActiveRecord::Base
  belongs_to :problem
  belongs_to :contest

  def oj_submit()
    case self.problem.judge_id
    when 1
      uva_submit
    when 2
      zerojudge_submit
    when 3
      greenjudge_submit
    end
  end

  def uva_submit
  end

  def zerojudge_submit
    agent = Mechanize.new

    #login
    page = agent.get "http://zerojudge.tw/Login"
    form = page.form
    form.account = YOUR_ACCOUNT
    form.passwd = YOUR_PASSWORD
    form.submit
    #submit
    payload = { 'action' => 'SubmitCode', 'problemid' => self.problem.source, 'language' => 'CPP', 'code' => self.code }
    agent.post "http://zerojudge.tw/Solution.api", payload
  end

  def greenjudge_submit
  end
end
