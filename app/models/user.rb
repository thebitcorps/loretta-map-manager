class User < ActiveRecord::Base
  validate :validate_username
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :timeoutable
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    puts "ok"
    if login = conditions.delete(:login)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
