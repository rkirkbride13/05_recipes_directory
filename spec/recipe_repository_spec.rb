require 'recipe_repository'
require 'recipe'

RSpec.describe RecipeRepository do

  def reset_recipes_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end

    it "returns all the recipes" do
      repo = RecipeRepository.new
      recipes = repo.all

      expect(recipes.length).to eq 2
      expect(recipes[0].id).to eq '1'
      expect(recipes[0].name).to eq 'bread'
      expect(recipes[0].cooking_time).to eq 60
      expect(recipes[0].rating).to eq 3

      expect(recipes[1].id).to eq '2'
      expect(recipes[1].name).to eq 'pancakes'
      expect(recipes[1].cooking_time).to eq 20
      expect(recipes[1].rating).to eq 4
    end
  end
end