class User < ActiveRecord::Base
  ROLES = %w(Пользователь Модератор Администратор)
  has_secure_password
  before_validation :set_default_role, :check_birthday
  validates :last_name, presence: true, length: {maximum: 50}
  validates :first_name, presence: true, length: {maximum: 50}
  validates :second_name, length: {maximum: 50}
  validates :residence, presence: true, length: {maximum: 50}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {case_sensitive: false}
  validates :passport, presence: true, length: {minimum: 10, maximum: 10}
  validates :policy, presence: true, length: {minimum: 10, maximum: 10}
  validates :sex, presence: true, inclusion: {in: %w(м ж)}
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, if: "password.present?"
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}
  
  def moderator?
    role==1 || administrator?
  end
  def administrator?
    role==2
  end
  def user?
    role==0
  end

  def set_default_role
    self.role||=0
  end
  
  def check_birthday
    if self.birthday > Time.now
      self.errors[:birthday]<<" не существует"
      #flash[:danger]="Несуществующая дата рождения"
      #errors.add(:user, "")
    end
  end
end
