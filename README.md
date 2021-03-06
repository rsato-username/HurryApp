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
* 通知機能

## Demo

### テスト用アカウント
- ユーザーID: 59909091
- メールアドレス: test@test.com
- パスワード: test12345


ログイン画面  
![demo1](https://user-images.githubusercontent.com/56751063/75812521-bbe33880-5dd1-11ea-91d9-e0ce03e88e35.jpg)
![demo11](https://user-images.githubusercontent.com/56751063/75812537-c271b000-5dd1-11ea-92d0-6da1fd2375ae.jpg)

新規登録画面にて名前、メールアドレス、パスワードを入力でユーザー登録できる  
新規登録時、自動でユーザーIDが生成される  
![demo10](https://user-images.githubusercontent.com/56751063/75812535-c1d91980-5dd1-11ea-8351-5ceb454ee0f9.jpg)

トップページ全体図、新規会員登録時に自動生成されたユーザーIDが画面右上に表示される  
![demo2](https://user-images.githubusercontent.com/56751063/71625952-ec6df100-2c2d-11ea-9654-c9667ffe0b2c.jpg)

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
- has_many :active_notifications
- has_many :passive_notifications


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
|user_id|references|null: false, foreign_key: true|
|drink_id|references|null: false, foreign_key: true|
|salesperson_id|references|foreign_key: true, optional: true|

#### Association
- belongs_to :user
- has_many :foods
- has_many :orders_drinks
- has_many :drinks
- belongs_to :salespersons
- has_many :notifications


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
- has_many :orders_drinks
- has_many :orders


### orders_drinkテーブル
|Column|Type|Options|
|------|----|-------|
|order|references|foreign_key: true|
|drink|references|foreign_key: true|

#### Association
- belongs_to :order
- belongs_to :drink


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