# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false, unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| image           | string  | null: false |
| explanation     | text    | null: false |
| category        | string  | null: false |
| condition       | string  | null: false |
| shipping_charge | integer | null: false |
| shipping_area   | string  | null: false |
| shipping_days   | date    | null: false |
| price           | int     | null: false |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :shipping_informations

## shipping_informations テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| post_code        | string | null: false |
| prefectures      | string | null: false |
| municipality     | string | null: false |
| street_address   | string | null: false |
| building         | string | null: false |
| telephone_number | string | null: false |

### Association

- has_many :orders