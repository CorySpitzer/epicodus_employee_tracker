require('spec_helper')

describe(Employee) do
  it("tells which division an employee belongs to") do
    division1 = Division.create({:name => "division1"})
    employee1 = Employee.create({:name => "employee1", :division_id => division1.id})
    expect(employee1.division()).to(eq(division1))
  end
end

describe(Employee) do
  it("tells which projects an employee is on") do
    project1 = Project.create({:name => "web site"})
    project2 = Project.create({:name => "fix bugs"})
    division1 = Division.create({:name => "division1"})
    employee1 = Employee.create({:name => "employee1", :division_id => division1.id})
    employee1.update({:project_ids => [project1.id(), project2.id()]})
    expect(employee1.projects()).to(eq([project1, project2]))
  end
end

#
# describe(Todo) do
#   before() do
#     Todo.clear()
#   end
# end
#
# describe(Todo) do
#   describe('#==') do
#     it('is the same task if it has the same description') do
#       todo1 = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       todo2 = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       expect(todo1).to(eq(todo2))
#     end
#   end
#
#   describe("#description") do
#     it("lets you give it a description") do
#       test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       test_task.save()
#       expect(test_task.description()).to(eq("scrub the zebra"))
#       expect(test_task.list_id()).to(eq(1))
#     end
#   end
#
#   describe("#list_id") do
#     it("lets you read the list ID") do
#       test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       test_task.save()
#       expect(test_task.list_id()).to(eq(1))
#     end
#   end
#
#   # describe("#due_date") do
#   #   it("Adds a due date") do
#   #     test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1})
#   #     test_task.save()
#   #     expect(test_task.due_date()).to(eq('2015-04-01'))
#   #   end
#   # end
#
#   describe("#==") do
#     it("is the same task if has same desc and list ID") do
#       test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       test_task_2 = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       expect(test_task).to(eq(test_task_2))
#     end
#   end
#
#   describe(".all") do
#     it("is empty at first") do
#       expect(Todo.all()).to(eq([]))
#     end
#   end
#
#   describe("#save") do
#     it("adds a task to array of saved tasks") do
#       test_task = Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil})
#       test_task.save()
#       expect(Todo.all()).to(eq([test_task]))
#     end
#   end
#
#   describe(".clear") do
#     it("empties out all tasks") do
#       Todo.new({:description => 'scrub the zebra', :list_id => 1, :id => nil}).save()
#       Todo.clear()
#       expect(Todo.all()).to(eq([]))
#     end
#   end
#
#   describe(".find") do
#     it("returns a task by its ID") do
#       test_task = Todo.new({:description => "Epicodus stuff", :list_id => 1, :id => nil})
#       test_task.save()
#       test_task2 = Todo.new({:description => "Home stuff", :list_id => 1, :id => nil})
#       test_task2.save()
#       expect(Todo.find(test_task2.id())).to(eq(test_task2))
#     end
#   end
#
#   describe(".delete") do
#     it("deletes a task by its ID") do
#       test_task = Todo.new({:description => "Epicodus stuff", :list_id => 1, :id => nil})
#       test_task.save()
#       test_task.delete()
#       expect(Todo.find(test_task.id()).to(FAIL))
#
#
#     end
