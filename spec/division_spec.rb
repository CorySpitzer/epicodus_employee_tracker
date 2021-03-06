require('spec_helper')

describe(Division) do
  it("tells which employees are in a division") do
    division1 = Division.create({:name => "division1"})
    employee1 = Employee.create({:name => "employee1", :division_id => division1.id})
    employee2 = Employee.create({:name => "employee2", :division_id => division1.id})
    expect(division1.employees()).to(eq([employee1, employee2]))
  end
end


  # describe(List) do
  #   before() do
  #     List.clear()
  #   end
  #
  # describe(".all") do
  #   it("starts off with no lists") do
  #     expect(List.all()).to(eq([]))
  #   end
  # end
  #
  # describe('#name') do
  #   it('tells you its name') do
  #     list = List.new({:name => "Epicodus stuff", :id => nil})
  #     expect(list.name()).to(eq("Epicodus stuff"))
  #   end
  # end
  #
  # describe('#id') do
  #   it("sets its ID when you save it") do
  #     list = List.new({:name => "Epicodus stuff", :id => nil})
  #     list.save()
  #     expect(list.id()).to(be_an_instance_of(Fixnum))
  #   end
  # end
  #
  # describe("#==") do
  #   it("is the same list if it has the same name") do
  #     list1 = List.new({:name => "Epicodus stuff", :id => nil})
  #     list2 = List.new({:name => "Epicodus stuff", :id => nil})
  #     expect(list1).to(eq(list2))
  #   end
  # end
  #
  # describe(".find") do
  #   it("returns a list by its ID") do
  #     test_list = List.new({:name => "Epicodus stuff", :id => nil})
  #     test_list.save()
  #     test_list2 = List.new({:name => "Home stuff", :id => nil})
  #     test_list2.save()
  #     expect(List.find(test_list2.id())).to(eq(test_list2))
  #   end
  # end
  #
  # describe('#tasks') do
  #   it('returns an array of tasks for that list') do
  #     test_list = List.new({:name => "Epicodus stuff", :id => nil})
  #     test_list.save()
  #     test_task = Todo.new({:description => "Learn SQL", :list_id => test_list.id(), :id => nil})
  #     test_task.save()
  #     test_task2 = Todo.new({:description => "Review Ruby", :list_id => test_list.id(), :id => nil})
  #     test_task2.save()
  #     expect(test_list.tasks()).to(eq([test_task, test_task2]))
  #   end
  # end
