class User < ApplicationRecord
  attr_accessor :login
  # has_many :posts
  # has_many :comments , primary_key: :username, foreign_key: :commenter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter],
         :authentication_keys => [:login]
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      else
        where(conditions).first
      end
  end
  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 20 }
end
