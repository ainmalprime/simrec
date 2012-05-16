require 'test_helper'

class ClinicianNotesControllerTest < ActionController::TestCase
  setup do
    @clinician_note = clinician_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinician_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinician_note" do
    assert_difference('ClinicianNote.count') do
      post :create, :clinician_note => { :clinicianSignature => @clinician_note.clinicianSignature, :noteText => @clinician_note.noteText, :noteType => @clinician_note.noteType, :retainOnReset => @clinician_note.retainOnReset, :timeRecorded => @clinician_note.timeRecorded, :visit_id => @clinician_note.visit_id }
    end

    assert_redirected_to clinician_note_path(assigns(:clinician_note))
  end

  test "should show clinician_note" do
    get :show, :id => @clinician_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @clinician_note
    assert_response :success
  end

  test "should update clinician_note" do
    put :update, :id => @clinician_note, :clinician_note => { :clinicianSignature => @clinician_note.clinicianSignature, :noteText => @clinician_note.noteText, :noteType => @clinician_note.noteType, :retainOnReset => @clinician_note.retainOnReset, :timeRecorded => @clinician_note.timeRecorded, :visit_id => @clinician_note.visit_id }
    assert_redirected_to clinician_note_path(assigns(:clinician_note))
  end

  test "should destroy clinician_note" do
    assert_difference('ClinicianNote.count', -1) do
      delete :destroy, :id => @clinician_note
    end

    assert_redirected_to clinician_notes_path
  end
end
