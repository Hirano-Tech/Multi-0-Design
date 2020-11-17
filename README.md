# Multi-0-Design
- 名称：Multi-0-Design
- ふりがな：まるちでざいん
- 本番環境：https://multi-0-design.herokuapp.com

## 概要

<img src="https://user-images.githubusercontent.com/63486456/99386125-501c0e00-2915-11eb-9a8e-497eb46ca0f9.png" width="50%">

### 使用している技術

### フロントエンド

- HTML5
- CSS3（Sass）
- JavaScript（jQuery）

### バックエンド

- Ruby 2.5.1
- Ruby on Rails 5.2.4.4
  - pry-rails：デバッグに使用するために導入しています。
  - jquery-rails：jQuery を導入するために実装しています。
  - friendly_id：インフルエンサー毎の詳細ページの URL を名前で表示するために実装しています。
  - kaminari：ページネーション機能のために実装しています。
- MySQL 14.14（ローカル環境）
- PostgreSQL（本番環境）

### インフラ

- Heroku
- Amazon Web Service（Simple Storage Service）

## なぜ、このアプリケーションを制作したのか？

- 前職での小売業（販売）の経験から、ファッション系の E-Commerce のようなアプリケーションを制作しようと考えました。
- 現在では、雑誌に掲載されるモデルのスタイリングから探すことよりも YouTube や Instagram といったインフルエンサー（一般人）が投稿・配信している画像・動画を見て購入している消費者が増えている。なので、インフルエンサーの投稿と商品とを紐付けるキュレーションメディアとして一般人の発信をまとめることで検索しないと見つけることが難しいふつうの人の着こなしにかんたんに巡り合うことができるアプリケーションです。

## データベース（MySQL）設計

### influencers
| カラム名 | 型 |
----|----|
| name | string |
| gendar | string |
| header | binary |
| icon | binary |
| twitter | string |
| instagram | string |
| youtube | string |

### products
| カラム名 | 型 |
----|----|
| name | string |
| brand | string |
| image | binary |
| distributor | string |
| influencer_id | bigint |

## こだわりポイント

<img src="https://user-images.githubusercontent.com/63486456/99390776-9163ec00-291c-11eb-91cb-44d6e9f4a1db.png" width="50%">
