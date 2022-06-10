class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quizzes
  has_many :answers

  enum role: [:user, :admin]

  validates :name, presence: true

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def email_required?
    false
  end

  def admin?
    role == 'admin'
  end
end
