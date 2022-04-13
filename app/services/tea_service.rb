class TeaService

  def get_all_teas
    response = conn.get("/tea")
    body = parse_json(response)
  end

  def get_one_tea(name)
    response = conn.get("/tea/#{name}")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "https://tea-api-vic-lo.herokuapp.com")
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
