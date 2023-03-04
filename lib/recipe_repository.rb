require 'recipe'
class RecipeRepository
    def all
        # Executes the SQL query:
        # SELECT id, name, cohort_name FROM students;
        result_set = DatabaseConnection.exec_params('SELECT id, the_name, cooking_time_minutes, rating FROM recipes;', [])
        recipes = []
        result_set.each do |a_recipe|
            recipe = Recipe.new
            recipe.id = a_recipe['id']
            recipe.the_name = a_recipe['the_name']
            recipe.cooking_time_minutes = a_recipe['cooking_time_minutes']
            recipe.rating = a_recipe['rating']
            recipes << recipe
        end
       return recipes
    end
    def find(id)
        # The placeholder $1 is a "parameter" of the SQL query.
        # It needs to be matched to the corresponding element
        # of the array given in second argument to exec_params.
        #
        # (If we needed more parameters, we would call them $2, $3...
        # and would need the same number of values in the params array).
        sql = 'SELECT id, the_name, cooking_time_minutes, rating FROM recipes WHERE id = $1;'

        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql,sql_params)
        a_recipe = result_set[0]
        recipe = Recipe.new
        recipe.id = a_recipe['id']
        recipe.the_name = a_recipe['the_name']
        recipe.cooking_time_minutes = a_recipe['cooking_time_minutes']
        recipe.rating = a_recipe['rating']
        return recipe


        # (The code now needs to convert the result to a
        # Student object and return it)

    end

end