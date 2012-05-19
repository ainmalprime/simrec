require 'spec_helper'

describe "FlowSheetRecords" do
  describe "GET /flow_sheet_records" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get flow_sheet_records_path
      response.status.should be(200)
    end
  end
end
