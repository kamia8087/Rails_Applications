class User < ApplicationRecord
    has_many :questions
    has_many :answers
    before_save :downcase_email
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def downcase_email
        self.email = email.downcase
    end

    def get_feed(topic:)
      show_recommendations = self.show_recommendations?
      answers = if show_recommendations
                  Answer.get_popular_answers_close_to_topic(topic: topic)
                else
                  Answer.get_popular_answers_for_the_topic(topic: topic)
                end

      answers
    end

    def show_recommendations?
      self.id % 2 == 0
    end
end
