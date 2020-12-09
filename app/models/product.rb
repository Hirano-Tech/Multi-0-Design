class Product < ApplicationRecord
  belongs_to :influencer, foreign_key: :influencer_id
end
