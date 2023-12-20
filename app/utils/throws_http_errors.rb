# frozen_string_literal: true

##
# This module is used to throw http errors from the controllers.
##
module ThrowsHttpErrors
  ##
  # This method throws a 404 error.
  def record_not_found
    render plain: '404 Not Found', status: 404
  end

  ##
  # This method throws a 500 error.
  def server_error
    render plain: '500 Internal Server Error', status: 500
  end
end
