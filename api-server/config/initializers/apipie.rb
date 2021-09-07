class MyFormatter < Apipie::RoutesFormatter
  def format_path(route)
    super.gsub(/\(.*?\)/, '').gsub('//','') # hide all implicit parameters
  end
end

Apipie.configure do |config|
  config.app_name                = "ApiServer"
  config.api_base_url            = ""
  config.doc_base_url            = "/apidoc"
  config.default_locale = nil
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      username == "roach" && password == "1234"
    end
  end
  config.validate = false
  config.api_routes = Rails.application.routes
  config.routes_formatter = MyFormatter.new
  config.locale = lambda { |loc| loc ? FastGettext.set_locale(loc) : FastGettext.locale }
  config.reload_controllers=false
end
