json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :start, :end, :assignee_id, :list_id
  json.url task_url(task, format: :json)
end
