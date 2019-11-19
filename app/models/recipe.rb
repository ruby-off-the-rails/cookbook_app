class Recipe < ApplicationRecord
  belongs_to :user
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

  def friendly_prep_time
    hours = prep_time.to_i / 60
    minutes = prep_time.to_i % 60
    "#{hours} hours and #{minutes} minutes"
    result = ""
    if hours > 0
      result += "#{hours} hours"
    end

    if minutes > 0
      result += " #{minutes} minutes"
    end
    result
  end
end
