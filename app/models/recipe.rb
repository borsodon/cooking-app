class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  belongs_to :author
end
