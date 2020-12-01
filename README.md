# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| mail             | string | null: false |
| password         | string | null: false |

### Association

- has_many :companies



## companies テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| companies_name        | string     | null: false       |
| postal_code           | string     | null: false       |
| prefecture_id         | integer    | null: false       |
| companies_city        | integer    |                   |
| companies_address     | integer    |                   |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_one:companies_detail

## companies_details テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| image              | image      |                   |
| division           | integer    | null: false       |
| representative     | integer    | null: false       |
| phone_number       | string     | null: false       |
| url                | string     |                   |
| capital            | numeric    | null: false       |
| establishment      | date       | null: false       |
| employee           | integer    | null: false       |
| description        | text       | null: false       |
| company            | references | foreign_key: true |

### Association

- belongs_to :company
  has_one_attached :image
  has_one:companies_type

## companies_types テーブル
| industry_type_1    | integer    | null: false       |
| industry_type_2    | integer    |                   |
| industry_type_3    | integer    |                   |
| companies_detail   | references | foreign_key: true |

### Association

- belongs_to :companies_detail
  has_one:companies_correspondence

## companies_correspondences テーブル
| prefecture_id      | integer    | null: false       |
| companies_type     | references | foreign_key: true |

### Association

- belongs_to :companies_type
  has_one:companies_status

## companies_statuses テーブル
| status                   | integer    | null: false       |
| insurance_1              | integer    |                   |
| insurance_2              | integer    |                   |
| insurance_3              | integer    |                   |
| license_id               | integer    |                   |
| tool_id                  | integer    |                   |
| companies_pr             | text       |                   |
| companies_correspondence | references | foreign_key: true |

### Association

  belongs_to :companies_correspondence
