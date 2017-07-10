class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.references :comment1st, index: true, presences: false
      t.timestamps
    end
  end
end
