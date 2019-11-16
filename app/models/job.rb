class Job < ApplicationRecord
  def value
    initial_value
  end

  def last_done_at
    created_at
  end
end
