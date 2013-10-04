require 'spec_helper'

describe "passwords/edit" do
  before(:each) do
    @password = assign(:password, stub_model(Password,
      :string => ""
    ))
  end

  it "renders the edit password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", password_path(@password), "post" do
      assert_select "input#password_string[name=?]", "password[string]"
    end
  end
end
