require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:list) { List.create!(name: "List")}
  let(:item) { Item.create!(name: "This is an item", list: list) }

  it { is_expected.to belong_to(:list) }

  describe "attributes" do
    it "has a name attribute" do
      expect(item).to have_attributes(name: item.name)
    end
  end
end
