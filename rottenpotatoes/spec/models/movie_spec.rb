# require 'spec_helper'

# describe Movie do
#   describe 'searching for movies by director' do
#     before each do
#       @fake_results = [mock{'movie1'}, mock{'movie2'}] 
#     end
#     it 'should call find movies by director' do
#       Movie.should_receive(method).with('what')
#         and_return(@fake_results)
#     end
#   end 
# end

require 'spec_helper'

describe Movie do
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:find_by_director).with('Star Wars')
      Movie.find_by_director('Star Wars')
    end

    it 'should call Movie with director' do
      Movie.should_receive(:find_by_director).with('Moonrise Kingdom')
      Movie.find_by_director('Moonrise Kingdom')
    end
  end
end