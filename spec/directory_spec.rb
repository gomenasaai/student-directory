require 'directory'

describe 'student directory' do

	before(:each) do
		@writer = double('writer')
		@reader = double('reader')
    @dir = StudentDirectory.new(@writer, @reader)
  	end
 
	context 'loading data' do

		it 'there are no students' do
			expect(@dir.students).to be_empty
		end

		it 'loads from a file' do
			
			expect(CSV).to receive(:foreach).with('students.csv')
			@dir.load_students_from('students.csv')
		end

		it 'imports a student' do
			
			student = {name:'Nic',cohort:'may',year:2014}
			@dir.import(student)
			expect(@dir.students).to eq [student]
		end

		it 'creates a student' do
			
			student = {name:'Nic',cohort:'may',year:2014}
		  expect(@dir.import_from(['Nic','may',2014])).to eq student
		end

	end


end