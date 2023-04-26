class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [date, book, person]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
