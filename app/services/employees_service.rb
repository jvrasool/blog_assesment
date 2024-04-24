require 'net/http'
require 'net/https'

class EmployeesService

  def employee(params, uri, api)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    request = api
    request['Content-Type'] = 'application/json'
    body = {
      "name": params[:name],
      "position": params[:position],
      "date_of_birth": params[:date_of_birth],
      "salary": params[:salary]
    }.to_json
    request.body = body

    http.request(request)
  end

end