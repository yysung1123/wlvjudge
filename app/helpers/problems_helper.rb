require 'open-uri'

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
    doc.xpath('//@style').remove
    doc.xpath("//img").each do |img|
      img['src']  = "http://zerojudge.tw/#{img['src']}"
    end

    raise doc.at_css('h1').content if doc.at_css('legend').content == "EXCEPTION"

    a = {}
    a['title'] = doc.at_css('#problem_title').content
    a['content'] = doc.at_css('#problem_content').inner_html
    a['input'] = doc.at_css('#problem_theinput').content
    a['output'] = doc.at_css('#problem_theoutput').content
    a['sample_input'] = doc.css('div.problembox pre').first.content
    a['sample_output'] = doc.css('div.problembox pre').last.content
    a['hint'] = doc.at_css('#problem_hint').content

    #a['content'].gsub!('ShowImage','http://zerojudge.tw/ShowImage')

    return a

  end

end
