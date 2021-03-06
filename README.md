# rtsdを高度に使う例

## 確認環境

- rails(Rails 6.0.0)
- ruby(ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin18])

## 準備

SwaggerEditor(UI)で開いたりするので以下の準備をしてください。

```bash
$ brew cask install chromedriver
$ docker pull swaggerapi/swagger-ui:latest
$ docker pull swaggerapi/swagger-editor:latest
```

## 試し方

`r2-oas` の設定に関しては、 `config/environments/development.rb` をご覧ください。

各設定に説明を書いております。
この例では、

- 共通のクエリパラメーターのvalidateを持たせている
- 動的にcomponents/schemas(requestBodies)名を規則的に決定する

様になっております。

参考にしてみて下さい。

### SwaggerUIで表示

```bash
$ # 全体を表示する
$ bundle exec routes:oas:ui
$ # 特定のpathsファイル(単体)だけ表示する
$ PATHS_FILE=apidocs/src/paths/api/v1/account.yml bundle exec routes:oas:ui
$ # 特定のpathsファイル(複数)だけ表示する
$ echo 'api/v1/account.yml' >> apidocs/.paths
$ echo 'api/v2/custom_post.yml' >> apidocs/.paths
$ echo 'task.yml' >> apidocs/.paths
$ bundle exec routes:oas:ui
```

### SwaggerEditorで編集

```bash
$ # 全体を編集する
$ bundle exec routes:oas:editor
$ # 特定のpathsファイル(単数)だけを編集する
$ PATHS_FILE=apidocs/src/paths/api/v1/account.yml bundle exec routes:oas:editor
$ # 特定のpathsファイル(複数)だけ編集する
$ echo 'api/v1/account.yml' >> apidocs/.paths
$ echo 'api/v2/custom_post.yml' >> apidocs/.paths
$ echo 'task.yml' >> apidocs/.paths
$ bundle exec routes:oas:editor
```

### テキストエディタで編集する場合

git管理しない `docs/swagger.yml` を `monitor` コマンドで管理する事で差分を検知します。

vscodeを使っている場合は、[SwaggerViewer](https://marketplace.visualstudio.com/items?itemName=Arjun.swagger-viewer)プラグインが便利

```bash
$ # 全体を編集する
$ bundle exec routes:oas:monitor   # apidocs/swagger.ymlファイルを編集する。
$ # 特定のpathsファイル(単数)だけを編集する
$ PATHS_FILE=apidocs/src/paths/api/v1/account.yml bundle exec routes:oas:monitor
$ # 特定のpathsファイル(複数)だけ編集する
$ echo 'api/v1/account.yml' >> apidocs/.paths
$ echo 'api/v2/custom_post.yml' >> apidocs/.paths
$ echo 'task.yml' >> apidocs/.paths
$ bundle exec routes:oas:monitor
```

### 書いたドキュメントを配布する

必要な分だけ配布用のドキュメントを生成する事が出来ます。

```bash
$ # 全体を配布する
$ bundle exec routes:oas:dist
$ # 特定のpathsファイル(単数)だけを配布する
$ PATHS_FILE=apidocs/src/paths/api/v1/account.yml bundle exec routes:oas:dist
$ # 特定のpathsファイル(複数)だけ配布する
$ echo 'api/v1/account.yml' >> apidocs/.paths
$ echo 'api/v2/custom_post.yml' >> apidocs/.paths
$ echo 'task.yml' >> apidocs/.paths
$ bundle exec routes:oas:dist
```

### pathsファイル一覧を取得する

```bash
$ bundle exec routes:oas:paths_ls
```
