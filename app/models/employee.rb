class Employee < ActiveRecord::Base  
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    employee = Employee.where(:employee_id => String(row["ID"])).first
	    if(employee != nil)
	    	employee.update_attributes(:name => String(row["Name"]), :department => String(row["GBU"]), :deptType => String(row["Module"]), 
	    		:date_of_birth => String(row["Birth"]), :emp_date => String(row["Hiring"]), :mobile => String(row["Mobile"]), :blood_group => String(row["Blood"]))
	    else
	    	employee = Employee.create(:employee_id => String(row["ID"]), :name => String(row["Name"]), :department => String(row["GBU"]), :deptType => String(row["Module"]), 
	    		:date_of_birth => String(row["Birth"]), :emp_date => String(row["Hiring"]), :mobile => String(row["Mobile"]), :blood_group => String(row["Blood"]))
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
