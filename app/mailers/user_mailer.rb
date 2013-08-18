#@Author= Hazem El-Kilisly

class UserMailer < ActionMailer::Base
  default :from => "Nourhan <nourhan.aloush@gmail.com>"

#@Author= Nourhan Aloush
#@Summary= The digest email of the supplier
# => it checks if something new has been updated in any of his offers
# => if yes, it will send a summry of these offers
#@ParamName= "user" => the user itself, in this case it will be a supplier
  def notification(employee, exams)
    @employee = employee
    @exams = exams
    email_with_name = "#{@employee.name} <#{@employee.email}>"
  	mail(:to => email_with_name, :subject => "Medical Examination notification")  
  end

end  