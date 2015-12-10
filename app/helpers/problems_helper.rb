module ProblemsHelper

  def uva_parser(probid)
    url = "https://uva.onlinejudge.org/external/" + (probid / 100).to_s + "/" + probid.to_s + ".html"
    doc = Nokogiri::HTML.parse(open(url))
    title = doc.at_css('title').text
    sample_input = doc.css('pre').first.text
    sample_output = doc.css('pre').last.text
  end

  def zerojudge_parser(probid)

  doc = Nokogiri::HTML(open('http://zerojudge.tw/ShowProblem?problemid=' + probid))

  a = {}

  a['title'] = doc.css('span#problem_title')[0].content
  a['content'] = doc.css('div#problem_content')[0].content
  a['input'] = doc.css('div#problem_theinput')[0].content
  a['output'] = doc.css('#problem_theoutput')[0].content
  a['sample_input'] = doc.css('div.problembox pre')[0].content
  a['sample_output'] = doc.css('div.problembox pre')[1].content
  a['hint'] = doc.css('div#problem_hint')[0].content

  return a

  end

end
