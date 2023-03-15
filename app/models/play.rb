class Play < ApplicationRecord
  belongs_to :user
  belongs_to :final_girl
  belongs_to :killer
  belongs_to :location
end
