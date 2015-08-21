class CardListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card_list = CardList.new
  end

  def create
    @card_list = current_user.card_lists.build(card_list_params)
    if @card_list.save
      flash[:notice] = 'Collection created!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def card_list_params
    params.require(:card_list).permit(:name, :description)
  end
end
