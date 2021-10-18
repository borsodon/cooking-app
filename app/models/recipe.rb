class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  belongs_to :author

  def self.search(search, page)
    Recipe.includes(:ingredients)
          .where('ingredients.name LIKE ?', "%#{search}%")
          .references(:ingredients).paginate(page: page, per_page: 24)
  end
end
