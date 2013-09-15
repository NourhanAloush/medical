class Employee < ActiveRecord::Base  
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    employee = Employee.where(:employee_id => row["ID"]).first
	    if(employee != nil)
	    	employee.update_attributes(:name => row["Name"], :department => row["GBU"], :deptType => row["Module"], 
	    		:date_of_birth => row["Birth"], :emp_date => row["Hiring"], :mobile => row["Mobile"], :blood_group => row["Blood"])
	    else
	    	employee = Employee.create(:employee_id => row["ID"], :name => row["Name"], :department => row["GBU"], :deptType => row["Module"], 
	    		:date_of_birth => row["Birth"], :emp_date => row["Hiring"], :mobile => row["Mobile"], :blood_group => row["Blood"])
	    end
	    employee.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
	  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
