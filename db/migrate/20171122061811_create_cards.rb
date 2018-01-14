class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
