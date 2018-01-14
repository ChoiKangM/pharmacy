class CreateHreplies < ActiveRecord::Migration
  def change
    create_table :hreplies do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :handout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
