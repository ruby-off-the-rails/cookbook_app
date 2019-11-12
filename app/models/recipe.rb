class Recipe < ApplicationRecord
  # works
  def ingredients_list
    ingredients.split(", ")
  end

  # doesn't
  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%A, %b %d")
  end
end
