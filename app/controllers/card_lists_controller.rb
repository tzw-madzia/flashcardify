class CardListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card_list = CardList.new
  end

  def create
    @card_list = current_user.card_lists.build(card_list_params)
    if @card_list.save
      flash[:notice] = 'Collection created!'
      redirect_to card_lists_path
    else
      render :new
    end
  end

  def index
    @card_lists = current_user.card_lists
  end

  def show
    @card_list = CardList.find(params[:id])
    @cards = @card_list.cards
    if @card_list.user_id == current_user.id
      render :show
    else
      render file: 'public/403.html'
    end
  end

  def destroy
    @card_list = CardList.find(params[:id])
    if @card_list.user_id == current_user.id
      @card_list.destroy
      flash[:notice] = 'Collection deleted!'
      redirect_to card_lists_path
    else
      render file: 'public/403.html'
    end
  end

  private

  def card_list_params
    params.require(:card_list).permit(:name, :description)
  end
end
