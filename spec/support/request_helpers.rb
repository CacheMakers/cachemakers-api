module Request

  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeaderHelpers

    def api_version_header
      request.headers['Accept'] = "application/vnd.marketplace.v1"
    end

    def api_response_format(format=Mime::JSON)
      request.headers['Content-Type'] = format.to_s
    end

    def include_default_accept_headers
      api_version_header
      api_response_format
    end

  end

end
