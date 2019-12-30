class Task < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255 }
    validates :status, presence: true, length: { maximum: 10 }
    has_many :favorites
    has_many :users, through: :favorites
end
