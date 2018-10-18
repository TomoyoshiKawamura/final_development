## Userテーブル
|Column|Type|Options|
|------|----|-------|
|id|int|null:false|
|name|string|null:false|
|name(kana)|string|null:false|
|e-mail|string|unique:true,null:false|
|password|string|null:false|
