# simple-imap-client

🛐🛐🛐 IMAPクライアントをRubyで実装してみる！  

## 実行方法

```shell
docker build -t simple-imap-client .
docker run -it --rm simple-imap-client
```

## シークレット情報

GitHub ActionsのSecretsに以下の情報を登録することで、ワークフロー上で利用できるようになります。  

| キー | 説明 |
| --- | --- |
| DOTENV | .envファイルの内容 |
