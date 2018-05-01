class ApplicationController < ActionController::API
    def issue_token(payload)
        JWT.encode(payload, ENV["SOME_SECRET"], ENV["SOME_SUPER_SECRET"])
    end
  
    def decode(jwt_token)
        my_algorithm = { algorithm: ENV["SOME_SUPER_SECRET"]}
        JWT.decode(jwt_token, ENV["SOME_SECRET"], true, my_algorithm)[0]
    end
end
