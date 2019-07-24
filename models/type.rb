require_relative('../db/sql_runner')

class Type

  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']

  end

  def save
    sql = "INSERT INTO types
    (
    name

    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    type = SqlRunner.run(sql, values).first
    @id = type['id'].to_i
  end

  def self.find( id )
  sql = "SELECT * FROM types
  WHERE id = $1"
  values = [id]
  type = SqlRunner.run( sql, values )
  result = Type.new( type.first )
  return result
end


  def self.all()
    sql = "SELECT * FROM types"
    type_data = SqlRunner.run(sql)
    return Type.map_items(type_data)
  end

  def update()
    sql = "UPDATE types
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM types
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM types"
    SqlRunner.run(sql)
  end

  #Helper method for mapping
  def self.map_items(type_data)
    result = type_data.map { |type| Type.new( type ) }
    return result
  end

end
