class CreateInfluencers < ActiveRecord::Migration[5.2]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :gendar
      t.binary :icon, limit: 10.megabyte
      t.string :twitter
      t.string :instagram
      t.string :youtube
      t.timestamps
    end
  end
end
