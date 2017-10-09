require_relative 'project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do 
    @project1 = Project.new('Project 1', 'description 1', 'owner 1')
    @project2 = Project.new('Project 2', 'description 2', 'owner 2')
  end
  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end
  it 'has a getter and setter for description attribute' do
    @project1.description = "Changed Description"
    expect(@project1.description).to eq("Changed Description")
  end
  it 'has a getter and setter for owner attribute' do
    @project1.owner = "Changed Owner"
    expect(@project1.owner).to eq("Changed Owner")
  end
  it 'has a tasks attribute that initializes as an empty array, and tasks method that returns tasks attribute' do
    expect(@project1.tasks).to eq([])
  end
  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2")
  end
  it 'has a method add_tasks that pushes a task to tasks array, and tasks method that returns tasks attribute' do
    @project1.add_tasks("New Task")
    expect(@project1.tasks).to eq(["New Task"])
    @project1.add_tasks("Another Task")
    expect(@project1.tasks).to eq(["New Task","Another Task"])
  end
  it 'has a method that prints the tasks array' do
    @project1.add_tasks("New Task")
    expect{@project1.print_tasks}.to output('["New Task"]').to_stdout
    @project1.add_tasks("Another Task")
    expect{@project1.print_tasks}.to output('["New Task", "Another Task"]').to_stdout
  end
end