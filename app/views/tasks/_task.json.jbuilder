json.extract! task, :id, :title, :description, :reward, :status, :parent_id, :assigned_to, :created_at, :updated_at
json.url task_url(task, format: :json)
