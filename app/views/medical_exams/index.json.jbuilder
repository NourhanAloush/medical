json.array!(@medical_exams) do |medical_exam|
  json.extract! medical_exam, :emp_id, :exam_type, :exam_time
  json.url medical_exam_url(medical_exam, format: :json)
end