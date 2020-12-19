class CreateInfluencerLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :influencer_likes do |t|
      t.references :influencer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
