require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Ruby") }

  it { is_expected.to have_many(:lists) }

  describe "attributes" do
    it "has a name attribute" do
      expect(user).to have_attributes(name: user.name)
    end
  end
end
