class CreateYoutubeChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :youtube_channels do |t|
      t.string :cannel_id
      t.string :header
      t.string :icon
      t.integer :subscriber
      t.references :influencer, foreign_key: true
      t.timestamps
    end
  end
end
