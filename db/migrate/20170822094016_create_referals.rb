class CreateReferals < ActiveRecord::Migration[5.1]
  def change
    create_table :referals do |t|
      t.integer :user_id
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
