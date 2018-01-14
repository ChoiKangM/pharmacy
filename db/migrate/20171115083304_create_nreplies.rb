class CreateNreplies < ActiveRecord::Migration
  def change
    create_table :nreplies do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :notice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
