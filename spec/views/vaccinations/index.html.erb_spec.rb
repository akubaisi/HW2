require 'spec_helper'

describe "vaccinations/index" do
  before(:each) do
    assign(:vaccinations, [
      stub_model(Vaccination,
        :id => 1,
        :vaccine_id => 2,
        :visit_id => 3
      ),
      stub_model(Vaccination,
        :id => 1,
        :vaccine_id => 2,
        :visit_id => 3
      )
    ])
  end

  it "renders a list of vaccinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
