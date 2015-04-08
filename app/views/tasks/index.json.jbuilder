json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :mqinfo, :stdout_rez, :work_status, :errors_suppz, :manager_log, :output_suppz, :status_suppz
  json.url task_url(task, format: :json)
end
