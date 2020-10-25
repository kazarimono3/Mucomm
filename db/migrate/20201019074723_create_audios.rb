class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
    	t.string :audio, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
