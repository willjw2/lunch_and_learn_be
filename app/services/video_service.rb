class VideoService
  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.get_video(country)
    get_url("/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&maxResults=1")[:items][0]
  end

  def self.conn
    conn = Faraday.new("https://www.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['google_api_key']
      faraday.params["part"] = 'snippet'
    end
  end
end
