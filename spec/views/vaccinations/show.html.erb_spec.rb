require 'spec_helper'

describe "vaccinations/show" do
  before(:each) do
    @vaccination = assign(:vaccination, stub_model(Vaccination,
      :id => 1,
      :vaccine_id => 2,
      :visit_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
