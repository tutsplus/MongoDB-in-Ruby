require "models/issue"

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  get "/" do
    redirect "/issues"
  end

  get "/issues" do
    @issues = Issue.all
    haml :"issues/index"
  end

  get "/issues/new" do
    @issue = Issue.new
    haml :"issues/new"
  end

  post "/issues" do
    @issue = Issue.new params[:issue]
    if @issue.save
      redirect "/"
    end
  end

  get "/issues/:id/edit" do
    @issue = Issue.find params[:id]
    haml :"issues/edit"
  end

  put "/issues/:id" do
    @issue = Issue.find params[:id]
    if @issue.update_attributes params[:issue]
      redirect "/"
    end
  end
end
