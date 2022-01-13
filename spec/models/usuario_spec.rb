RSpec.describe Usuario, type: :model do
  it 'has factory' do
    expect(create(:usuario)).to be_persisted
  end
end
