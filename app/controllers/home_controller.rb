class HomeController < ApplicationController

  before_filter :login_required
def hello
  respond_to do |format|
    format.html
  end
end

end
