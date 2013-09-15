class UserMailer < ActionMailer::Base
  default :from => "Nourhan <nourhan.aloush@gmail.com>"

  def notification(employee, exams)
    @employee = employee
    @exams = exams
    email_with_name = "#{@employee.name} <#{@employee.email}>"
  	mail(:to => email_with_name, :subject => "Medical Examination notification")  
  end

end  