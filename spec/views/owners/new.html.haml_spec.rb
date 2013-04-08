require 'spec_helper'

describe "owners/new" do
  before(:each) do
    assign(:owner, stub_model(Owner,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", owners_path, "post" do
      assert_select "input#owner_name[name=?]", "owner[name]"
      assert_select "input#owner_email[name=?]", "owner[email]"
    end
  end
end
