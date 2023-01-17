class CountryFacade
  def self.all_countries
    CountryService.get_all_countries.map do |country|
      country[:name][:common]
    end
  end
  def self.random_country
    all_countries = self.all_countries
    all_countries.sample
  end
end
