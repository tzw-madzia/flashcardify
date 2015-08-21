require 'rails_helper'

describe CardList do
  let(:user) { create(:user) }
  let(:card_list) { user.card_lists.build(name: 'My cardlist', description: 'This is my card list') }

  subject { card_list }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }

  describe 'when user_id is not present' do
    before { card_list.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when name is not present' do
    before { card_list.name = nil }
    it { should_not be_valid }
  end

  describe 'when description is not present' do
    before { card_list.description = nil }
    it { should be_valid }
  end
end
