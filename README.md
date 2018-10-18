## Userテーブル
|Column|Type|Options|
|------|----|-------|
|id|int|null:false|
|name|string|null:false|
|name(kana)|string|null:false|
|e-mail|string|unique:true,null:false|
|password|string|null:false|

## User_Items
|Column|Type|Options|
|------|----|-------|
|id|int|unique:true|
|user_id|int|foreign_key:true,null:false|
|item_id|int|foreign_key:true,null:false|

## Item
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|name|string|null:false,index:true|
|price|int|null:false|
|company|string|null:false|
|explanation|text|null:false|

## Review
|Column|Type|Options|
|------|----|-------|
|id|int|null:false,unique:true|
|text|text|null:false|
|title|string|null:false|
|rank|int|null:false|
|user_id|int|null:false,foreign_key:true|
|item_id|int|null:false,foreign_key:true|

##

