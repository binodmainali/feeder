require 'spec_helper'

describe "feeds/new" do
  before(:each) do
    assign(:feed, stub_model(Feed,
      :title => "MyString",
      :description => "MyText",
      :image => "MyString",
      :link => "MyString",
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feeds_path, "post" do
      assert_select "input#feed_title[name=?]", "feed[title]"
      assert_select "textarea#feed_description[name=?]", "feed[description]"
      assert_select "input#feed_image[name=?]", "feed[image]"
      assert_select "input#feed_link[name=?]", "feed[link]"
      assert_select "input#feed_category[name=?]", "feed[category]"
    end
  end
end
