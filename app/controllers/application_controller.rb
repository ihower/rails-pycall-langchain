class ApplicationController < ActionController::Base
  # https://gist.github.com/empanacho/1f5c2d30eda01ac20bb6 fix Can't verify CSRF token authenticity

  protect_from_forgery with: :null_session,
  if: Proc.new { |c| c.request.format =~ %r{application/json} }

end
