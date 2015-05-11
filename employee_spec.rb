describe(Employee) do
  it("tells which division an employee belongs to") do
    division1 = Division.create({:name => "division1"})
    employee1 = Employee.create({:name => "employee1", :division_id => division.id})
  end
end
