class SpotifyApiAdapter
    
    def urls
        {
            "auth" => "https://accounts.spotify.com/api/token",
            "me" => "https://api.spotify.com/v1/me",
        }
    end

    def self.body_params
        body = {
            client_id: ENV['CLIENT_ID'],
            client_secret: ENV["CLIENT_SECRET"]
        }
    end

    def self.login(code)
        body = body_params.dup
        body[:grant_type] = "authorization_code"
        body[:code] = code
        body[:redirect_uri] = ENV['REDIRECT_URI']

        auth_response = RestClient.post(urls["auth"], body)
        JSON.parse(auth_response.body)
    end

    def self.getUserData(access_token)
        header = {
            "Authorization": "Bearer #{access_token}"
        }

        user_response = RestClient.get(urls["me"], header)

        JSON.parse(user_response.body)
    end


end