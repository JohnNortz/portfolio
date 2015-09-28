class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post
  has_many :comments

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = "#{user.name}@#{auth.provider}.example.com"
    end
  end
end


class NullUser
  def initialize
    @role = "visitor"
  end

  def editor?
    false
  end

  def author?
    false
  end

  def visitor?
    true
  end

  def id
    false
  end
end
