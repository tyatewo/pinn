class HomesController < ApplicationController
  def top
    redirect_to new_customer_session_path
  end
end
