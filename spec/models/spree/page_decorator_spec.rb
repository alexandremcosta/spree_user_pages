require 'spec_helper'

describe Spree::Page do
  describe ".create_from_order" do
    it "creates and returns a page" do
      order = create(:order)
      page = Spree::Page.create_from_order(order)
      expect(page).to be_a(Spree::Page)
    end
    it "creates a page with the same user of the given order" do
      order = create(:order)
      page = Spree::Page.create_from_order(order)
      expect(page.user).to eq(order.user)
    end
    it "creates a page with the same title as order's firstname" do
      order = create(:order)
      page = Spree::Page.create_from_order(order)
      expect(page.title).to eq(order.bill_address.firstname)
    end
  end
end
