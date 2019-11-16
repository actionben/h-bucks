class Job < ApplicationRecord
  has_many :value_steps, -> { order "duration ASC" }

  def value
    initial_value * current_value_multiplier
  end

  def last_done_at
    created_at
  end

  private

  def current_value_multiplier
    if current_value_step
      current_value_step.change / 100
    else
      1
    end
  end

  def current_value_step
    value_steps.where("duration <= ?", time_since_last_done).last
  end

  def time_since_last_done
    Time.zone.now - created_at
  end
end
