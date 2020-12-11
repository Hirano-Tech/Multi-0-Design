class CreateYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :youtube_videos do |t|
      t.string :video_id
      t.string :title
      t.string :thumbnails
      t.string :published_at
      t.references :influencer, foreign_key: true
      t.timestamps
    end
  end
end
