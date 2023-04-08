require 'spec_helper'
require 'debug'

class MyClass
  def self.hello
    'Hello, world!'
  end
end

RSpec.describe MyClass do
  describe '.hello' do
    let(:count) { '1' }
    it 'returns the correct greeting' do
      debugger
      expect(count).to eq('2')
    end
  end
end
