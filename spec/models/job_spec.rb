require 'rails_helper'
require 'factory_bot'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }
  let(:value_step) { create(:value_step, duration: 10, change: 100) }

  it 'has a name' do
    expect(job.name).to_not be_nil
  end

  context 'when a job has no value steps' do
    it 'is only worth its initial value' do
      expect(job.value).to eq job.initial_value
    end
  end

  context 'when a job has never been done' do
    it 'was last done when it was created' do
      expect(job.last_done_at).to eq job.created_at
    end
  end
end
