# Skinual
「自分の肌に合った化粧品探しに悩んでいる」方向けの、みんなで作り上げる化粧品レビュー共有サービスです。
[Skinualのサイトはこちらから](https://skinual.herokuapp.com/)

## アプリを作成した背景
「自分の肌にあった化粧品を使わないと真の効果は現れない。」これは私が身をもって体験したことです。どんなに良い化粧品を使っても、どんなに高価な化粧品を使っても、自分の肌に合っていなければ無駄になってしまいます。
しかし自分の肌に合った化粧品を探すのは、なかなか難しいです。そこで、自分の肌質に合った方のレビューを参考に、より良い化粧品に出会うことができるサービス「Skinual」を作成しました。より肌が綺麗になることで、みんなが自信を持てるようにすることも目的の一つです。

## 環境
* サーバーサイド(Ruby 2.5.3, Rails 5.2.2)
* フロントエンド(JavaScript, jQuery)
* 開発環境(Docker)
* 本番環境(Heroku)
* データベース(開発環境: MySQL 5.7,本番環境: JawsDB)

## 使用機能・技術
* CI/CD(CircleCI, Heroku Pipeline)
* 単体・統合テスト(RSpec, Capybara)
* 静的解析(RuboCop)
* 認証機能(Devise)
* 管理者ページ(Rails_Admin, Cancancan)
* ページネーション(Kaminari)
* パンくずリスト(Gretal)
* 検索機能(Ransack)
* お気に入り機能(Ajax)
* カテゴリー機能(Ancestry)
* 画像アップロード(Active_strage, AWS S3)
* サイトデザイン(Bootstrap 4.3.1, Sass)


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
