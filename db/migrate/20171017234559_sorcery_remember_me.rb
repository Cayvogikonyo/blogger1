class SorceryRememberMe < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :remember_me_token, :string, :default => nil
    add_column :authors, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :authors, :remember_me_token
  end
end
