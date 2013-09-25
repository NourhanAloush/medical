class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    if signed_in?
      @patients = Patient.all
      @patients = @patients.paginate(:page => params[:page], :per_page => 15).order('created_at ASC')
    else
      redirect_to newpatient_path
    end
t = Thread.new do
  port_str = "/dev/ttyUSB0"
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    @old_id = ""
    @conc_id = ""
    while true do
     @id = sp.getc
     printf("%c", @id)
     if(@old_id != @id)
        @conc_id = @conc_id + @id
      else
         Patient.create(:patient_id => @conc_id)
        @conc_id = ""
      end
      @old_id = @id
    end
    sp.close 
end

  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @id = "#{params[:patient_id]}" + ".0"
    @employee = Employee.where(:employee_id => @id).first
    redirect_to employee_path(@employee)
  end

  def enter
     @patient = Patient.where(:patient_id => params[:patient_id]).first
     @patient.update_attributes(:updated_at => Time.now)
     @newPatient = Patient.where(:clinic_type => @patient.clinic_type).first
     # Send message
     @url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=your turn is now, please go to the clinic"
     open(@url)
     redirect_to root_path  
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @id = "#{patient_params[:patient_id]}" + ".0"
    @employee = Employee.where(:employee_id => @id).first.mobile
    if @patient.save
      if(@employee!=nil)
        flash[:success] = "Please wait and a message will be sent to you shortly at number "+ @employee +", if wrong please check with the clinic administration"
      else
        flash[:success] = "your number is not found, please check with the clinic administration to add it"
      end
      redirect_to newpatient_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:patient_id, :clinic, :clinic_type)
    end
end
