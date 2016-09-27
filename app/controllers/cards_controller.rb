class CardsController < ApplicationController
  def import
    Card.import(params[:file],params[:card_list_id])
    @card_list = CardList.find(params[:card_list_id])
    redirect_to card_list_path(@card_list), notice: "Cards imported."
  end

  def new
    @card_list = CardList.find(params[:card_list_id])
    @card = @card_list.cards.new
  end

  def create
    @card_list = CardList.find(params[:card_list_id])
    @card = @card_list.cards.build(card_params)
    if @card.save
      flash[:notice] = 'Card added!'
      redirect_to card_list_path(@card_list.id)
    else
      render :new
    end
  end

  def destroy
    @card_list = CardList.find(params[:card_list_id])
    @card = Card.find(params[:id])
    @card.destroy
    flash[:notice] = 'Card deleted!'
    redirect_to card_list_path(@card_list.id)
  end

  def destroy_multiple
    @card_list = CardList.find(params[:card_list_id])
    Card.destroy(params[:card_ids])
    respond_to do |format|
      format.html { redirect_to card_list_path(@card_list.id) }
      format.json { head :no_content }
    end
  end

  def card_params
    params.require(:card).permit(:primary_language_word, :learning_language_word, :special_character_word)
  end
end
