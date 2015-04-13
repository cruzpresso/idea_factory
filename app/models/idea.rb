class Idea < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true

end
