## 名称
Tasuki
Task :仕事　＋　suki:好き　とを掛けて襷という繋がりを持たせるという意味合いで命名しました

## アプリの概要
建築業界の仕事を探す・登録する、協力業者を探す・登録する、施工事例を探す・登録するの3つを1つのアプリにまとめました。<br>
未実装ですが、仕事を登録する際にチケット制を導入することで、当日に連絡がつかないなどの現場で発生する問題を防ごうと考えています。

##  利用方法
仕事を探す・登録する機能による検索機能の実装<br>
案件をアップロードすることで、直接技術内容を確認できるコメントフォームの実装<br>
案件に応募する際のチケット制、断られた場合は即返金されます<br>
応募に対して発注があった場合、施工日まで金額は返金されず、<br>
実際の施工をしたと確認がとれた場合、返金される、個々人の評価を導入します<br>
評価システムにより、次回の案件登録料についてのランクが決定され、登録金額が下がります

## 目指した課題解決
先に登録金額を払う事で、心理的にも行かなければいけないを作り、従来の当日に連絡がつかないなどを機能的に防ぎます。<br>
請負ったらその責務を果たすという当たり前が、当たり前にできるようなる社会を作るための方法を考えました

アプリのURL:http://175.41.234.188/<br>
GitHubのURL:https://github.com/tetutetu214/tasukigake

## 洗い出した要件　機能一覧
- ユーザー登録関連<br>
・新規登録、ログイン、ログアウト<br>
・簡単ログイン<br>
・二段階承認（未実装）<br>
・API認証（未実装）
- 登録機能(CRUD機能)<br>
・仕事、協力業者、施工事例、コメントモデル
- 検索機能<br>
・各検索機能（未実装）
- いいね機能（未実装）
- ブックマーク（未実装）
- 画像アップロード機能 <br>
・AWS S3バケット
- レスポンシブWebデザイン<br>
・bootstrap
- PAY.JP（未実装）<br>

## 使用技術
- フロントエンド<br>
・HTML/SCSS/Bootstrap<br>
・jquery
- バックエンド<br>
・Ruby 2.6.5<br>
・RubyOnRails 6.0.0
- インフラ<br>
・AWS（S3、EC2,IAM）<br>
・mysql<br>
・nginx<br>
・Capistrano<br>

サーバーサイドのロジックはRuby+RubyOnRailsでプログラミングをしています<br>
フロントエンドのデザインはBootstrapを使用しながら、動きをつけたいっときはjqueryで実装しました。<br>
AWSのEC2にCapistranoを実装し自動デプロイを実現するようにしています。

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| mail             | string | null: false |
| password         | string | null: false |

### Association

- has_many :companies
- has_many :bookmarks 
- has_many :orders 

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
- has_many :project_cases
- has_one :companies_detail

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

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
- has_one_attached :image
- has_one :companies_type

## companies_types テーブル
| industry_type         | text       | null: false       |
| companies_detail      | references | foreign_key: true |

### Association

- belongs_to :companies_detail
- has_one :companies_correspondence

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :industry_type

## companies_correspondences テーブル
| prefecture_id      | integer    | null: false       |
| companies_type     | references | foreign_key: true |

### Association

- belongs_to :companies_type
- has_one :companies_status

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

## companies_statuses テーブル
| status                   | integer    | null: false       |
| insurance                | text       |                   |
| license_id               | integer    |                   |
| tool_id                  | integer    |                   |
| companies_pr             | text       |                   |
| companies_correspondence | references | foreign_key: true |

### Association

- belongs_to :companies_correspondence

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :license
- belongs_to :tool

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

- belongs_to :company
- has_many :likes
- has_one_attached :image

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture

## likes テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| project_cases              | references | foreign_key: true |
| user                       | references | foreign_key: true |

### Association

- belongs_to :project_cases
- belongs_to :user

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

- belongs_to :user
- has_many :bookmarks

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture
- belongs_to :industry_type
- belongs_to :payments

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

- belongs_to :user
- has_many :bookmarks

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture
- belongs_to :industry_type
- belongs_to :support_person

## bookmarks テーブル
| Column                     | Type       | Options           |
| ---------------------      | ---------- | ----------------- |
| user                       | references | foreign_key: true |
| user                       | references | foreign_key: true |
| user                       | references | foreign_key: true |

- belongs_to :user
- belongs_to :order
- belongs_to :support
