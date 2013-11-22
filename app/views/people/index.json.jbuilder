json.array!(@people) do |person|
  json.extract! person, :age, :name, :birthday, :status
  json.url person_url(person, format: :json)
end
