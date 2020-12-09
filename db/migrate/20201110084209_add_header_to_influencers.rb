class AddHeaderToInfluencers < ActiveRecord::Migration[5.2]
  def change
    add_column :influencers, :header, :binary, limit: 10.megabyte
  end
end
