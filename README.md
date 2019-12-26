## アプリケーション
HurryApp
http://18.176.213.183/

## 概要
野球やサッカーといったスポーツ観戦の際にドリンクを注文するためのアプリケーションです。ドームや競技場等、座席番号が割り振られている会場を想定しています。

## 機能一覧
* ユーザーの新規会員登録、ログイン機能
* 注文機能
* レビュー機能
* 管理者機能

## Demo

ログイン画面  
![demo1](https://user-images.githubusercontent.com/56751063/71395536-b4791380-2659-11ea-91c2-63c37020506f.jpg)
![demo11](https://user-images.githubusercontent.com/56751063/71395229-6d3e5300-2658-11ea-8e7e-ca6ff46f7fbe.jpg)

新規登録画面にて名前、メールアドレス、パスワードを入力でユーザー登録できる  
新規登録時、自動でユーザーIDが生成される  
![demo10](https://user-images.githubusercontent.com/56751063/71395057-afb36000-2657-11ea-88db-1c931c981ce6.jpg)

トップページ全体図、新規会員登録時に自動生成されたユーザーIDが画面右上に表示される  
![demo2](https://user-images.githubusercontent.com/56751063/71317874-97163f00-24cb-11ea-9064-d1cbcf847e65.jpeg)

ヘッダーの**注文する**から注文画面へ  
![demo3](https://user-images.githubusercontent.com/56751063/71318249-b3b57580-24d1-11ea-81ee-7134d4534d5a.jpg)

注文完了後、ホーム画面に戻るかレビューできる  
![demo4](https://user-images.githubusercontent.com/56751063/71317878-a09fa700-24cb-11ea-823f-67d843a8b73a.jpg)

運営アカウントでログイン  
![demo5](https://user-images.githubusercontent.com/56751063/71317880-a39a9780-24cb-11ea-9b2a-c3ab0d52d790.jpg)

ヘッダーの**オーダー**から注文がみれる  
![demo6](https://user-images.githubusercontent.com/56751063/71323135-37438680-2513-11ea-9010-6a72b0473506.png)

オーダーから**提供完了画面へ**進むと、提供完了できる  
![demo8](https://user-images.githubusercontent.com/56751063/71323138-3a3e7700-2513-11ea-8855-27d5f97cc625.png)

オーダーから**提供完了済み**のオーダーを見れる  
![demo9](https://user-images.githubusercontent.com/56751063/71323211-f9932d80-2513-11ea-811a-11061142c3fc.png)

ヘッダーの**レビュー確認**からレビュー履歴がみれる  
![demo7](https://user-images.githubusercontent.com/56751063/71317883-a6958800-24cb-11ea-9294-331b74fa0afc.png)



## 開発予定の機能
* 注文確認画面の実装
* 注文、レビュー履歴の並び替え機能
* 注文の通知機能



## データベース

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|userid|integer|null: false|

#### Association
- has_many  :orders
- has_many  :reviews


### reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|rate|integer|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to  :user


### ordersテーブル
Column|Type|Options|
|------|----|-------|
|seat|string|null: false|
|food|string|null: false|
|drink|string|null: false|
|salesperson|string|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many :foods
- has_many :drinks
- has_many :salespersons


### foodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|

#### Association
- has_many :orders


### drinksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|string|

#### Association
- has_many :orders


### salespersonsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|

#### Association
- has_many :orders


### notificationテーブル
Column|Type|Options|
|------|----|-------|
|visitor_id|integer|null: false|
|visited_id|integer|null: false|
|order_id|integer|
|review_id|integer|
|action|string|default: '', null: false|
|checked|boolean|default: false, null: false|

#### Association
- belongs_to :order
- belongs_to :review
- belongs_to :visitor
- belongs_to :visited