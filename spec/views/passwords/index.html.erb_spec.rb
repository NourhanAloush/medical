require 'spec_helper'

describe "passwords/index" do
  before(:each) do
    assign(:passwords, [
      stub_model(Password,
        :string => ""
      ),
      stub_model(Password,
        :string => ""
      )
    ])
  end

  it "renders a list of passwords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
