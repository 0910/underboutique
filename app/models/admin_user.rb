class AdminUser < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role, as: :admin

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body
  
  belongs_to :designer
  belongs_to :comprador
  
  # Utility methods for checking the user roles
  def admin?
    role == 'admin'
  end
  
  def designer?
    role == 'designer'
  end
  
  def comprador?
    role == 'comprador'
  end

  def guest?
    !admin? && !designer?
  end
end
