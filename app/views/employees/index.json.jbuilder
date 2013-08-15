json.array!(@employees) do |employee|
  json.extract! employee, :name, :employee_id, :department, :blood_group, :date_of_birth, :Transfer
  json.url employee_url(employee, format: :json)
end