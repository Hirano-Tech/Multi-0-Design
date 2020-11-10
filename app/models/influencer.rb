class Influencer < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :finders
end
