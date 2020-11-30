## users テーブル

|Column      |Type  |Options                 |
|------------|------|------------------------|
|nickname    |string|null:false              |
|mail_address|string|null:false              |
|password    |string|null:false              |
|name        |string|null:false, unique: true|
|furigana    |string|null:false              |
|birthday    |string|null:false              |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

|Column          |Type      |Options                    |
|----------------|----------|---------------------------|
|image           |string    |null:false                 |
|name            |string    |null:false                 |
|description     |string    |null:false                 |
|category        |string    |null:false                 |
|condition       |string    |null:false                 |
|delivery_fee    |string    |null:false                 |
|shipment_source |string    |null:false                 |
|delivery_time   |string    |null:false                 |
|price           |string    |null:false                 |
|user_id         |references|foreign_key: true          |              

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

|Column   |Type      |Options          |
|---------|----------|-----------------|
|user_id  |references|foreign_key: true|                 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル  

|Column       |Type  |Options    |
|-------------|------|-----------|
|postal_code  |string|null:false |
|prefectures  |string|null:false |
|municipality |string|null:false |
|address      |string|null:false |
|phone_number |string|null:false |

### Association
- belongs_to :purchase_record
