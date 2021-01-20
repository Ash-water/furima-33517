# README

## users table
|Column     |Type       |Options                                            |
|-----------|-----------|---------------------------------------------------|
|nickname   |string     |null: false                                        |
|email      |string     |null: false, unique: true                          |
|encrypted_password |string     |null: false                            |
|last_name  |string     |null: false |
|first_name |string     |null: false |
|furi_last  |string     |null: false |
|furi_first |string     |null: false |
|item       |references |null: false, foreign_key: true                     |
|buying his |references |null: false, foreign_key: true                     |

### Association
 has_many :items
 has_many :buying_histories

 ## items table
|Column|Type           |Options                               |
|----------------------|--------------------------------------|
|item_name    |string  |null: false                           |
|price        |integer |null: false                           |
|seller_name  |string  |null: false                           |
|item_description|text |null: false
|category_id     |integer  |null: false                           |
|quality_id      |integer  |null: false                           |
|delivery_fee_id |integer  |null: false                           |
|prefecture_id |integer |null: false
|shipping_date|integer  |null: false                           |

### Association
belongs_to :user
has_one :buying_history


## buying_histories table
|Column    |Type    |Options   |
|--------- |--------|----------|
|user |references |foreign_key: true |
|items|references |foreign_key: true |

### Association
has_one :item
belongs_to :users
belongs_to :addresses 

## addresses table

|Column|Type |Options              |
|------|-----|---------------------|
|postal_code |string  |null: false |
|prefecture_id  |integer  |null: false |
|city        |string  |null: false |
|street      |string  |null: false |
|building_name |string |null: false |
|phone_number|string |null: false |


### Association
has_many :buying_histories
