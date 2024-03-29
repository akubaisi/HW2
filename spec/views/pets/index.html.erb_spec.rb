require 'spec_helper'

describe "pets/index" do
  before(:each) do
    assign(:pets, [
      stub_model(Pet,
        :id => 1,
        :animal_id => 2,
        :owner_id => 3,
        :name => "Name",
        :female => false,
        :active => false
      ),
      stub_model(Pet,
        :id => 1,
        :animal_id => 2,
        :owner_id => 3,
        :name => "Name",
        :female => false,
        :active => false
      )
    ])
  end

  it "renders a list of pets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
