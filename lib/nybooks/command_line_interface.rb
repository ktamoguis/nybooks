class Nybooks::CommandLineInterface

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
      if input.upcase == "EXIT"
      elsif input.to_i > 0 and input.to_i < 5
        puts "---Please wait for the list to load..---"
        case input.to_i
        when 1
          puts "NY Times Bestseller List: Hardcover Fiction"
        when 2
          puts "NY Times Bestseller List: Hardcover NonFiction"
        when 3
          puts "NY Times Bestseller List: Print and E-Book Fiction"
        when 4
          puts "NY Times Bestseller List: Print and E-Book NonFiction"
        end
        puts "------------------------------------------------------"
        generate_book_list(input)
        display_list(input)
        second_menu(input)
      elsif input.to_i == 5
      else
        main_menu
      end
    end


    def second_menu(book_category)
      puts "Select book no. or Type 'Menu' to return to main menu or Type 'Exit'"
      input = gets.strip
      if input.upcase == "MENU"
        main_menu
      elsif input.to_i > 0 && input.to_i <= Nybooks::Books.all.size
        select_a_book(book_category,input.to_i - 1)
      elsif input.upcase != "EXIT"
        second_menu(book_category)
      end
    end

    def generate_book_list(category_selection)
      if Nybooks::Books.find_by_books_category(category_selection) == []
        booklist = Nybooks::Scraper.scrape_page(category_selection)
        Nybooks::Books.create_from_collection(booklist)
      end
    end

    def display_list(book_category)
      Nybooks::Books.find_by_books_category(book_category).each_with_index do |book, index|
        puts "#{index + 1}. #{book.title}"
      end
    end


    def select_a_book(book_category, book_number)
      Nybooks::Books.find_by_books_category(book_category).each_with_index do |book, index|
        if book.index == book_number
          puts "---------------------------------------------"
          puts "Rank: #{index + 1}"
          puts "Freshness: #{book.freshness}"
          puts "Title: #{book.title}"
          puts "Author: #{book.author}"
          puts "Description: #{book.description.strip}"
          puts "--------------------------------------------"
        end
      end
      second_menu(book_category)
    end

    def goodbye
      puts "Thanks for checking the list(s). Goodbye!"
    end

end
