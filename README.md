## アプリの説明

### アプリ名
『FD-TUBE』

<br>

![infra_pic](https://dl.dropboxusercontent.com/s//00qysma1gtwn96o/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-11-29%2010.41.59.png?dl=0)


### アプリの概要
災害現場の映像・経験・知見をオンラインで共有し、職員のスキルアップと地域の防災力向上へつなぐアプリケーションです。

### URL
http://ecs-fd-tube-app-alb-242793914.ap-northeast-1.elb.amazonaws.com/

### 作った理由
近年、建築技術や車両・製品の品質向上により災害発生件数が減少している中、若手職員の経験不足を少しでも解消し、管内の消防力向上を目的として制作しました。<br>
災害映像などの動画を投稿し、コメント機能で具体的な活動内容や改善点などの意見交換・議論をオンラインで行い、全職員で知識・経験の共有に繋げます。

<br>

## 使用技術
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
- RSpec 3.10.1
- Rubocop 1.22.3

<br>

## インフラ構成図
<br>

![infra_pic](https://dl.dropboxusercontent.com/s/wad853fzpv0h2dh/%20%28New%29PF%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E6%A7%8B%E9%80%A0%E5%9B%B3.drawio.png?dl=0)

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
- ログイン機能（gem:device）
- 動画投稿機能（管理者のみ）
- 動画視聴（ストリーミング再生）
- コメント機能(vue.js)
- 動画検索機能(gem:ransack)
