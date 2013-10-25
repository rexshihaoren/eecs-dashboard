require 'spec_helper'

describe Directory do
	fixtures :directory
	it 'should include directory name and usage and quota' do
		directory=directorys(:proj1_directory)
		directory.usage==6
		directory.quota==10
	end
end

