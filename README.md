# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| mail             | string | null: false |
| password         | string | null: false |

### Association

- has_many :companies
  has_many :bookmarks 
  has_many :orders 

## companies テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| companies_name        | string     | null: false       |
| postal_code           | string     | null: false       |
| prefecture_id         | integer    | null: false       |
| companies_city        | string     |                   |
| companies_address     | string     |                   |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
  has_many :project_cases
- has_one :companies_detail

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

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
  has_one :companies_type

## companies_types テーブル
| industry_type_1_id    | integer    | null: false       |
| industry_type_2_id    | integer    |                   |
| industry_type_3_id    | integer    |                   |
| companies_detail      | references | foreign_key: true |

### Association

- belongs_to :companies_detail
  has_one :companies_correspondence

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry_type

## companies_correspondences テーブル
| prefecture_id      | integer    | null: false       |
| companies_type     | references | foreign_key: true |

### Association

- belongs_to :companies_type
  has_one :companies_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :license
  belongs_to :tool

## project_cases テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| project_case_name          | string     | null: false       |
| project_address_prefecture | integer    | null: false       |
| project_address_city       | string     |                   |
| project_address_address    | string     |                   |
| image                      | image      |                   |
| project_case_pr            | text       | null: false       |
| company                    | references | foreign_key: true |

### Association

  belongs_to :company
  has_many :likes
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

## likes テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| project_cases              | references | foreign_key: true |
| user                       | references | foreign_key: true |

### Association

  belongs_to :project_cases
  belongs_to :user

## orders テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| order_title                | string     | null: false       |
| order_prefecture_id        | integer    | null: false       |
| order_city                 | string     |                   |
| order_address              | string     |                   |
| order_delivery_date_first  | date       | null: false       |
| order_delivery_date_end    | date       | null: false       |
| industry_type_id           | integer    | null: false       |
| division                   | integer    | null: false       |
| unit_price                 | integer    | null: false       |
| budget                     | numeric    | null: false       |
| payments_id                | integer    | null: false       |
| order_pr                   | text       | null: false       |
| user                       | references | foreign_key: true |

### Association

  belongs_to :user
  has_many :bookmarks

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :industry_type
  belongs_to :payments

## supports テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| support_title              | string     | null: false       |
| support_prefecture_id      | integer    | null: false       |
| support_city               | string     |                   |
| support_address            | string     |                   |
| support_delivery_date_first| date       | null: false       |
| support_delivery_date_end  | date       | null: false       |
| industry_type              | integer    | null: false       |
| support_person_id          | integer    | null: false       |
| termination                | date       | null: false       |
| feature                    | integer    |                   |
| support_pr                 | text       | null: false       |
| user                       | references | foreign_key: true |

### Association

  belongs_to :user
  has_many :bookmarks

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :industry_type
  belongs_to :support_person

## bookmarks テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| user                       | references | foreign_key: true |
| user                       | references | foreign_key: true |
| user                       | references | foreign_key: true |

belongs_to :user
belongs_to :order
belongs_to :support