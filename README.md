## users テーブル

|Column            |Type  |Options                |
|------------------|------|-----------------------|
|nickname          |string|null:false             |
|email             |string|null:false,unique:true |
|encrypted_password|string|null:false             |
|first_name        |string|null:false             |
|last_name         |string|null:false             |
|first_furigana    |string|null:false             |
|last_furigana     |string|null:false             |
|birthday          |date  |null:false             |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

|Column            |Type      |Options             |
|------------------|----------|--------------------|
|name              |string    |null:false          |
|description       |string    |null:false          |
|category_id       |integer   |null:false          |
|condition_id      |integer   |null:false          |
|delivery_fee_id   |integer   |null:false          |
|shipment_source_id|integer   |null:false          |
|delivery_time_id  |integer   |null:false          |
|price             |integer   |null:false          |
|user              |references|foreign_key: true   |              

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

|Column   |Type      |Options          |
|---------|----------|-----------------|
|user     |references|foreign_key: true|  
|item     |integer   |foreign_key: true|               

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル  

|Column       |Type   |Options    |
|-------------|-------|-----------|
|postal_code  |integer|null:false |
|prefecture_id|integer|null:false |
|municipality |string |null:false |
|address      |string |null:false |
|building     |string |           |
|phone_number |integer|null:false |

### Association
- belongs_to :purchase_record
