require 'nokogiri'
require 'pry'

class CommandLineInterface

  BASEPATH1 = "https://www.nytimes.com/books/best-sellers/hardcover-fiction/"
  BASEPATH2 = "https://www.nytimes.com/books/best-sellers/hardcover-nonfiction/"
  BASEPATH3 = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/"
  BASEPATH4 = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-nonfiction/"


    def run
      main_menu
      goodbye
    end

    def main_menu
      puts "Welcome to New York Times Best Seller Books:"
      puts "Please select item number below:"
      puts "1. Hardcover Fiction"
      puts "2. Hardcover NonFiction"
      puts "3. Print and E-Book Fiction"
      puts "4. Print and E-Book NonFiction"
      puts "5. Exit"
      input = gets.strip
      #binding.pry
      case input.to_i
      when 1 #Hardcover fiction
        puts "NY Times Bestseller List: Hardcover Fiction"
        puts "-------------------------------------------"
        generate_book_list(BASEPATH1)
        display_list
        second_menu
      when 2 #Hardcover nonfiction
        puts "NY Times Bestseller List: Hardcover NonFiction"
        puts "----------------------------------------------"
        generate_book_list(BASEPATH2)
        display_list
        second_menu
      when 3 #Combined fiction
        puts "NY Times Bestseller List: Print and E-Book Fiction"
        puts "--------------------------------------------------"
        generate_book_list(BASEPATH3)
        display_list
        second_menu
      when 4 #Combined nonfiction
        puts "NY Times Bestseller List: Print and E-Book NonFiction"
        puts "----------------------------------------------------"
        generate_book_list(BASEPATH4)
        display_list
        second_menu
      when 5
      else
          main_menu
      end
    end

    def second_menu
      puts "Type 'Exit' or press '1' to return to main menu"
      input = gets.strip

      if input.to_i == 1
        main_menu
      elsif input != "Exit"
        second_menu
      end

    end

    def generate_book_list(path)
      booklist = Scraper.scrape_page(path) #array of hashes
      Books.clear
      Books.create_from_collection(booklist)
    end

    def display_list
      i = 1
      Books.all.each do |book|
        puts "Rank: #{i}"
        puts "Freshness: #{book.freshness}"
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts "Description: #{book.description.strip}"
        puts "--------------------------------------------"
        i +=1
      end
    end

    def goodbye
      puts "Thanks for checking the list(s). Goodbye!"
    end

end
