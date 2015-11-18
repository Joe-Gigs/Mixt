class CreateTapes < ActiveRecord::Migration
  def change
    create_table :tapes do |t|
      t.string :tapename
      t.text :description
      t.integer :user_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
