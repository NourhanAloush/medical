require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '1d' do
	@employees = Employee.all
	@employees.each do |employee|
		if(employee.have_exam == "true" && employee.department == "Warehouse" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Enzyme, Respiratory, PFT")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.department == "Fabric Care" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, Chest Xray")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year == Date.today.year-1 || (employee.emp_date-2.day).year == Date.today.year-2 || (employee.emp_date-2.day).year == Date.today.year-3)) 
			printf("%s", employee.name)
			printf("%s", "PFT")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year%2 == Date.today.year%2))
			printf("%s", employee.name)
			printf("%s", "Respiratory")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date).year+10 == Date.today.year || ((Date.today.year-(employee.emp_date-2.day).year)%5==0 && Date.today.year > (employee.emp_date-2.day).year+10)))
			printf("%s", employee.name)
			printf("%s", "Chest Xray")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && (employee.deptType == "Bar Soap" || employee.department == "Home Care") && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.special == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, General Examination & Fitness")
			@url = ""
     		open(@url)
		end
		if(employee.have_exam == "true" && employee.special == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((  (Date.today.year - (employee.emp_date-2.day).year == 20) || Date.today.year - (employee.emp_date-2.day).year == 25 || Date.today.year - (employee.emp_date-2.day).year == 30 || Date.today.year - (employee.emp_date-2.day).year == 33 || Date.today.year - (employee.emp_date-2.day).year == 36 || Date.today.year - (employee.emp_date-2.day).year == 39 || Date.today.year - (employee.emp_date-2.day).year >= 40)))
			printf("%s", employee.name)
			printf("%s", "ECG")
			@url = ""
     		open(@url)
		end
	end
end


scheduler.every '1y' do


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
      end    
    end
	sp.close 

end