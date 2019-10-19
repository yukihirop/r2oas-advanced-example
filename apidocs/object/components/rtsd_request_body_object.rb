module Components
  class RtsdRequestBodyObject < R2OAS::Schema::V3::Components::RequestBodyObject
    NS_DIV = '_'

    # 例) components/requestBodies名のpathとの関係は以下の通り
    # POST(201) /v1/tasks/{id}/check => V1_Task_Check_P1_RB_POST
    #
    # この例の場合、以下のようなファイルが生成される
    # [ファイルのパス] docs/src/components/requestBodies/v1/task/check/p1/rb/post.yml
    # [ファイルの内容]
    # ---
    # components:
    #   requestBodies:
    #     V1_Task_Check_P1_RB_POST:
    #       content:
    #         application/json:
    #           schema:
    #             '$ref': '#/components/schemas/V1_Task_Check_P1_RB_POST'
    def components_request_body_name(_doc, path_component, tag_name, verb, _schema_name)
      shared_schema_name(_doc, path_component, tag_name, verb, _schema_name)
    end
  
    def components_schema_name(_doc, path_component, tag_name, verb, _schema_name)
      shared_schema_name(_doc, path_component, tag_name, verb, _schema_name)
    end

    private

    def shared_schema_name(_doc, path_component, tag_name, verb, _schema_name)
      path_parameters_count = path_component.path_parameters.count
      excluded_path_parameters = path_component.path_excluded_path_parameters
      excluded_path_parameters_arr = excluded_path_parameters.split('/').delete_if(&:empty?)
      base_schema_name = excluded_path_parameters.split('/').map(&:singularize).map(&:camelize).join(NS_DIV)
  
      base_schema_name = tag_name.split('/').map(&:singularize).map(&:camelize).join(NS_DIV) + base_schema_name if excluded_path_parameters.eql? '' || excluded_path_parameters_arr.count == 1
  
      if path_parameters_count.zero?
        [base_schema_name, 'RB', verb.upcase].join(NS_DIV)
      else
        [base_schema_name, "P#{path_parameters_count}", 'RB', verb.upcase].join(NS_DIV)
      end
    end
  end
end
