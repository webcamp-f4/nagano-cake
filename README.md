# README



# NAGANO CAKE
このアプリケーションは、DMMwebcampのチーム開発フェーズで制作したアプリケーションです。

# 初期設定
```
$ git clone https://github.com/kantouken-blacks/nagano-cake.git
$ cd nagano-cake
$ rails db:seed
$ rails s -b 0.0.0.0
```
[ローカルサーバー](http://localhost:3000)にアクセスしてご覧ください。
[管理者ログインページ]
mail：      admin@admin
password：  @admin
を入力してログインしてください。


# 実装機能
- customer
  - 会員登録・編集・退会
  - 商品の閲覧・カートに入れる・注文
  - ジャンル検索
  - 注文履歴の確認

- administrator
  - 会員情報の確認・編集
  - 商品の登録・編集・削除・非表示選択
  - ジャンル登録・編集・非表示選択
  - 注文履歴の確認・進捗ステータスの変更


# 開発環境
- Ruby 2.5.7
- Rails 5.2.4.1
- SQlite3 1.4.2
- HTML5
- CSS3
- Gems
  - Bootstrap4
  - jQuery-rails
  - kaminari
  - devise

# チーム名：　F4　
 ・F卓のチームに集まった男４人！
 ・漫画・ドラマで有名な、「花より男子」のF４を　モデルにそのまま命名しました！
 ・仲良くなんでも話せるチームです！
-
-rin0207
-管理者画面・管理者機能担当
-
-RITSUYA2020
-EC画面・EC機能担当
-
-room110
-EC画面・EC機能担当
