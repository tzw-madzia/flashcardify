class CardsController < ApplicationController
  def index
    @card_list = CardList.find(params[:card_list_id])
    @cards = @card_list.cards
  end

  def import
    Card.import(params[:file],params[:card_list_id])
    @card_list = CardList.find(params[:card_list_id])
    redirect_to card_list_path(@card_list), notice: "Cards imported."
  end
end