class CardList < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
end
