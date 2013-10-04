json.array!(@clientes) do |cliente|
  json.extract! cliente, :nome, :idade
  json.url cliente_url(cliente, format: :json)
end
