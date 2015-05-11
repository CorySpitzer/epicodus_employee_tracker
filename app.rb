require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/division")
require("./lib/employee")
require("pg")

get('/') do
  erb(:index)
end

get('/employees') do
  @employees = Employee.all
  erb(:employees)
end

get('/divisions') do
  @divisions = Division.all
  erb(:divisions)
end

post("/employees") do
  name = params.fetch("name")
  employee = Employee.new({:name => name})
  employee.save()
  @employees = Employee.all
  erb(:employees)
end

post("/divisions") do
  name = params.fetch("name")
  division = Division.new({:name => name})
  division.save()
  @divisions = Division.all
  erb(:divisions)
end

get('/employees/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  @divisions = Division.all()
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  @divisions = Division.all()
  erb(:employee_edit)
end

post("/employees/:id") do
  @employee_id = params.fetch("id").to_i()
  @employee = Employee.find(@employee_id)
  @employee_division = @employee.division
  @division_id = params.fetch("division_id")
  Division.find(@division_id.to_i()).update({:employee_ids => [@employee_id]})
  @divisions = Division.all()
  erb(:employee_edit)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = Employee.all()
  erb(:division_edit)
end

post("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  employee_ids = params.fetch("employee_ids")
  @division.update({:employee_ids => employee_ids})
  @employees = Employee.all()
  erb(:division_edit)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division_id = params.fetch("id").to_i()
  @division = Division.find(@division_id)
  @division.update({:name => name})
  @employees = Employee.all
  erb(:division_edit)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:divisions)
end
