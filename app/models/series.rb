class Series < ApplicationRecord
  has_many :killers
  has_many :locations
  has_many :final_girl_series
  has_many :final_girls, through: :final_girl_series

  validates :name, presence: true

  def ordered_killers
    killers.order(:name)
  end

  def ordered_locations
    locations.order(:name)
  end
end
