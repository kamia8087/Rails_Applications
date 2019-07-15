class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true

  def self.get_popular_answers_for_the_topic(topic:)
  end

  def self.get_popular_answers_for_the_topic(topic:)
  end
end
