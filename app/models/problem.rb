require 'open-uri'

class Problem < ActiveRecord::Base
  has_many :contest_problem_sets
  has_many :contests, :through => :contest_problem_sets
  has_many :submissions
  belongs_to :judge
  validates :judge, uniqueness: { scope: :source }
  validates_presence_of :title, :on => :create
  #validates , presence: true

  before_validation :oj_parser

  def oj_parser
    begin
      case self.judge_id
      when 1
        res = uva_parser(self.source)
      when 2
        res = zerojudge_parser(self.source)
      when 3
        res = greenjudge_parser(self.source)
      end
      self.title = res['title']
      puts self.title
      self.content = res['content']
      self.input = res['input']
      self.output = res['output']
      self.sample_input = res['sample_input']
      self.sample_output = res['sample_output']
      self.hint = res['hint']
    rescue
    end
  end

  def uva_parser(probid)
    url = "https://uva.onlinejudge.org/external/" + (probid.to_i / 100).to_s + "/" + probid.to_s + ".html"
    doc = Nokogiri::HTML.parse(open(url))
    title = doc.at_css('title').text
    sample_input = doc.css('pre').first.text
    sample_output = doc.css('pre').last.text
  end

  def zerojudge_parser(probid)

    base_url = 'http://zerojudge.tw/'
    doc = Nokogiri::HTML(open(base_url + 'ShowProblem?problemid=' + probid)).at_css('.content_individual')

    raise doc.at_css('h1').content if doc.at_css('legend').content == "EXCEPTION"

    doc.xpath('//@style').remove

    a = {}
    a['title'] = doc.at_css('#problem_title').content
    a['content'] = doc.at_css('#problem_content').inner_html.gsub(/(ShowImage)/, base_url + '\1')
    a['input'] = doc.at_css('#problem_theinput').content
    a['output'] = doc.at_css('#problem_theoutput').content
    a['sample_input'] = doc.css('div.problembox pre').first.content
    a['sample_output'] = doc.css('div.problembox pre').last.content
    a['hint'] = doc.at_css('#problem_hint').content

    return a
  end

  def greenjudge_parser(probid)

    base_url = 'http://www.tcgs.tc.edu.tw:1218/'
    doc = Nokogiri::HTML(open(base_url + 'ShowProblem?problemid=' + probid)).at_css('.content_individual')

    title = doc.at_css('.ShowProblem')
    raise 'Cannot find problem ' + probid if title == nil

    doc.xpath('//@style').remove

    box = doc.css('.problembox')

    a = {}
    a['title'] = title.content.gsub(probid + ': ', '')
    a['content'] = box[0].inner_html.gsub(/(images)/, base_url + '\1')
    a['input'] = box[1].content
    a['output'] = box[2].content
    a['sample_input'] = box[3].at_css('pre').content
    a['sample_output'] = box[4].at_css('pre').content
    a['hint'] = box[5].content

    return a
  end
end
