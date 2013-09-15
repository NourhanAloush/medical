require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do
	@employees = Employee.all
	@employees.each do |employee|
		if(employee.department == "Warehouse" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Enzyme, Respiratory, PFT")
		end
		if(employee.department == "Fabric Care" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, Chest Xray")
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year == Date.today.year-1 || (employee.emp_date-2.day).year == Date.today.year-2 || (employee.emp_date-2.day).year == Date.today.year-3)) 
			printf("%s", employee.name)
			printf("%s", "PFT")
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year%2 == Date.today.year%2))
			printf("%s", employee.name)
			printf("%s", "Respiratory")
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date).year+10 == Date.today.year || ((Date.today.year-(employee.emp_date-2.day).year)%5==0 && Date.today.year > (employee.emp_date-2.day).year+10)))
			printf("%s", employee.name)
			printf("%s", "Chest Xray")
		end
		if((employee.deptType == "Bar Soap" || employee.department == "Home Care") && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing")
		end
		if(employee.department == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, General Examination & Fitness")
		end
		if(employee.department == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((  (Date.today.year - (employee.emp_date-2.day).year == 20) || Date.today.year - (employee.emp_date-2.day).year == 25 || Date.today.year - (employee.emp_date-2.day).year == 30 || Date.today.year - (employee.emp_date-2.day).year == 33 || Date.today.year - (employee.emp_date-2.day).year == 36 || Date.today.year - (employee.emp_date-2.day).year == 39 || Date.today.year - (employee.emp_date-2.day).year >= 40)))
			printf("%s", employee.name)
			printf("%s", "ECG")
		end
	end
end
