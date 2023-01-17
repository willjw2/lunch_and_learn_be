class ImageService
  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.get_images(country)
    get_url("/search/photos?page=1&per_page=20&query=#{country}")[:results]
  end

  def self.conn
    conn = Faraday.new("https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['unsplash_api_key']
    end
  end
end
