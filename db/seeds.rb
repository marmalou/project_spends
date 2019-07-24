require_relative( '../models/merchant' )
require_relative( '../models/transaction' )
require_relative( '../models/type' )
require( 'pry-byebug' )


Merchant.delete_all()
Transaction.delete_all()
Type.delete_all()


merchant1 = Merchant.new({'name' => 'Amazon'})
merchant1.save()
merchant2 = Merchant.new({'name' => 'Scottish Power'})
merchant2.save()
merchant3 = Merchant.new({'name' => 'Zara'})
merchant3.save
merchant4 = Merchant.new({'name' => 'Sainsbury'})
merchant4.save
merchant5 = Merchant.new({'name' => 'Mcqueens Dairy'})
merchant5.save
merchant6 = Merchant.new({'name' => 'Cameo cinema'})
merchant6.save


type1 = Type.new({'name' => 'Entertainment'})
type1.save()
type2 = Type.new({'name' => 'Utilities'})
type2.save()
type3 = Type.new({'name' => 'clothing'})
type3.save()
type4 = Type.new({'name' => 'food'})
type4.save()
type5 = Type.new({'name' => 'milk'})
type5.save()
type6 = Type.new({'name' => 'entertainment'})
type6.save()



transaction1 = Transaction.new({
  'type_id' => type1.id,
  'merchant_id' => merchant1.id,
  'cost' => 12
  })


transaction1.save()


transaction2 = Transaction.new({
  'type_id' => type2.id ,
  'merchant_id' => merchant2.id,
  'cost' => 30
  })

  transaction2.save()

transaction3 = Transaction.new({
  'type_id' => type3.id ,
  'merchant_id' => merchant3.id,
  'cost' => 50
  })

  transaction3.save()

transaction4 = Transaction.new({
  'type_id' => type4.id ,
  'merchant_id' => merchant4.id,
  'cost' => 100
  })

  transaction4.save()

transaction5 = Transaction.new({
  'type_id' => type5.id ,
  'merchant_id' => merchant5.id,
  'cost' => 8
  })

  transaction5.save()

transaction6 = Transaction.new({
  'type_id' => type6.id ,
  'merchant_id' => merchant6.id,
  'cost' => 12
  })

  transaction6.save()
