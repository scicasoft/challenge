class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :users, :uniq => true
  
  def response_est_juste? rep
    self.reponse == rep
  end
end
