require 'spec_helper'

describe "feed_items/show" do
  before(:each) do
    @feed_item = assign(:feed_item, stub_model(FeedItem,
      :name => "Name",
      :summary => "MyText",
      :url => "Url",
      :guid => "Guid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Guid/)
  end
end
