json.extract! result, :id, :total, :choices_accomplished, :choice_score, :sliders_accomplished, :user_id, :created_at, :updated_at
json.url result_url(result, format: :json)
