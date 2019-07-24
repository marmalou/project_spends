require_relative('../db/sql_runner')
require_relative('./type.rb')
require_relative('./merchant.rb')

class Transaction

  attr_reader :type_id, :merchant_id, :cost

  def initialize(options)
    @type_id = options['type_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @cost = options['cost'].to_i

  end

  def save()
    sql = "INSERT INTO transactions
    (
      type_id,
      merchant_id,
      cost
    ) VALUES
    (
      $1, $2 , $3
    ) RETURNING *"

    values = [@type_id, @merchant_id, @cost]
    merchant = SqlRunner.run(sql, values).first
    @merchant_id = merchant['id'].to_i
  end

  def self.find( id )
  sql = "SELECT * FROM transactions
  WHERE id = $1"
  values = [id]
  transaction = SqlRunner.run( sql, values )
  result = Transaction.new( transaction.first )
  return result
end

  def update
    sql = "UPDATE transactions
           SET funds = $1,
           name = $2
           WHERE id = $3"
    values = [@type_id, @merchant_id, @cost]
    SqlRunner.run(sql, values)
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE id =$1"
    values = [@merchant_id]
    merchant = SqlRunner.run( sql, values)
    result = Merchant.new( merchant.first)
    return result
 end

 def self.total_cost
   sql = "SELECT * FROM transactions"
   transactions = SqlRunner.run(sql)
   amount = 0
   total = transactions.map { |single_transaction|
   Transaction.new(single_transaction).cost}
   for single_amount in total
   amount += single_amount
 end
 return amount
end

 def type
  sql = "SELECT * FROM types
  WHERE id = $1"
  values = [@type_id]
  type = SqlRunner.run( sql, values )
  result = Type.new( type.first )
  return result

end


def self.all()
    sql = "SELECT * FROM transactions"
    transaction_data = SqlRunner.run(sql)
    return Transaction.map_items(transaction_data)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  #Helper method for mapping
  def self.map_items(transaction_data)
    result = transaction_data.map { |transaction| Transaction.new( transaction ) }
    return result
  end

end
