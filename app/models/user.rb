class User < ApplicationRecord
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence:true
    validates :location, presence:true
    has_many :articles
end
