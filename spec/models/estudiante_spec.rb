require 'rails_helper'

RSpec.describe Estudiante, type: :model do
  it 'has factory' do
    expect(create(:estudiante)).to be_persisted
  end
end
