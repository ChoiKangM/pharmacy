class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
