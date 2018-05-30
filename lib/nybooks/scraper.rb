class Nybooks::Scraper

  BASEPATH1 = "https://www.nytimes.com/books/best-sellers/hardcover-fiction/"
  BASEPATH2 = "https://www.nytimes.com/books/best-sellers/hardcover-nonfiction/"
  BASEPATH3 = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/"
  BASEPATH4 = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-nonfiction/"

  def self.scrape_page(category_selection)
    case category_selection.to_i
    when 1
      url = BASEPATH1
    when 2
      url = BASEPATH2
    when 3
      url = BASEPATH3
    when 4
      url = BASEPATH4
    end

    webpage = Nokogiri::HTML(open(url))
    i = 0
    books = []
    doc = webpage.css("ol.book-menu div.book-body")
    while i < doc.size do
      doc.each do |book|
        index = i
        category = category_selection
        title = doc[i].css("h2.title").text
        author = doc[i].css("p.author").text.gsub("by ","")
        description = doc[i].css("p.description").text
        freshness = doc[i].css("p.freshness").text
        books << {:category => category, :index => index, :title => title, :author => author, :description => description, :freshness => freshness}
        i +=1
      end
    end
    books

  end
end
