require 'spec_helper'

describe "passwords/show" do
  before(:each) do
    @password = assign(:password, stub_model(Password,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
