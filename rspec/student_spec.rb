require_relative 'helper_spec'

describe Student do

  before :each do
      @student = Student.new(23,"John", true)
      @class1 = Classroom.new('Basic test')
  end
  
  describe "#new" do
    it "returns a new Student object" do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe "#age" do
    it "returns the student's age" do
      expect(@student.age).to eql 23
    end
  end

  describe "#name" do
    it "returns the student's name" do
      expect(@student.name).to eql "John"
    end
  end

  describe "#parent_permission" do
    it "returns the parent's permission" do
      expect(@student.parent_permission).to be true
    end
  end

  describe "#add_classroom" do
    it "adds the classroom to the student and returns the classroom's label" do
      @student.add_classroom(@class1)
      expect(@student.classroom.label).to eq "Basic test"
    end
  end

end
