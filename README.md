# README

## users テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| name               | string | null: false   |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana          | string | null: false |
| date_of_birth      | date   | null: false |

### アソシエーション
has_many: items
has_many: sells



## items テーブル
 
| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| item_title         | string | null: false |
| user               | reference | null: false, foreign_key: true  |
| explanation        | text   | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_id    | integer | null: false |
| shipping_source_id | integer | null: false |
| delivery_day_id    | integer | null: false |
| sells_price        | integer | null: false |

belong_to :user


## sells テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| buyer              | string | null: false |
| item_id            | reference | null: false |

belong_to :user


## addlesses テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| post_code          | string | null: false |
| shipping_source_id | string | null: false |
| municipality       | string | null: false |
| block_number       | string | null: false |
| bulding_name       | string |             |
| telephone_number   | string | null: false |
| sell _id           | refernce | null:false, foreign_key: true|

