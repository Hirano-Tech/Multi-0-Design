class CreateYoutubeProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :youtube_videos do |t|
      t.references :product, foreign_key: true
      t.references :youtube_video, foreign_key: true
      t.timestamps
    end
  end
end
