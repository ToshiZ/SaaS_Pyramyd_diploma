json.array!(@user_tasks) do |user_task|
  json.extract! user_task, :id, :task_name, :mqinfo, :stdout_rez, :work_status, :errors, :manager_log, :output, :status
  json.url user_task_url(user_task, format: :json)
end
