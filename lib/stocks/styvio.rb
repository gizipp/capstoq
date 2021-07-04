module Stocks
  class Styvio
    def data(ticker)
      send_request!(
        URI("https://www.styvio.com/api/#{ticker}")
      )
    end

    def sentiment(ticker)
      send_request!(
        URI("https://www.styvio.com/api/sentiment/#{ticker}")
      )
    end

    private
      def send_request!(url)
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Content-Type"] = "application/json"

        response = https.request(request)
        JSON.parse(response.read_body)
      end
  end
end
