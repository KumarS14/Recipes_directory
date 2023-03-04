require 'recipe_repository'
RSpec.describe RecipeRepository do
    def reset_recipes_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_test' })
        connection.exec(seed_sql)
      
    end
    before(:each) do 
        reset_recipes_table
    end
          
    it 'tests recipes' do
        repo = RecipeRepository.new
        recipes = repo.all
        expect(recipes.length)
        expect(recipes.first.id).to eq ('1') # =>  1
        expect(recipes.last.the_name).to eq('crayons')  
        expect(recipes.first.cooking_time_minutes).to eq('23')

    end
    it 'tests single recipe' do
       repo = RecipeRepository.new
       recipe = repo.find(2)
        expect(recipe.id).to eq ('2') # =>  1
        expect(recipe.the_name).to eq('ice cream')  
        expect(recipe.cooking_time_minutes).to eq('134')

    end

end