require 'rails_helper'
require 'factory_bot'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }

  it 'has a name' do
    expect(job.name).to_not be_nil
  end
end
