require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '1d' do
	@employees = Employee.all
	@employees.each do |employee|
		@medical_exams_soon = []
		@medical_exams = MedicalExams.where(emp_id: employee.employee_id)
		@medical_exams.each do |exam|
			if(exam.exam_time == Date.today + 2)
				@medical_exams_soon << exam
			end
		end
		if(modified)
			if(@medical_exams_soon.count > 0)
				UserMailer.notification(employee, @medical_exams_soon).deliver
			end
		end
	end
end