class Scraper

  def self.scrape_page(url)
    puts "SCRAAAAAAAAAAPING"
    webpage = Nokogiri::HTML(open(url))
    i = 0
    books = []
    doc = webpage.css("ol.book-menu div.book-body")
    #binding.pry
    while i < doc.size do
      doc.each do |book|
        index = i
        title = doc[i].css("h2.title").text
        author = doc[i].css("p.author").text.gsub("by ","")
        description = doc[i].css("p.description").text
        freshness = doc[i].css("p.freshness").text
        books << {:index => index, :title => title, :author => author, :description => description, :freshness => freshness}
        i +=1
      end
    end
    books


    #books = doc.collect do |book, i|
    #  index = i
    #  title = doc[i].css("h2.title").text
    #  author = doc[i].css("p.author").text.gsub("by ","")
    #  description = doc[i].css("p.description").text
    #  freshness = doc[i].css("p.freshness").text
    #  {:index => index, :title => title, :author => author, :description => description, :freshness => freshness}
    #binding.pry
  end
end
