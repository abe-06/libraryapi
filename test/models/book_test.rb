require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "should not save a book without a title" do
    book = Book.new
    book.author = "test author"
    book.collection = "test collection"
    book.description = "test description"
    book.genre = "test genre"
    book.price = 100
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without title"
  end

  test "should not save a book without an author" do
    book = Book.new
    book.title = "test title"
    book.collection = "test collection"
    book.description = "test description"
    book.genre = "test genre"
    book.price = 100
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without an author"
  end

  test "should not save a book without an collection" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.description = "test description"
    book.genre = "test genre"
    book.price = 100
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without a collection"
  end

  test "should not save a book without an isbn number" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.collection = "test collection"
    book.description = "test description"
    book.genre = "test genre"
    book.price = 100
    assert_not book.save, "Book saved without an isbn number"
  end

  test "should not save a book without a price" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.collection = "test collection"
    book.description = "test description"
    book.genre = "test genre"
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without price"
  end

  test "should not save a book without a description" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.collection = "test collection"
    book.genre = "test genre"
    book.price = 100
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without a description"
  end

  test "should not save a book without a genre" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.collection = "test collection"
    book.description = "test description"
    book.price = 100
    book.isbn = "1234567897"
    assert_not book.save, "Book saved without genre"
  end

  test "should not save a book with an isbn number length different to 10 or 13" do
    book = Book.new
    book.title = "test title"
    book.author = "test author"
    book.collection = "test collection"
    book.description = "test description"
    book.genre = "test genre"
    book.price = 100
    book.isbn = 123
    assert_not book.save, "Book saved with an isbn numer length different from 10 or 13"
  end

  test "should not save a two books with the same title and author" do
    book1 = Book.new
    book1.title = "test title"
    book1.author = "test author"
    book1.collection = "test collection"
    book1.description = "test description"
    book1.genre = "test genre"
    book1.price = 100
    book1.isbn = "1234567897"
    book2 = Book.new
    book2.title = "test title"
    book2.author = "test author"
    book2.collection = "test collection2"
    book2.description = "test description2"
    book2.genre = "test genre2"
    book2.price = 101
    book2.isbn = "1234567898"
    assert_not book1.save && book2.save, "2 Books saved with the same title and author"
  end

  test "should not save a two books with the same title, author, and collection" do
    book1 = Book.new
    book1.title = "test title"
    book1.author = "test author"
    book1.collection = "test collection"
    book1.description = "test description"
    book1.genre = "test genre"
    book1.price = 100
    book1.isbn = "1234567897"
    book2 = Book.new
    book2.title = "test title"
    book2.author = "test author"
    book2.collection = "test collection"
    book2.description = "test description2"
    book2.genre = "test genre2"
    book2.price = 101
    book2.isbn = "1234567898"
    assert_not book1.save && book2.save, "2 Books saved with the same title, author and collection"
  end

end
