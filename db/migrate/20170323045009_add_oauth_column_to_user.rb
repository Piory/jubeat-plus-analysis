class AddOauthColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string, after: :id
    add_column :users, :name, :string, after: :email
    add_column :users, :uid, :string, after: :name
    add_column :users, :token, :string, after: :uid
  end
end
