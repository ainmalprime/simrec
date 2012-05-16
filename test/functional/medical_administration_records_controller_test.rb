require 'test_helper'

class MedicalAdministrationRecordsControllerTest < ActionController::TestCase
  setup do
    @medical_administration_record = medical_administration_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_administration_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_administration_record" do
    assert_difference('MedicalAdministrationRecord.count') do
      post :create, :medical_administration_record => { :actionDescription => @medical_administration_record.actionDescription, :actionDetails => @medical_administration_record.actionDetails, :clinicianSignature => @medical_administration_record.clinicianSignature, :retainOnReset => @medical_administration_record.retainOnReset, :timeRecorded => @medical_administration_record.timeRecorded, :visit_id => @medical_administration_record.visit_id }
    end

    assert_redirected_to medical_administration_record_path(assigns(:medical_administration_record))
  end

  test "should show medical_administration_record" do
    get :show, :id => @medical_administration_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medical_administration_record
    assert_response :success
  end

  test "should update medical_administration_record" do
    put :update, :id => @medical_administration_record, :medical_administration_record => { :actionDescription => @medical_administration_record.actionDescription, :actionDetails => @medical_administration_record.actionDetails, :clinicianSignature => @medical_administration_record.clinicianSignature, :retainOnReset => @medical_administration_record.retainOnReset, :timeRecorded => @medical_administration_record.timeRecorded, :visit_id => @medical_administration_record.visit_id }
    assert_redirected_to medical_administration_record_path(assigns(:medical_administration_record))
  end

  test "should destroy medical_administration_record" do
    assert_difference('MedicalAdministrationRecord.count', -1) do
      delete :destroy, :id => @medical_administration_record
    end

    assert_redirected_to medical_administration_records_path
  end
end
