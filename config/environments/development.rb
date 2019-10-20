Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # r2-oasの設定
  require_relative Rails.root.join('apidocs', 'object', 'all.rb')
  R2OAS.configure do |config|
    # OpenAPI(V3)しかサポートしてない
    config.version               = :v3
    # 現在のディレクトリのapidocsに保存(存在してなければ自動で生成する)
    config.root_dir_path         = "./apidocs"
    # 分解したschemaを保存するディレクトリ名はsrc
    config.schema_save_dir_name  = "src"
    # 生成されたドキュメントを保存するファイルは、swagger.yml
    config.doc_save_file_name    = "swagger.yml"
    # components/schemas(requestBodies, ...) などの擬似ネームスペースの種類を洗濯
    # :dot(.) or :underbar(_) をサポート
    config.namespace_type = :underbar
    # デプロイファイルの保存先
    config.deploy_dir_path = "./dist_docs"
    
    ########### docsコマンド実行時で有効 ###################

    # 一度docsコマンドで生成したドキュメントを上書きする
    config.force_update_schema   = false
    # タグのネームスペースを利用するか
    #  コントローラーの名前がApi::V1::TasksControllerなら
    #  trueの場合) タグ名は「api/v1/task」となる
    #  falseの場合) タグ名は「task」となる
    config.use_tag_namespace = true
    # コンポーネントスキーマ名に擬似ネームスペースを利用するか
    #  コントローラーの名前がApi::V1::TasksControllerなら(namespace_typeが:underbarの時)
    #  trueの場合) components/schemas(requestBodies)名はApi_V1_Task
    #  falseの場合 components/schemas(requestBodies)名はTask

    # docsコマンド実行時に使用するオブジェクトクラスをオーバーライドする事ができる。この例では、
    # ・全てのエンドポイントparametersにvalidateクエリパラメーターを持たせるためのクラス: RtsdPathItemObject
    # ・components/schemasを規則的な名前で生成するようにしたクラス:                   Components::RtsdSchemaObject
    # ・components/requestBodiesを規則的な名前で生成するようにしたクラス:             Components::RtsdRequestBodyObject
    # を使うようにする。
    # 残りはデフォルトのクラスを使うようにする。
    #
    # config.use_object_classesを上書きする様にする。
    config.use_object_classes.deep_merge!({
      path_item_object:               RtsdPathItemObject,
      components_schema_object:       Components::RtsdSchemaObject,
      components_request_body_object: Components::RtsdRequestBodyObject
    })

    # サーバー情報を設定する。
    # docsコマンド実行時のみ有効
    config.server.data = [
      {
        url: "http://localhost:3000",
        description: "メイン"
      },
      {
        url: "http://localhost:3001",
        description: "サブ1"
      },
      {
        url: "http://localhost:3002",
        description: "サブ2"
      }
    ]

    # HTTPメソッド毎にどれだけのHTTPステータスのレスポンスをサポートするか決める
    # エンドポイントのパスが/tasks/{id}の様にpathパラメーターがある場合は、path_parameterのキーの設定が利用される。
    # docsコマンド実行時のみ有効
    config.http_statuses_when_http_method = {
      get: {
        default: %w(200 422),
        path_parameter: %w(200 404 422)
      },
      post: {
        default: %w(201 422),
        path_parameter: %w(201 404 422)
      },
      patch: {
        default: %w(204 422),
        path_parameter: %w(204 404 422)
      },
      put: {
        default: %w(204 422),
        path_parameter: %w(204 404 422)
      },
      delete: {
        default: %w(200 422),
        path_parameter: %w(200 404 422)
      }
    }

    # リクエストボディーを生成するときのHTTPメソッドを指定する
    # docsコマンド実行時のみ有効
    config.http_methods_when_generate_request_body = %w[post patch put]
  end
end
