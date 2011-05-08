class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :questions,:join_table => 'users_questions', :uniq => true
  
  validates :nom,
    :presence       => true
  validates :prenom,
    :presence       => true
    
  before_create :defauts
    
  def defauts
    self.nom.upcase!
  end
  
  def a_repondu_a? question
    self.questions.exists?({:id => question.id})
  end
end
