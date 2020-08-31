# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| family_name    | string  | null: false |
| first_name     | string  | null: false |
| family_reading | string  | null: false |
| first_reading  | string  | null: false |
| birth_year     | integer | null: false |
| birth_month    | integer | null: false |
| birth_day      | integer | null: false |
### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| name         | string     | null: false                    |
| image        | text       | null: false                    |
| price        | integer    | null: false                    |
| description  | text       | null: false                    |
| genre        | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| delivery_day | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## delivery_address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| purchase_id  | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |


### Association

- belongs_to :purchase