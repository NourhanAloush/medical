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