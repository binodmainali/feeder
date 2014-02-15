require 'spec_helper'

describe "feeds/index" do
  before(:each) do
    assign(:feeds, [
      stub_model(Feed,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :link => "Link",
        :category => "Category"
      ),
      stub_model(Feed,
        :title => "Title",
        :description => "MyText",
        :image => "Image",
        :link => "Link",
        :category => "Category"
      )
    ])
  end

  it "renders a list of feeds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
