## Userテーブル
|Column|Type|Options|
|------|----|-------|
|id|int|null:false|
|name|string|null:false|
|name(kana)|string|null:false|
|e-mail|string|unique:true,null:false|
|password|string|null:false|
### Association
- has_many :Review


## User_Items
|Column|Type|Options|
|------|----|-------|
|id|int|unique:true|
|user_id|int|foreign_key:true,null:false|
|item_id|int|foreign_key:true,null:false|
### Association

## Item
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|name|string|null:false,index:true|
|price|int|null:false|
|company|string|null:false|
|explanation|text|null:false|
### Association

## Review
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|text|text|null:false|
|title|string|null:false|
|rank|int|null:false|
|user_id|int|null:false,foreign_key:true|
|item_id|int|null:false,foreign_key:true|
### Association

## Image
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|content|string|null:false|
|status|int|null:false|
|item_id|id|null:false,foreign_key:true|
### Association

## CreditCard
|Column|Type|Options|
|------|----|-------|
|id|int|unique:true,null:false|
|name|string|null:false|
|number|int|null:false,unique:true|
|deadline_month|int|null:false|
|deadline_year|int|null:false|
|user_id|int|null:false,foreign_key:true|
### Association

## Pearsonal_information
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|country|string|null:false|
|name|string|null:false|
|post_code|int|null:false|
|prefecture|string|null:false|
|address1|string|null:false|
|address2|string||
|company_name|string||
|phone_number|int|null:false|
|user_id|int|null:false,foreign_key:true|
### Association

