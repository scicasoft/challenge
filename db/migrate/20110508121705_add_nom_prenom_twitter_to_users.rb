class AddNomPrenomTwitterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :twitter, :string
  end

  def self.down
    remove_column :users, :twitter
    remove_column :users, :prenom
    remove_column :users, :nom
  end
end
