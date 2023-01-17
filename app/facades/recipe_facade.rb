class RecipeFacade
  def self.recipes(country)
    RecipeService.get_recipes(country).map do |recipe_data|
      Recipe.new(recipe_data[:recipe], country)
    end
  end
end
