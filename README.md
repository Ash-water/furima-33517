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
|date_of_birth|date     |null: false |

### Association
has_many :items
has_many :buying_history

## items table
|Column|Type           |Options                               |
|------|---------------|--------------------------------------|
|name  |string  |null: false                           |
|price        |integer |null: false                           |
|item_description|text |null: false
|category_id     |integer  |null: false                           |
|quality_id      |integer  |null: false                           |
|delivery_fee_id |integer  |null: false                           |
|prefecture_id |integer |null: false
|shipping_date_id|integer  |null: false                           |
|user |references |foreign_key: true |

### Association
belongs_to :user
has_one :buying_history


## buying_histories table
|Column    |Type    |Options   |
|--------- |--------|----------|
|user |references |foreign_key: true |
|item |references |foreign_key: true |

### Association
has_one :address
belongs_to :user
belongs_to :item

## addresses table

|Column|Type |Options              |
|------|-----|---------------------|
|postal_code |string  |null: false |
|prefecture_id  |integer  |null: false |
|city        |string  |null: false |
|street      |string  |null: false |
|building_name |string |    |
|phone_number|string |null: false |
|buying_history|references |null: false, foreign_key: true |


### Association
belongs_to :buying_histories
