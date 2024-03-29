require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']

  end

  def save
    sql = "INSERT INTO merchants
    (
    name

    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    merchant = SqlRunner.run(sql, values).first
    @id = merchant['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM merchants"
    merchant_data = SqlRunner.run(sql)
    return Merchant.map_items(merchant_data)
  end

  def self.find( id )
  sql = "SELECT * FROM merchants
  WHERE id = $1"
  values = [id]
  merchant = SqlRunner.run( sql, values )
  result = Merchant.new( merchant.first )
  return result
end

def update
  sql = "UPDATE merchants
         SET name = $1
         WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end


def self.delete(id)
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  #Helper method for mapping
  def self.map_items(merchant_data)
    result = merchant_data.map { |merchant| Merchant.new( merchant ) }
    return result
  end

end
