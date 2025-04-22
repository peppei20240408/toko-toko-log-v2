# README

## アプリケーション名
TokoTokoLog(トコトコLog)

## 一言で言うとどんなアプリか
ユーザーの散歩体験を地図と共に記録・投稿し、共有できるアプリです。

## どんな機能があるのか
- ユーザー登録/ログイン
<!--
- 散歩体験の投稿機能：地図上の任意の場所にピン刺しが可能で、ピンに複数の画像またはコメントを紐づけることができる。
- トップページに全ての投稿を一覧表示できる
- 自分の投稿のみを一覧表示できる
- ユーザー情報（name,avatar等）を編集できる
- （Better機能）地図上のピンをクリックすると、同じ画面で画像を表示できる
-->

## 誰のどんな問題を解決するのか
- 誰の：散歩や旅行が好きな人。地図を見るのが好きな人。
- どんな課題を：人がどんな散歩体験をしているかイメージする手段が無いこと。
- どうやって解決？：どんな場所をどんな楽しみ方で散歩しているか、共有できるサービスがあれば、散歩の楽しみ方の幅を広げる機会を提供できる。

## アプリを作成する背景
街の見晴らしスポットを歩いて巡ることが趣味ですが、仕事柄まとまった休日が取れません。  
旅先の限られた時間でどこを散策したらよいか、いつも困っていました。  
現状、スポット単体の情報が集まるウェブサイトは有りますし、  
山岳であればYAMAPというアプリ、観光地であればウェブサイトやSNSによる情報が充実しています。  
ところが、無名の街にも素敵な見晴らしスポットがあるにも関わらず、それらを巡り歩いた体験を  
イメージできる手段が無かった事がきっかけです。

## データベース設計

<!--
ER図
-->

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| name               | string  | null: false |

### Association

- has_many :toko_logs
- has_many :pins

## toko_logs テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| title              | string     | null: false |
| summary            | text       | null: false |
| prefecture         | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :pins

## pins テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| pin_order          | integer    | null: false               |
| latitude           | integer    | null: false               |
| longitude          | integer    | null: false               |
| memo               | text       |                           |
| user               | references | null: false, foreign_key: true |
| toko_log           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :toko_log

<!--
## 画面遷移図
-->