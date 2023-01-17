class RecipeService
  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.get_recipes(country)
    get_url("/api/recipes/v2?q=#{country}")[:hits]
  end

  def self.conn
    conn = Faraday.new("https://api.edamam.com") do |faraday|
      faraday.params["app_id"] = ENV['edamam_app_id']
      faraday.params["app_key"] = ENV['edamam_app_key']
      faraday.params["type"] = 'public'
    end
  end
end
