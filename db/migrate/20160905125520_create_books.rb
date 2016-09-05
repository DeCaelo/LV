class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :state
      t.string :who
      t.string :title
      t.date :release_date
      t.date :release_pocket_date
      t.integer :user_id

      t.timestamps
    end
  end
end
