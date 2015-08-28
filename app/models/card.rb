class Card < ActiveRecord::Base
  require 'csv'

  belongs_to :card_list

  def self.import(file, card_list_id)
    CSV.foreach(file.path, headers: true) do |row|
      card = Card.create! row.to_hash
      card.card_list_id = card_list_id
      card.save
    end
  end
end
