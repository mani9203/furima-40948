# README

## users テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| name               | string | null: false   |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name_kana          | string | null: false |
| date_of_birth      | date   | null: false |


## items テーブル
 
| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| item_title         | string | null: false |
| user               | reference | null: false |
| explanation        | text   | null: false |
| item_category      | string | null: false |
| item_condition     | string | null: false |
| shipping_fee       | numeric | null: false |
| shipping_source    | string | null: false |
| Delivery_days      | date   | null: false |
| sells_price        | numeric | null: false |


## sells テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| buyer              | string | null: false |
| item_id            | reference | null: false |


## addless テーブル

| Colum              | Type   | Options       |
| ------------------ | ------ | ------------- |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| municipality       | string | null: false |
| block_number       | string | null: false |
| bulding_name       | string | null: false |
| telephone_number   | string | null: false |

