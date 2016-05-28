re 'net/http'
require 'json'

class Webpage
  def call(env)
      content = File.read("map.html").gsub("{{locations}}", get_ubike)
          [200, {'Content-Type' => 'text/html'}, [content]]
	    end

	      private
	        def get_ubike
		    url = URI("http://data.ntpc.gov.tw/api/v1/rest/datastore/382000000A-000352-001")
		        raw_data = Net::HTTP.get(url)
			    JSON.parse(raw_data)["result"]["records"].map do |raw|
			          [ raw["sna"], raw["lat"].to_f, raw["lng"].to_f ]
				      end.to_s
				        end
					end

					run Webpage.new
				
