class WelcomeController < ApplicationController
  def index
    @chores = [
      {
        name: 'Empty Dishwasher',
        prize: 'HB 547',
        status: 'Not Ready'
      },
      {
        name: 'Load Dishwasher',
        prize: 'HB 635',
        status: 'Taken'
      },
      {
        name: 'Wash Car',
        prize: 'HB 475',
        status: 'Ready'
      }
    ]
  end
end
