class User < ApplicationRecord
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence:true
    has_many :articles
end
