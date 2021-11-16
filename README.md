## アプリの説明
---

### アプリ名
『FD-TUBE』

### アプリの概要
災害現場の映像・経験・知見をオンラインで共有し、職員のスキルアップと地域の防災力向上へつなぐアプリケーションです。

### URL
http://ecs-fd-tube-app-alb-242793914.ap-northeast-1.elb.amazonaws.com/

<br>

## 使用技術
---
- Ruby 2.7.3
- Ruby on Rails 6.1.4
- Vue.js 2.6.14
- PostgreSQL
- Nginx
- Puma
- AWS
    - ECS(Fargate)
    - ECR
    - RDS
    - S3
    - Lambda
    - Elemental MediaConvert
    - CloudFront
- Docker/Docker-compose
- CircleCI
- RSpec

<br>

## インフラ構成図
---
<br>

![infra_pic](https://dl.dropboxusercontent.com/s/zh87obmaivy61fh/PF%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E6%A7%8B%E9%80%A0%E5%9B%B3.drawio%20%282%29.png)

<br>

### CI/CDについて

CircleCIを用いて以下の２点を自動化しています。

- 各ブランチへのプッシュ時にRSpecとRubocopの自動実行
- masterブランチへのプッシュ時にECRイメージとECSタスクの自動更新

### 動画ファイルの形式変換をAWSCloud上で処理　
ストリーミング再生とサムネイル生成のため、AWS上で以下の処理を行なっています。

1. railsプログラムからS3バケットへ動画ファイル（MP4形式）を保存
1. 1をトリガーに、LambdaでElementalMediaConvertの以下のジョブを自動実行
    - MP4形式のファイルをHLS形式に変換
    - サムネイルの生成
    - 上記のファイルを配信用のS3バケットへ格納

<br>

## 機能一覧
---
- ログイン機能（gem:device）
- 動画投稿機能（管理者のみ）
- 動画視聴（ストリーミング再生）
- コメント機能(vue.js)
- 動画検索機能(gem:ransack)
