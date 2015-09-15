class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
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
