class Question < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  
  def self.search(search)
    if search
      question = Question.where('content LIKE ?', "%#{search}%")
    else
      Question.all
    end
  end
end
