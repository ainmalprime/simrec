require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FlowSheetRecordsController do

  # This should return the minimal set of attributes required to create a valid
  # FlowSheetRecord. As you add validations to FlowSheetRecord, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FlowSheetRecordsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all flow_sheet_records as @flow_sheet_records" do
      flow_sheet_record = FlowSheetRecord.create! valid_attributes
      get :index, {}, valid_session
      assigns(:flow_sheet_records).should eq([flow_sheet_record])
    end
  end

  describe "GET show" do
    it "assigns the requested flow_sheet_record as @flow_sheet_record" do
      flow_sheet_record = FlowSheetRecord.create! valid_attributes
      get :show, {:id => flow_sheet_record.to_param}, valid_session
      assigns(:flow_sheet_record).should eq(flow_sheet_record)
    end
  end

  describe "GET new" do
    it "assigns a new flow_sheet_record as @flow_sheet_record" do
      get :new, {}, valid_session
      assigns(:flow_sheet_record).should be_a_new(FlowSheetRecord)
    end
  end

  describe "GET edit" do
    it "assigns the requested flow_sheet_record as @flow_sheet_record" do
      flow_sheet_record = FlowSheetRecord.create! valid_attributes
      get :edit, {:id => flow_sheet_record.to_param}, valid_session
      assigns(:flow_sheet_record).should eq(flow_sheet_record)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FlowSheetRecord" do
        expect {
          post :create, {:flow_sheet_record => valid_attributes}, valid_session
        }.to change(FlowSheetRecord, :count).by(1)
      end

      it "assigns a newly created flow_sheet_record as @flow_sheet_record" do
        post :create, {:flow_sheet_record => valid_attributes}, valid_session
        assigns(:flow_sheet_record).should be_a(FlowSheetRecord)
        assigns(:flow_sheet_record).should be_persisted
      end

      it "redirects to the created flow_sheet_record" do
        post :create, {:flow_sheet_record => valid_attributes}, valid_session
        response.should redirect_to(FlowSheetRecord.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved flow_sheet_record as @flow_sheet_record" do
        # Trigger the behavior that occurs when invalid params are submitted
        FlowSheetRecord.any_instance.stub(:save).and_return(false)
        post :create, {:flow_sheet_record => {}}, valid_session
        assigns(:flow_sheet_record).should be_a_new(FlowSheetRecord)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FlowSheetRecord.any_instance.stub(:save).and_return(false)
        post :create, {:flow_sheet_record => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested flow_sheet_record" do
        flow_sheet_record = FlowSheetRecord.create! valid_attributes
        # Assuming there are no other flow_sheet_records in the database, this
        # specifies that the FlowSheetRecord created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FlowSheetRecord.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => flow_sheet_record.to_param, :flow_sheet_record => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested flow_sheet_record as @flow_sheet_record" do
        flow_sheet_record = FlowSheetRecord.create! valid_attributes
        put :update, {:id => flow_sheet_record.to_param, :flow_sheet_record => valid_attributes}, valid_session
        assigns(:flow_sheet_record).should eq(flow_sheet_record)
      end

      it "redirects to the flow_sheet_record" do
        flow_sheet_record = FlowSheetRecord.create! valid_attributes
        put :update, {:id => flow_sheet_record.to_param, :flow_sheet_record => valid_attributes}, valid_session
        response.should redirect_to(flow_sheet_record)
      end
    end

    describe "with invalid params" do
      it "assigns the flow_sheet_record as @flow_sheet_record" do
        flow_sheet_record = FlowSheetRecord.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FlowSheetRecord.any_instance.stub(:save).and_return(false)
        put :update, {:id => flow_sheet_record.to_param, :flow_sheet_record => {}}, valid_session
        assigns(:flow_sheet_record).should eq(flow_sheet_record)
      end

      it "re-renders the 'edit' template" do
        flow_sheet_record = FlowSheetRecord.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FlowSheetRecord.any_instance.stub(:save).and_return(false)
        put :update, {:id => flow_sheet_record.to_param, :flow_sheet_record => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested flow_sheet_record" do
      flow_sheet_record = FlowSheetRecord.create! valid_attributes
      expect {
        delete :destroy, {:id => flow_sheet_record.to_param}, valid_session
      }.to change(FlowSheetRecord, :count).by(-1)
    end

    it "redirects to the flow_sheet_records list" do
      flow_sheet_record = FlowSheetRecord.create! valid_attributes
      delete :destroy, {:id => flow_sheet_record.to_param}, valid_session
      response.should redirect_to(flow_sheet_records_url)
    end
  end

end