require 'spec_helper'

describe "passwords/new" do
  before(:each) do
    assign(:password, stub_model(Password,
      :string => ""
    ).as_new_record)
  end

  it "renders new password form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passwords_path, "post" do
      assert_select "input#password_string[name=?]", "password[string]"
    end
  end
end
