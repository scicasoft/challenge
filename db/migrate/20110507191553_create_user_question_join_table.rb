class CreateUserQuestionJoinTable < ActiveRecord::Migration
  def self.up
    create_table :users_questions, :id => false do |t|
      t.integer :user_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :users_questions
  end
end