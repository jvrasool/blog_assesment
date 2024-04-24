module EmployeesConcern
  extend ActiveSupport::Concern

  def get_request(uri)
    Net::HTTP.get(uri)
  end

  def parse_json(json)
    JSON.parse(json)
  end

  def get_employees_uri
    params[:page].present? ? URI("#{Constants::HEROKU_APP_URL}?page=#{params[:page]}") : URI(Constants::HEROKU_APP_URL)
  end

  def get_employee_uri
    URI("https://dummy-employees-api-8bad748cda19.herokuapp.com/employees/#{params[:id]}")
  end

  def create_employee_api(uri)
    Net::HTTP::Post.new(uri.path)
  end

  def update_employee_api(uri)
    Net::HTTP::Put.new(uri.path)
  end

end
