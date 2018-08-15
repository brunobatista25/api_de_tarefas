Quando("faco uma requisicao para criar usuario") do
  @request = HTTParty.get("#{CONFIG['url_default']}/users")
end
  
Entao("verifico a api de criar usuario me retornou status {int}") do |response|
 expect(@request.code).to eq response
 expect(@request.message).to eq 'OK'
end