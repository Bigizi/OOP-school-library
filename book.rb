require_relative 'rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals.push(Rental.new(date, person))
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [title, author]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
