require "spec_helper"

describe MedicalExamsController do
  describe "routing" do

    it "routes to #index" do
      get("/medical_exams").should route_to("medical_exams#index")
    end

    it "routes to #new" do
      get("/medical_exams/new").should route_to("medical_exams#new")
    end

    it "routes to #show" do
      get("/medical_exams/1").should route_to("medical_exams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/medical_exams/1/edit").should route_to("medical_exams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/medical_exams").should route_to("medical_exams#create")
    end

    it "routes to #update" do
      put("/medical_exams/1").should route_to("medical_exams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/medical_exams/1").should route_to("medical_exams#destroy", :id => "1")
    end

  end
end
