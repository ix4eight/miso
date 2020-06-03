# README
## miso
<br>
  <img src="https://misoix4eight.herokuapp.com" width="600x600"><br>

# 概要


# 本番環境


# テストユーザー


# 工夫したポイント


# これからしていきたい実装



# 使用技術(開発環境)
- Ruby 2.5.1
- Rails 5.2.3
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 4.3.5
- heroku 4
- Github

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
### Association
belongs_to :applications

## applicationsテーブル
|Column|Type|Options|
|------|----|-------|
|twitter|integer|null: false|
|line|integer|null: false|
|instagram|integer|null: false|
|discord|integer|null: false|
|steam|integer|null: false|
|skype|integer|null: false|
|user|references|foreign_key: true|

### Association
belongs_to :user
