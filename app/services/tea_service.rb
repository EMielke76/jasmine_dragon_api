class TeaService

  def get_all_teas
    response = conn.get("/tea")
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
