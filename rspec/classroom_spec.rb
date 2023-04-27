require_relative 'helper_spec'

describe Classroom do
  before :each do
    @student1 = Student.new(25, 'Maximilianus', true)
    @student2 = Student.new(13, 'Zeus', false)
    @student3 = Student.new(19, 'Poseidon', true)
    @classroom = Classroom.new('Frontend')
  end

  describe "classroom creation" do
    it 'creates an instance of the Classroom class' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'sets the label to the given argument' do
      expect(@classroom.label).to eq 'Frontend'
    end
  end

  describe "adding students to the classroom" do
    it 'starts with an empty student array' do
      expect(@classroom.students.length).to eq 0
    end

    it 'allows adding a student to the classroom' do
      @classroom.add_student(@student1)
      expect(@classroom.students.length).to eq 1
    end

    it 'does not allow adding a duplicate student to the classroom' do
      @classroom.add_student(@student1)
      @classroom.add_student(@student1)
      expect(@classroom.students.length).to eq 1
    end

    it 'allows adding multiple different students to the classroom' do
      @classroom.add_student(@student1)
      @classroom.add_student(@student2)
      @classroom.add_student(@student3)
      expect(@classroom.students.length).to eq 3
    end
  end
end
