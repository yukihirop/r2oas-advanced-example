module Components
  class RtsdSchemaObject < RoutesToSwaggerDocs::Schema::V3::Components::SchemaObject
    NS_DIV = '_'

    # 例) components/schemas名のpathとの関係は以下の通り
    #
    # POST(201) /v1/tasks/{id}/check  => V1_Task_Check_P1_POST_201
    # GET(200) /v1/tasks/{id}         => V1_Task_P1_GET_200
    #
    # この例の場合、以下のようなファイルが生成される
    # [ファイルのパス] docs/src/components/schemas/v1/task/p1/get/200.yml
    # [ファイルの内容]
    # ---
    # components:
    #   schemas:
    #     V1_Task_P1_GET_200:
    #       type: object
    #       properties:
    #         id:
    #           type: integer
    #           format: int64
    def components_schema_name(doc, path_component, tag_name, verb, http_status, schema_name)
      path_parameters_count = path_component.path_parameters.count
      excluded_path_parameters = path_component.path_excluded_path_parameters
      excluded_path_parameters_arr = excluded_path_parameters.split("/").delete_if(&:empty?)
      base_schema_name = excluded_path_parameters.split("/").map(&:singularize).map(&:camelize).join(NS_DIV)
      
      if excluded_path_parameters.eql? "" || excluded_path_parameters_arr.count == 1
        base_schema_name = tag_name.split("/").map(&:singularize).map(&:camelize).join(NS_DIV) + base_schema_name
      end
      
      if path_parameters_count.zero?
        [base_schema_name, verb.upcase, http_status].join(NS_DIV)
      else
        [base_schema_name, "P#{path_parameters_count}", verb.upcase, http_status].join(NS_DIV)
      end
    end
  end
end
