require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  let(:named_user) { build :user, :with_names }
  let(:invalid_user) { build :user, :invalid }

  describe "validations" do
    context "when valid" do
      it "with valid attributes" do
        expect(user).to be_valid
      end

      it "with valid name attributes" do
        expect(named_user).to be_valid
      end
    end

    context "when NOT valid" do
      it "with valid invalid attributes" do
        expect(invalid_user).to_not be_valid
      end
    end
  end
end
