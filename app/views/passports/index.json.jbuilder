json.array!(@passports) do |passport|
  json.extract! passport, :id, :fileName, :taskName
  json.url passport_url(passport, format: :json)
end
