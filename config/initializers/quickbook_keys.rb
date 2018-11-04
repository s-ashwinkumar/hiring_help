OAUTH_CONSUMER_KEY = "Q0kvHQ1iybqQ0E6cfEarAMpYt2kaipnZNVV6uHSD5OeldRTLfZ"
OAUTH_CONSUMER_SECRET = "DJIcXX532R8jtFWkfF2FsMfvZWCQ6LUb96wtFHfa"

::QB_OAUTH_CONSUMER = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
    :access_token_path    => "/oauth/v1/get_access_token"
})