class User < ActiveRecord::Base
  has_many :songs

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 140 }
  validates :password, presence: true, length: { maximum: 25 }

end