# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

```
  the url /api/v1/books will show all books
  for searching any book by id build the url as: /api/v1/books/:id changing the :id for the number you would like to see
  for searching a collection build the url as: /api/v1/books/collections/:collection changing the :collection for the name of the collection you would like to see
  for searching a book by title, build the url as: /api/v1/books/titles/:title changing the :title for any word you would like to be included in the title
  for searching a book by isbn, build the url as: /api/v1/books/isbn/:isbn changing the :isbn for any number you would like to be included in the isbn number
```

* Deployment instructions

* ...

```
  docker-compose build
  docker-compose run --rm --service-ports library