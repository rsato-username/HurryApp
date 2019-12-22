# README

## アプリケーション
HurryApp

## 概要
野球やサッカーの競技場ような座席番号がある会場で注文することを想定したアプリケーション

## 機能一覧
* ユーザーの新規会員登録、ログイン機能
* 注文機能
* レビュー機能

## Demo
* テストアカウント(1)
**ユーザー名**
test
**ユーザーID**
7065877
**メールアドレス**
test@test.com
**パスワード**
test12345

* テストアカウント(2)
**ユーザー名**
host
**ユーザーID**
2215470
**メールアドレス**
host@host.com
**パスワード**
host12345


* テストアカウント(1)でログイン
![demo1.jpg]

トップページ
![demo2.jpeg]

ヘッダーの**注文する**から注文画面へ
![demo3.jpg]

注文終了後、ホーム画面に戻るかレビューできる
![demo4.jpg]

* テストアカウント(2)でログイン
![demo5.jpg]

ヘッダーの**オーダー**から注文履歴がみれる
![demo6.jpg]

ヘッダーの**レビュー確認**からレビュー履歴がみれる
![demo7.jpg]




## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|customerid|integer|null: false|

### Association
- has_many  :orders
- has_many  :reviews


## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|rate|integer|null: false|
|customer_id|references|null: false, foreign_key: true|

### Association
- belongs_to  :user


## ordersテーブル
Column|Type|Options|
|------|----|-------|
|seat|string|null: false|
|food|string|null: false|
|drink|string|null: false|
|salesperson|string|null: false|
|customer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :foods
- has_many :drinks
- has_many :salespersons


## foodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|

### Association
- has_many :orders


## drinksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|string|

### Association
- has_many :orders


## salespersonsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|

### Association
- has_many :orders


## notificationテーブル
Column|Type|Options|
|------|----|-------|
|visitor_id|integer|null: false|
|visited_id|integer|null: false|
|order_id|integer|
|review_id|integer|
|action|string|default: '', null: false|
|checked|boolean|default: false, null: false|

### Association
- belongs_to :order
- belongs_to :review
- belongs_to :visitor
- belongs_to :visited