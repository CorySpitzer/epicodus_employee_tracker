require('spec_helper')

describe(Project) do
  it("tells which employees are on a project") do
    project1 = Project.create({:name => "web site"})
    project2 = Project.create({:name => "fix bugs"})
    division1 = Division.create({:name => "division1"})
    employee1 = Employee.create({:name => "employee1", :division_id => division1.id})
    employee2 = Employee.create({:name => "employee2", :division_id => division1.id})
    project1.update({:employee_ids => [employee1.id(), employee2.id()]})
    expect(project1.employees()).to(eq([employee1, employee2]))
  end
end
