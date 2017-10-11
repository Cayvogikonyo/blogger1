class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :body
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
