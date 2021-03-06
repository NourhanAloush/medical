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
    @id = ""
    while true do
      @char = sp.getc
      printf('%c', @char)
      if(@char =~ /\n/)
        @id = @id.strip 
        @id = (@id[21..46].to_i(2)).to_s
        @id = "#{@id}" + ".0"
        @emp = Employee.where(:card => @id).first
        @patient = Patient.new(:patient_id => (@emp.employee_id.slice(0..(@emp.employee_id.index('.0')-1))), :clinic_type => "clinic")
        @patient.save
        @id = ""
      else
        if(@char == "0")
          @id = @id + "0000"
        elsif(@char == "1")
          @id = @id + "0001"
        elsif(@char == "2")
          @id = @id + "0010"
        elsif(@char == "3")
          @id = @id + "0011"
        elsif(@char == "4")
          @id = @id + "0100"
        elsif(@char == "5")
          @id = @id + "0101"
        elsif(@char == "6")
          @id = @id + "0110"
        elsif(@char == "7")
          @id = @id + "0111"
        elsif(@char == "8")
          @id = @id + "1000"
        elsif(@char == "9")
          @id = @id + "1001"
        elsif(@char == "A")
          @id = @id + "1010"
        elsif(@char == "B")
          @id = @id + "1011"
        elsif(@char == "C")
          @id = @id + "1100"
        elsif(@char == "D")
          @id = @id + "1101"
        elsif(@char == "E")
          @id = @id + "1110"
        elsif(@char == "F")
          @id = @id + "1111"
        end
      end
      # else
      #   @patient = Patient.new(:patient_id => @id, :clinic_type => "clinic")
      #   @patient.save
      #   # printf('%c', @id)
      #   @id = ""
      # end
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
     
      require 'net/https'
      require 'uri'

      pass = Password.first.pass
       

      url = URI.parse('http://smpp2.routesms.com:8080/bulksms/bulksms?username=webxprt&password=iuyr68s9&type=2&dlr=0&destination=201115229658&source=00201115229658&message=062306450627064506430020066106600020062f0642062706260642')
      req = Net::HTTP::Post.new(URI.parse('http://smpp2.routesms.com:8080/bulksms/bulksms?username=webxprt&password=iuyr68s9&type=2&dlr=0&destination=201115229658&source=00201115229658&message=062306450627064506430020066106600020062f0642062706260642'))  
       
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == "https"  # enable SSL/TLS
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.start {
        http.request(req) {|res|
          puts res.body     
        }
      }

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
      params.require(:patient).permit(:patient_id, :clinic_type)
    end
end
