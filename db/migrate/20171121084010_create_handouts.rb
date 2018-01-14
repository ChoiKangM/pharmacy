class CreateHandouts < ActiveRecord::Migration
  def change
    create_table :handouts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.string :file

      t.timestamps null: false
    end
  end
end
