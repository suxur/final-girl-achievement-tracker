class Series < ApplicationRecord
  has_many :killers
  has_many :locations
  has_many :final_girls
end
