json.array!(@exams) do |exam|
  json.extract! exam, :name, :max, :min
  json.url exam_url(exam, format: :json)
end