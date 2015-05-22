class Song < ActiveRecord::Base
  
  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates :artist, presence: true, length: { maximum: 140 }
  validates :url, presence: true, length: { maximum: 25 }

end