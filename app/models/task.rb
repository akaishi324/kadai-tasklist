class Task < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255 }
    validates :status, presence: true, length: { maximum: 10 }

  has_many :relationships
  has_many :favoriters, through: :relationships, source: :user
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'user_id'
  has_many :favorites, through: :reverses_of_relationship, source: :favorite

  def favorite(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(favorite_id: other_user.id)
    end
  end

  def unfavorite(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def favorite?(other_user)
    self.favorites.include?(other_user)
  end
end

