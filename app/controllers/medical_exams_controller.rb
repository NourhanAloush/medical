class MedicalExamsController < ApplicationController
  before_action :set_medical_exam, only: [:show, :edit, :update, :destroy]

  # GET /medical_exams
  # GET /medical_exams.json
  def index
    @medical_exams = MedicalExam.all
  end

  # GET /medical_exams/1
  # GET /medical_exams/1.json
  def show
  end

  # GET /medical_exams/new
  def new
    @medical_exam = MedicalExam.new
  end

  # GET /medical_exams/1/edit
  def edit
  end

  # POST /medical_exams
  # POST /medical_exams.json
  def create
    @medical_exam = MedicalExam.new(medical_exam_params)

    respond_to do |format|
      if @medical_exam.save
        format.html { redirect_to @medical_exam, notice: 'Medical exam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_exam }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_exams/1
  # PATCH/PUT /medical_exams/1.json
  def update
    respond_to do |format|
      if @medical_exam.update(medical_exam_params)
        format.html { redirect_to @medical_exam, notice: 'Medical exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_exams/1
  # DELETE /medical_exams/1.json
  def destroy
    @medical_exam.destroy
    respond_to do |format|
      format.html { redirect_to medical_exams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_exam
      @medical_exam = MedicalExam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_exam_params
      params.require(:medical_exam).permit(:emp_id, :exam_type, :exam_time)
    end
end
