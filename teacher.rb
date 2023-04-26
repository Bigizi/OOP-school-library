require_relative 'person'

# inherit from person
class Teacher < Person
  attr_reader :specialization

  # constructor
  def initialize(specialization, age, name, parent_permission, _type = 'Teacher')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # method to check if teacher can use services
  def can_use_services?
    true
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      'a' => [age, specialization, name]
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
