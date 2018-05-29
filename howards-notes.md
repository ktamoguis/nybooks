# Refactor opportunities

- Prevent scraping the same data more than once
  - We need to know the category
  - How can we keep track??

Refactor steps:

1. Move URL constants to scraper class
2. When a user makes a valid selection
  a. Check to see if these books already exists using Book.find_by_books_category
    -if so, use them
    -if not, call scrape and pass along the category
    -when you're building your book instances, add the category to the bookhash
