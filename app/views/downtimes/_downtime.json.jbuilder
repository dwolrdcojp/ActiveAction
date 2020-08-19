json.extract! downtime, :id, :date, :shift, :area, :line, :equipment, :start_time, :stop_time, :downtime, :reason_code, :comment, :created_at, :updated_at
json.url downtime_url(downtime, format: :json)
