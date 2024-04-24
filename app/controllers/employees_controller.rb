require 'net/http'
require 'net/https'

class EmployeesController < ApplicationController
  include EmployeesConcern
  before_action :authenticate_user!
  
    def index
      uri = get_employees_uri
      @response = get_request uri
      @employees = parse_json @response
    end
  
    def edit
      uri = get_employee_uri
      @response = get_request uri
      @employee = parse_json @response
    end

    def show
      uri = get_employee_uri
      @response = get_request uri
      @employee = parse_json @response
    end

    def create
      uri = get_employee_uri
      response = EmployeesService.new.employee params, uri, create_employee_api(uri)

      puts "Response Code: #{response.code}"
      puts "Response Body: #{response.body}"

      @employee = parse_json response.body

      redirect_to employee_path(@employee.dig("id"))
    end
  
    def update

      uri = get_employee_uri
      response = EmployeesService.new.employee params, uri, update_employee_api(uri)

      puts "Response Code: #{response.code}"
      puts "Response Body: #{response.body}"

      @employee = parse_json response.body

      redirect_to edit_employee_path(@employee.dig("id"))
    end  
end
