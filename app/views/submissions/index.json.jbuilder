json.array!(@submissions) do |submission|
  json.extract! submission, :id, :business, :description
  json.url submission_url(submission, format: :json)
end
