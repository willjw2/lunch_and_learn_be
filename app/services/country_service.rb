class CountryService
  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.get_all_countries
    get_url("/v3.1/all?fields=name")
  end

  def self.conn
    conn = Faraday.new("https://restcountries.com")
  end
end
