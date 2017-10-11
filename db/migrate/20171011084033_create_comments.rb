class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.references :article, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
