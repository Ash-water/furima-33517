# README

## users table
|Column   |Type   |Options                   |
|---------|-------|--------------------------|
|nickname |string |null: false               |
|email    |string |null: false, unique: true |
|password |string |null: false               |
|pw_conf' |string |null: false               |

### Association
 has_many :items
 has_many :buying_histories

 ## items table
|Column|Type|Options                          |
|------|---------------|----------------------|
|item_name    |string  |null: false           |
|price        |integer |null: false           |
|image        |string  |null: false           |
|seller_name  |string  |null: false           |
|category     |string  |null: false           |
|quality      |string  |null: false           |
|delivery_fee |string  |null: false           |
|shipping_date| string |null: false           |

### Association
belongs_to :user
has_one :buying_history


## buying_histories table
|Column    |Type    |Options   |
|--------- |--------|----------|
|purchased |boolean |----------|

### Association
has_one :item
belongs_to :users
belongs_to :addresses 

## addresses table

|Column|Type |Options              |
|------|-----|---------------------|
|postal_code |integer |null: false |
|prefecture  |string  |null: false |
|city        |string  |null: false |
|street      |string  |null: false |
|phone_number|integer |null: false |


### Association
has_many :buying_histories
