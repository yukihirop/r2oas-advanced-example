class RtsdPathItemObject < RoutesToSwaggerDocs::Schema::V3::PathItemObject
  after_create do |doc, path|
    doc.keys.each do |verb|
      doc[verb]["parameters"] ||= []
      doc[verb]["parameters"].push({
        'name' => 'validate',
        'in' => 'query',
        'description' => 'validationモードか否か',
        'schema' => {
          'type' => 'boolean'
        }
      })
      doc[verb]["parameters"].uniq!
    end
  end
end
