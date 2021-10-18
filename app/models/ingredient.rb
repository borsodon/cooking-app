class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipes

  def self.search(search, page)
    Ingredient.where('name LIKE ?', "%#{search}%")
              .paginate(page: page, per_page: 24)
  end
end
