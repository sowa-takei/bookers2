class HomesController < ApplicationController
  def top
  end

  def about
    @home = Home
  end

end
