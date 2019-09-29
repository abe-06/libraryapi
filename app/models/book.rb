class Book < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :isbn
  validates_presence_of :price
  validates_presence_of :description
  validates_presence_of :genre
  validates_presence_of :collection
  validates_uniqueness_of :collection, scope: [:author, :title]
  validates_uniqueness_of :isbn
  validates_uniqueness_of :title, scope: :author
  
  validate :isbn_length

  def isbn_length

    len = isbn.to_s.length
    if len != 10 && len != 13
      errors.add(:isbn, "isbn must have either 10 or 13 numbers") 
    end
    
  end

end
