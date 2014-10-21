require "models/issue"

class App < Sinatra::Base
  get "/" do
    "Hello"
  end

  get "/issues" do
    @issues = Issue.all
    @issues
  end
end
