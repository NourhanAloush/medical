class EmployeesController < ApplicationController
 
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_employee2, only: [:add_disease, :add_vaccine]
  

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    @employees = @employees.paginate(:page => params[:page], :per_page => 8).order('name ASC')
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @vaccines = Vaccine.where(:emp_id => @employee.employee_id)
    @diseases = Disease.where(:emp_id => @employee.employee_id)
  end

 def add_vaccine
    @employee = Employee.where(:employee_id => params[:employee_id])
    @vaccine = Vaccine.create(:emp_id => params[:employee_id], name: params[:name])
    @vaccine.save
    redirect_to employees_url, notice: "employees updated."
  end

  def add_disease
     @employee = Employee.where(:employee_id => params[:employee_id])
    @disease = Disease.create(:emp_id => params[:employee_id], name: params[:name])
    @disease.save
    redirect_to employees_url, notice: "employees updated."
  end

  def import
    Employee.import(params[:file])
    redirect_to employees_url, notice: "employees updated."
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
