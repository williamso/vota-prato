json.array!(@comentarios) do |comentario|
  json.extract! comentario, :conteudo, :comentavel_id, :comentavel_type
  json.url comentario_url(comentario, format: :json)
end
