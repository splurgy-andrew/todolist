require 'spec_helper'

describe "owners/edit" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", owner_path(@owner), "post" do
      assert_select "input#owner_name[name=?]", "owner[name]"
      assert_select "input#owner_email[name=?]", "owner[email]"
    end
  end
end
