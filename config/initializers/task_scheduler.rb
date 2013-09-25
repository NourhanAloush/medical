require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '1d' do
	@employees = Employee.all
	@employees.each do |employee|
		if(employee.department == "Warehouse" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Enzyme, Respiratory, PFT")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Enzyme, Respiratory, PFT Examination after 2 days"
     		open(@url)
		end
		if(employee.department == "Fabric Care" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, Chest Xray")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Hearing, Enzyme, Respiratory, PFT, Chest Xray Examination after 2 days"
     		open(@url)
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year == Date.today.year-1 || (employee.emp_date-2.day).year == Date.today.year-2 || (employee.emp_date-2.day).year == Date.today.year-3)) 
			printf("%s", employee.name)
			printf("%s", "PFT")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have PFT Examination after 2 days"
     		open(@url)
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date-2.day).year%2 == Date.today.year%2))
			printf("%s", employee.name)
			printf("%s", "Respiratory")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Respiratory Examination after 2 days"
     		open(@url)
		end
		if(employee.department == "FemCare" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((employee.emp_date).year+10 == Date.today.year || ((Date.today.year-(employee.emp_date-2.day).year)%5==0 && Date.today.year > (employee.emp_date-2.day).year+10)))
			printf("%s", employee.name)
			printf("%s", "Chest Xray")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Chest Xray Examination after 2 days"
     		open(@url)
		end
		if((employee.deptType == "Bar Soap" || employee.department == "Home Care") && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Hearing Examination after 2 days"
     		open(@url)
		end
		if(employee.special == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day)
			printf("%s", employee.name)
			printf("%s", "Hearing, Enzyme, Respiratory, PFT, General Examination & Fitness")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have Hearing, Enzyme, Respiratory, PFT, General Examination & Fitness Examination after 2 days"
     		open(@url)
		end
		if(employee.special == "FirstAid" && (employee.emp_date-2.day).month == Date.today.month && (employee.emp_date-2.day).day == Date.today.day && ((  (Date.today.year - (employee.emp_date-2.day).year == 20) || Date.today.year - (employee.emp_date-2.day).year == 25 || Date.today.year - (employee.emp_date-2.day).year == 30 || Date.today.year - (employee.emp_date-2.day).year == 33 || Date.today.year - (employee.emp_date-2.day).year == 36 || Date.today.year - (employee.emp_date-2.day).year == 39 || Date.today.year - (employee.emp_date-2.day).year >= 40)))
			printf("%s", employee.name)
			printf("%s", "ECG")
			@url = "http://webxpert-eg.com/send_sms/medical_sms.php?dial=201115229658&message=You have ECG Examination after 2 days"
     		open(@url)
		end
	end
end