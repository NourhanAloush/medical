class EmployeesController < ApplicationController
 
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_employee2, only: [:add_disease, :add_vaccine]
  

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    @employees = @employees.paginate(:page => params[:page], :per_page => 9).order('name ASC')
  end

  def miss_employees
    @employees = Employee.all
    @medical_exams = []
    @employees.each do |e|
      if(e.done == "false" && e.department == "Warehouse" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.done == "false" && e.department == "Fabric Care" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.done == "false" && e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date-2.day).year == Date.today.year-1 || (e.emp_date-2.day).year == Date.today.year-2 || (e.emp_date-2.day).year == Date.today.year-3)) 
        @medical_exams << e
      end
      if(e.done == "false" && e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date-2.day).year%2 == Date.today.year%2))
        @medical_exams << e
      end
      if(e.done == "false" && e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date).year+10 == Date.today.year || ((Date.today.year-(e.emp_date-2.day).year)%5==0 && Date.today.year > (e.emp_date-2.day).year+10)))
        @medical_exams << e
      end
      if(e.done == "false" && (e.deptType == "Bar Soap" || e.department == "Home Care") && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.done == "false" && e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.done == "false" && e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month && ((  (Date.today.year - (e.emp_date-2.day).year == 20) || Date.today.year - (e.emp_date-2.day).year == 25 || Date.today.year - (e.emp_date-2.day).year == 30 || Date.today.year - (e.emp_date-2.day).year == 33 || Date.today.year - (e.emp_date-2.day).year == 36 || Date.today.year - (e.emp_date-2.day).year == 39 || Date.today.year - (e.emp_date-2.day).year >= 40)))
        @medical_exams << e
      end
    end
    @medical_exams = @medical_exams.paginate(:page => params[:page], :per_page => 9)
    render 'employees/miss'
  end

  def employees_exams
    @employees = Employee.all
    @medical_exams = []
    @employees.each do |e|
      if(e.department == "Warehouse" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day)
        @medical_exams << e
      end
      if(e.department == "Fabric Care" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day)
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day && ((e.emp_date-2.day).year == Date.today.year-1 || (e.emp_date-2.day).year == Date.today.year-2 || (e.emp_date-2.day).year == Date.today.year-3)) 
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day && ((e.emp_date-2.day).year%2 == Date.today.year%2))
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day && ((e.emp_date).year+10 == Date.today.year || ((Date.today.year-(e.emp_date-2.day).year)%5==0 && Date.today.year > (e.emp_date-2.day).year+10)))
        @medical_exams << e
      end
      if((e.deptType == "Bar Soap" || e.department == "Home Care") && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day)
        @medical_exams << e
      end
      if(e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day)
        @medical_exams << e
      end
      if(e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month && (e.emp_date-2.day).day == Date.today.day && ((  (Date.today.year - (e.emp_date-2.day).year == 20) || Date.today.year - (e.emp_date-2.day).year == 25 || Date.today.year - (e.emp_date-2.day).year == 30 || Date.today.year - (e.emp_date-2.day).year == 33 || Date.today.year - (e.emp_date-2.day).year == 36 || Date.today.year - (e.emp_date-2.day).year == 39 || Date.today.year - (e.emp_date-2.day).year >= 40)))
        @medical_exams << e
      end
    end
    @medical_exams = @medical_exams.paginate(:page => params[:page], :per_page => 10)
    render 'employees/medical_exams'
  end



  def statistics
    @employees = Employee.all
    @medical_exams = []
    done = 0.0;
    miss = 0.0;
    @employees.each do |e|
      if(e.department == "Warehouse" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.department == "Fabric Care" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date-2.day).year == Date.today.year-1 || (e.emp_date-2.day).year == Date.today.year-2 || (e.emp_date-2.day).year == Date.today.year-3)) 
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date-2.day).year%2 == Date.today.year%2))
        @medical_exams << e
      end
      if(e.department == "FemCare" && (e.emp_date-2.day).month == Date.today.month && ((e.emp_date).year+10 == Date.today.year || ((Date.today.year-(e.emp_date-2.day).year)%5==0 && Date.today.year > (e.emp_date-2.day).year+10)))
        @medical_exams << e
      end
      if((e.deptType == "Bar Soap" || e.department == "Home Care") && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month)
        @medical_exams << e
      end
      if(e.special == "FirstAid" && (e.emp_date-2.day).month == Date.today.month && ((  (Date.today.year - (e.emp_date-2.day).year == 20) || Date.today.year - (e.emp_date-2.day).year == 25 || Date.today.year - (e.emp_date-2.day).year == 30 || Date.today.year - (e.emp_date-2.day).year == 33 || Date.today.year - (e.emp_date-2.day).year == 36 || Date.today.year - (e.emp_date-2.day).year == 39 || Date.today.year - (e.emp_date-2.day).year >= 40)))
        @medical_exams << e
      end
    end
    @medical_exams.each do |e|
      if(e.done == "true")
        done = done+1
      end
      if(e.done == "false")
        miss = miss+1
      end
    end


    all = done + miss
    done = (done/all)*100
    miss = (miss/all)*100


   @chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]})
      series = {
               :type=> 'pie',
               :name=> 'Medical Examination statistics',
               :data=> [
                  ['Miss',   miss],
                  {
                     :name=> 'Done',    
                     :y=> done,
                     :sliced=> true,
                     :selected=> true
                  }
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Medical Examination"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :cursor=>"pointer" , 
        :allowPointSelect=>true,
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
  end






  render 'employees/statistics'
  end

  def doneExams
    @employee = Employee.where(:employee_id => params[:employee_id]).first
    @employee.update_attributes(:done => 'true')
    redirect_to employeesexams_url, notice: "employees updated."
  end
  def missExams
    @employee = Employee.where(:employee_id => params[:employee_id]).first
    @employee.update_attributes(:done => 'false')
    redirect_to employeesexams_url, notice: "employees updated."
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @vaccines = Vaccine.where(:emp_id => @employee.employee_id)
    @diseases = Disease.where(:emp_id => @employee.employee_id)
    if(@employee.department == "Warehouse" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day)
      @medical_exams = "Enzyme, Respiratory, PFT"
    end
    if(@employee.department == "Fabric Care" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day)
      @medical_exams = "Hearing, Enzyme, Respiratory, PFT, Chest Xray"
    end
    if(@employee.department == "FemCare" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day && ((@employee.emp_date-2.day).year == Date.today.year-1 || (@employee.emp_date-2.day).year == Date.today.year-2 || (@employee.emp_date-2.day).year == Date.today.year-3)) 
      @medical_exams = "PFT"
    end
    if(@employee.department == "FemCare" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day && ((@employee.emp_date-2.day).year%2 == Date.today.year%2))
      @medical_exams = "Respiratory"
    end
    if(@employee.department == "FemCare" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day && ((@employee.emp_date).year+10 == Date.today.year || ((Date.today.year-(@employee.emp_date-2.day).year)%5==0 && Date.today.year > (@employee.emp_date-2.day).year+10)))
      @medical_exams = "Chest Xray"
    end
    if((@employee.deptType == "Bar Soap" || @employee.department == "Home Care") && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day)
      @medical_exams = "Hearing"
    end
    if(@employee.special == "FirstAid" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day)
      @medical_exams = "Hearing, Enzyme, Respiratory, PFT, General Examination & Fitness"
    end
    if(@employee.special == "FirstAid" && (@employee.emp_date-2.day).month == Date.today.month && (@employee.emp_date-2.day).day == Date.today.day && ((  (Date.today.year - (@employee.emp_date-2.day).year == 20) || Date.today.year - (@employee.emp_date-2.day).year == 25 || Date.today.year - (@employee.emp_date-2.day).year == 30 || Date.today.year - (@employee.emp_date-2.day).year == 33 || Date.today.year - (@employee.emp_date-2.day).year == 36 || Date.today.year - (@employee.emp_date-2.day).year == 39 || Date.today.year - (@employee.emp_date-2.day).year >= 40)))
      @medical_exams = "ECG"
    end


  end

 def add_vaccine
    @employee = Employee.where(:employee_id => params[:employee_id]).first
    @vaccine = Vaccine.create(:emp_id => params[:employee_id], name: params[:name])
    @vaccine.save
    redirect_to @employee, notice: "employees updated."
  end

  def add_disease
     @employee = Employee.where(:employee_id => params[:employee_id]).first
    @disease = Disease.create(:emp_id => params[:employee_id], name: params[:name])
    @disease.save
    redirect_to @employee, notice: "employees updated."
  end

  def delete_vaccine
    @employee = Employee.where(:employee_id => params[:employee_id]).first
    @vaccine = Vaccine.where(:emp_id => params[:employee_id], name: params[:name]).first
    @vaccine.destroy
    redirect_to @employee, notice: "employees updated."
  end

  def delete_disease
     @employee = Employee.where(:employee_id => params[:employee_id]).first
    @disease = Disease.where(:emp_id => params[:employee_id], name: params[:name]).first
    @disease.destroy
    redirect_to @employee, notice: "employees updated."
  end

  def import
    Employee.import(params[:file])
    redirect_to employees_url, notice: "employees updated."
  end

  def search
    @employees = Employee.where(:special => params[:word])
    @employees = @employees.paginate(:page => params[:page], :per_page => 10).order('name ASC')
    render 'employees/search'
  end

  def edit_DB
    render 'employees/database'
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_employee2
      @employee = Employee.where(:employee_id => params[:employee_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:id, :name, :employee_id, :department, :blood_group, :date_of_birth, :Transfer, :database)
    end
end
