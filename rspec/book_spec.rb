require_relative 'helper_spec'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(20, 'Harry')
  end

  describe "#new" do
    it "returns a new instance of the Book class" do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe "#title" do
    it "returns the book's title" do
      expect(@book.title).to eql "Title"
    end
  end

  describe "#author" do
    it "returns the book's author" do
      expect(@book.author).to eql "Author"
    end
  end

  describe "#add_rental" do
    it "adds a new rental for the book" do
      @book.add_rental('2023-03-15', @person)
      expect(@book.rental[0].date).to eql '2023-03-15'
    end

    it "raises an ArgumentError when called without a person argument" do
      expect { @book.add_rental('2023-03-15') }.to raise_error(ArgumentError)
    end
  end
end
