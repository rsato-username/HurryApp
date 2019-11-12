# README


## customersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|customerid|integer|null: false|

### Association
- has_many  :orders
- has_many  :reviews


## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|rate|integer|null: false|
|customer_id|references|null: false, foreign_key: true|

### Association
- belongs_to  :customer


## ordersテーブル
Column|Type|Options|
|------|----|-------|
|seat|string|null: false|
|food|string|null: false|
|drink|string|null: false|
|salesperson|string|null: false|
|customer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :customer
- has_many :orders_foods
- has_many :foods,  through:  :orders_foods
- has_many :orders_drinks
- has_many :drinks,  through:  :orders_drinks
- has_many :orders_salespersons
- has_many :salespersons,  through:  :orders_salespersons


## foodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|

### Association
- has_many :orders_foods
- has_many :orders,  through:  :orders_foods


## orders_foodsテーブル
Column|Type|Options|
|------|----|-------|
|order_id|references|null: false, foreign_key: true|
|food_id|references|null: false, foreign_key: true|

### Association
- belongs_to :order
- belongs_to :food 


## drinksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|

### Association
- has_many :orders_foods
- has_many :orders,  through:  :orders_foods


## orders_drinksテーブル
Column|Type|Options|
|------|----|-------|
|order_id|references|null: false, foreign_key: true|
|drink_id|references|null: false, foreign_key: true|

### Association
- has_many :orders
- has_many :drinks


## salespersonsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :orders_salespersons
- has_many :orders,  through:  :orders_salespersons


## orders_salespersonsテーブル
Column|Type|Options|
|------|----|-------|
|order_id|references|null: false, foreign_key: true|
|salesperson_id|references|null: false, foreign_key: true|

### Association
- has_many :orders
- has_many :salespersons