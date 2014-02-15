require 'spec_helper'

describe "feed_items/new" do
  before(:each) do
    assign(:feed_item, stub_model(FeedItem,
      :name => "MyString",
      :summary => "MyText",
      :url => "MyString",
      :guid => "MyString"
    ).as_new_record)
  end

  it "renders new feed_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_items_path, "post" do
      assert_select "input#feed_item_name[name=?]", "feed_item[name]"
      assert_select "textarea#feed_item_summary[name=?]", "feed_item[summary]"
      assert_select "input#feed_item_url[name=?]", "feed_item[url]"
      assert_select "input#feed_item_guid[name=?]", "feed_item[guid]"
    end
  end
end
