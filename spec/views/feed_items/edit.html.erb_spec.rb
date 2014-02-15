require 'spec_helper'

describe "feed_items/edit" do
  before(:each) do
    @feed_item = assign(:feed_item, stub_model(FeedItem,
      :name => "MyString",
      :summary => "MyText",
      :url => "MyString",
      :guid => "MyString"
    ))
  end

  it "renders the edit feed_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_item_path(@feed_item), "post" do
      assert_select "input#feed_item_name[name=?]", "feed_item[name]"
      assert_select "textarea#feed_item_summary[name=?]", "feed_item[summary]"
      assert_select "input#feed_item_url[name=?]", "feed_item[url]"
      assert_select "input#feed_item_guid[name=?]", "feed_item[guid]"
    end
  end
end
