class SpotifyApiAdapter
    URLS={
        "auth" => "https://accounts.spotify.com/api/token",
        "me" => "https://api.spotify.com/v1/me",
    }

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

        authorize(body)
    end

    def self.getUserData(access_token)
        header = {
            "Authorization": "Bearer #{access_token}"
        }

        user_response = RestClient.get(URLS["me"], header)

        JSON.parse(user_response.body)
    end

    def self.authorize(body)
        auth_response = RestClient.post(URLS["auth"], body)
        JSON.parse(auth_response.body)
    end

end