require 'spec_helper'

describe "pets/show" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :id => 1,
      :animal_id => 2,
      :owner_id => 3,
      :name => "Name",
      :female => false,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Name/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
