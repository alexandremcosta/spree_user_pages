require 'spec_helper'

describe Spree::Page do
  describe ".create_from_order" do
    before do
      create(:store)
      @order = create(:order)
    end
    let(:page) { Spree::Page.create_from_order(@order) }

    it "creates and returns a page" do
      expect(page).to be_a(Spree::Page)
    end
    it "creates a page with the same user of the given order" do
      expect(page.user).to eq(@order.user)
    end
    it "creates a page with the same title as order's firstname" do
      expect(page.title).to eq(@order.name)
    end
  end
end
