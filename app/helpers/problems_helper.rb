module ProblemsHelper

  def uva_parser(probid)
    url = "https://uva.onlinejudge.org/external/" + (probid / 100).to_s + "/" + probid.to_s + ".html"
    doc = Nokogiri::HTML.parse(open(url))
    title = doc.at_css('title').text
    sample_input = doc.css('pre').first.text
    sample_output = doc.css('pre').last.text
  end
end
