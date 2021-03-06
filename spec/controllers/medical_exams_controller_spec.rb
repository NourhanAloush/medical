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

describe MedicalExamsController do

  # This should return the minimal set of attributes required to create a valid
  # MedicalExam. As you add validations to MedicalExam, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "emp_id" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MedicalExamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all medical_exams as @medical_exams" do
      medical_exam = MedicalExam.create! valid_attributes
      get :index, {}, valid_session
      assigns(:medical_exams).should eq([medical_exam])
    end
  end

  describe "GET show" do
    it "assigns the requested medical_exam as @medical_exam" do
      medical_exam = MedicalExam.create! valid_attributes
      get :show, {:id => medical_exam.to_param}, valid_session
      assigns(:medical_exam).should eq(medical_exam)
    end
  end

  describe "GET new" do
    it "assigns a new medical_exam as @medical_exam" do
      get :new, {}, valid_session
      assigns(:medical_exam).should be_a_new(MedicalExam)
    end
  end

  describe "GET edit" do
    it "assigns the requested medical_exam as @medical_exam" do
      medical_exam = MedicalExam.create! valid_attributes
      get :edit, {:id => medical_exam.to_param}, valid_session
      assigns(:medical_exam).should eq(medical_exam)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MedicalExam" do
        expect {
          post :create, {:medical_exam => valid_attributes}, valid_session
        }.to change(MedicalExam, :count).by(1)
      end

      it "assigns a newly created medical_exam as @medical_exam" do
        post :create, {:medical_exam => valid_attributes}, valid_session
        assigns(:medical_exam).should be_a(MedicalExam)
        assigns(:medical_exam).should be_persisted
      end

      it "redirects to the created medical_exam" do
        post :create, {:medical_exam => valid_attributes}, valid_session
        response.should redirect_to(MedicalExam.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved medical_exam as @medical_exam" do
        # Trigger the behavior that occurs when invalid params are submitted
        MedicalExam.any_instance.stub(:save).and_return(false)
        post :create, {:medical_exam => { "emp_id" => "invalid value" }}, valid_session
        assigns(:medical_exam).should be_a_new(MedicalExam)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MedicalExam.any_instance.stub(:save).and_return(false)
        post :create, {:medical_exam => { "emp_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested medical_exam" do
        medical_exam = MedicalExam.create! valid_attributes
        # Assuming there are no other medical_exams in the database, this
        # specifies that the MedicalExam created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MedicalExam.any_instance.should_receive(:update).with({ "emp_id" => "MyString" })
        put :update, {:id => medical_exam.to_param, :medical_exam => { "emp_id" => "MyString" }}, valid_session
      end

      it "assigns the requested medical_exam as @medical_exam" do
        medical_exam = MedicalExam.create! valid_attributes
        put :update, {:id => medical_exam.to_param, :medical_exam => valid_attributes}, valid_session
        assigns(:medical_exam).should eq(medical_exam)
      end

      it "redirects to the medical_exam" do
        medical_exam = MedicalExam.create! valid_attributes
        put :update, {:id => medical_exam.to_param, :medical_exam => valid_attributes}, valid_session
        response.should redirect_to(medical_exam)
      end
    end

    describe "with invalid params" do
      it "assigns the medical_exam as @medical_exam" do
        medical_exam = MedicalExam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MedicalExam.any_instance.stub(:save).and_return(false)
        put :update, {:id => medical_exam.to_param, :medical_exam => { "emp_id" => "invalid value" }}, valid_session
        assigns(:medical_exam).should eq(medical_exam)
      end

      it "re-renders the 'edit' template" do
        medical_exam = MedicalExam.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MedicalExam.any_instance.stub(:save).and_return(false)
        put :update, {:id => medical_exam.to_param, :medical_exam => { "emp_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested medical_exam" do
      medical_exam = MedicalExam.create! valid_attributes
      expect {
        delete :destroy, {:id => medical_exam.to_param}, valid_session
      }.to change(MedicalExam, :count).by(-1)
    end

    it "redirects to the medical_exams list" do
      medical_exam = MedicalExam.create! valid_attributes
      delete :destroy, {:id => medical_exam.to_param}, valid_session
      response.should redirect_to(medical_exams_url)
    end
  end

end
