require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { User.create!(name: "Ruby") }
  let(:list) { List.create!(name: 'Comment Body', user: user) }

  it { is_expected.to have_many(:items) }
  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has name and private attributes" do
      expect(list).to have_attributes(name: list.name, private: true)
    end

    it "is private by default" do
      expect(list.private).to be(true)
    end
  end
end
