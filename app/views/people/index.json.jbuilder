json.array!(@people) do |person|
  json.extract! person, :name, :age, :birthday
  json.url person_url(person, format: :json)
end
