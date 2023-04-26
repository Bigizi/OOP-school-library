require_relative 'person'
require 'json'

# student inherits from person
class Student < Person
  attr_reader :classroom
  attr_accessor :type

  # constructor
  def initialize(classroom, age, name, parent_permission, type = 'Student')
    super(age, name, parent_permission)
    @classroom = classroom
    @type = type
  end

  # Mehod to play
  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [age, name, @parent_permission]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
