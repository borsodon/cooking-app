require 'json';

file = File.read('lib/tasks/recipes.json');
recipes = JSON.parse(file)

namespace :import do
  task :recipes => :environment do
    recipes.each do |recipe_data|
      author = Author.find_or_create_by(name: recipe_data['author'])
      recipe = Recipe.create(author: author, 
                             name: recipe_data['name'],
                             rate: recipe_data['rate'].to_i,
                             author_tip: recipe_data['author_tip'],
                             budget: recipe_data['budget'],
                             prep_time: recipe_data['prep_time'],
                             difficulty: recipe_data['difficulty'],
                             people_quantity: recipe_data['people_quantity'],
                             cook_time: recipe_data['cook_time'],
                             total_time: recipe_data['total_time'],
                             image: recipe_data['image'],
                             nb_comments: recipe_data['nb_comments'].to_i
                            )

      tags = recipe_data['tags']
      tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        RecipeTag.create(recipe_id: recipe.id, tag_id: tag.id)
      end

      ingredients = recipe_data['ingredients']
      ingredients.each do |ing|
        first_word = ing.split(' ')[0]
        ingredient_name = ing.split(' ')[1..-1].join(' ')
        if first_word == first_word.to_i.to_s
          quantity = first_word.to_i
        else
          array = first_word.split(/(?<=\d)(?=[A-Za-z])/)
          quantity = array[0].to_i if array[0] =~ /\A[-+]?[0-9]+\z/
          unit = array[1] if array.length > 1
        end
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, quantity: quantity, unit: unit)
      end
   end    
  end
end
