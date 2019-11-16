require 'rails_helper'
require 'factory_bot'

RSpec.describe Job, type: :model do
  let(:job) { create(:job, initial_value: 100) }

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

  context 'when a job has two value steps' do
    let(:first_value_step) { create(:value_step, duration: 10, change: 200, job: job) }
    let(:second_value_step) { create(:value_step, duration: 20, change: 300, job: job) }

    context 'when a job has yet to reach a value step' do
      before do
        travel_to job.created_at + first_value_step.duration - 1
      end

      it 'is still only worth its initial value' do
        expect(job.value).to eq 100
      end
    end

    context 'when a job has reached its first value step' do
      before do
        travel_to job.created_at + first_value_step.duration + 1
      end

      it 'is worth its initial value changed by the step' do
        expect(job.value).to eq 200
      end
    end

    context 'when a job has reached its second value step' do
      before do
        travel_to job.created_at + second_value_step.duration + 1
      end

      it 'is worth its initial value changed by the second step' do
        expect(job.value).to eq 300
      end
    end
  end
end
