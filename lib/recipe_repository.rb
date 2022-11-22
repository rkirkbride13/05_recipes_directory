class RecipeRepository

  def all
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time'].to_i
      recipe.rating = record['rating'].to_i
      recipes << recipe
      end
      return recipes
  end 

  def find(id)
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time'].to_i
    recipe.rating = record['rating'].to_i
    return recipe
  end
  
end