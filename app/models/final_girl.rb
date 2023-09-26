class FinalGirl < ApplicationRecord
  has_one :final_girl_series, dependent: :destroy
  has_one :user_final_girl, dependent: :destroy
  has_one :series, through: :final_girl_series
  has_one :user, through: :user_final_girl

  validates :name, presence: true
end
