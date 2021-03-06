require_relative('../db/sqlrunner')

class AnimalType

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO animal_types(name)
          VALUES ($1)
          RETURNING id"
    result = SqlRunner.run(sql, [@name])
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM animal_types"
    values = []
    result = SqlRunner.run(sql, values)
  end

end
