require_relative('../db/Sql_Runner')


class Student

  attr_accessor :first_name, :last_name, :age, :house
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house, age)
            VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first
    return nil if student == nil
    return Student.new(student)
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def houses()
    sql = "SELECT houses.* FROM houses
           INNER JOIN students
           ON houses.id = students.house_id
           WHERE houses.student_id = $1"
    values = [@id]
    houses = SqlRunner.run(sql, values)
    return houses.map { |house| House.new( house ) }
  end

end
