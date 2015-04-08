json.array!(@user_tasks_infos) do |user_tasks_info|
  json.extract! user_tasks_info, :id, :task_name, :mqinfo, :stdout_rez, :work_status, :errors, :manager_log, :output
  json.url user_tasks_info_url(user_tasks_info, format: :json)
end
