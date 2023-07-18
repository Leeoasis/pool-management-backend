class CreatePoolCleanings < ActiveRecord::Migration[7.0]
  def change
    create_table :pool_cleanings do |t|
      t.date :date
      t.text :description
      t.references :pool_installation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
