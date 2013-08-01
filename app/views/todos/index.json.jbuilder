json.array!(@todos) do |todo|
  json.extract! todo, :description, :done, :due
  json.url todo_url(todo, format: :json)
end
