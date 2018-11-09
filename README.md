# メッセージ更新方法

１. [Slack設定ページ](https://isdl2018.slack.com/admin/settings)からログデータをエクスポートする
    - `Export date range` は `Entire workspace history`

２. エクスポートしたログデータをサーバに送る
    - `scp -r [送信するディレクトリのパス].zip isdl-light-global:~/messages.zip`
    - `scp -r [送信するディレクトリのパス].zip isdl-light-local:~/messages.zip`
      - ↓sshのconfigファイルの中身

```
Host isdl-light-local
  HostName 172.20.11.97
  User isdl-light

Host isdl-light-global
  HostName 157.7.129.202
  User isdl-light
  Port 46022
```

３. `/Users/isdl-light/Server/past-slack-api/log/slack/messages` 内のデータを全て削除

４. 送信したエクスポートデータを `/Users/isdl-light/Server/past-slack-api/log/slack/messages` に移動する

５. エクスポートデータを解凍する
   - `open [エクスポートしたデータ名].zip`

６. 不要なファイルを削除
   - `rm *.json`
   
７. プロジェクトのルートディレクトリ `/Users/isdl-light/Server/past-slack-api` に移動する

８. DBに保存されている過去のメッセージを全部削除する
   - `rails db:drop && rails db:create && rails db:migrate`
   
９. チャンネル一覧を作成する
   - `rails channel:update_public`

１０. メッセージ更新コマンドを実行する
   - `rails message:update`
