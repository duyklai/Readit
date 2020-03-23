require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { Tag.new(:name => "newtag") }

  it 'is valid' do
    expect(tag).to be_valid
  end
end
