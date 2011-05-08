class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :user_id
      t.integer :category_id
      t.text :description
      t.string :reponse
      t.integer :points
      t.integer :nb_reponse, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
