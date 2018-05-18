class Books

  attr_accessor :title, :author, :description, :freshness

  @@all = []

  def initialize(bookhash)
    @title = bookhash[:title]
    @author = bookhash[:author]
    @description = bookhash[:description]
    @freshness = bookhash[:freshness]
    @@all << self
  end

  def self.create_from_collection(books_array)
    #binding.pry
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
