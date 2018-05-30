class Books

  attr_accessor :title, :author, :description, :freshness, :index, :category;

  @@all = []

  def initialize(bookhash)
    @category = bookhash[:category]
    @index = bookhash[:index]
    @title = bookhash[:title]
    @author = bookhash[:author]
    @description = bookhash[:description]
    @freshness = bookhash[:freshness]
    @@all << self
  end

  def self.find_by_books_category(category)
    all.select { |book| book.category == category }
  end

  def self.create_from_collection(books_array)
    books_array.each do |book|
      Books.new(book)
    end
  end

  def self.clear
    @@all.clear
  end

  def self.all
    @@all
  end

end
