if Rails.env.development?
  ENV['client_id']     = '8d0f24929a099dbbae296e04dcea7c27c28ad516aa601b60296d0bf50bd4b3e0'
  ENV['client_secret'] = 'f49ef898123443bc72f517edc32b6f720f4bdb3656cf6abbcb4f8c673641384a'
end

CLIENT_ID = ENV['client_id']
CLIENT_SECRET = ENV['client_secret']
