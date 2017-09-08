require_relative '../../app/models/url.rb'

get '/' do
  erb :"static/index"
end

post '/url_changer' do
    params[:long_url]
    if Url.exists?(long_url: params[:long_url])
    @p = Url.find_by(long_url: params[:long_url])
    else
    @p = Url.new
    @p.long_url = params[:long_url]
    @p.short_url = @p.shorten
    @p.save
    end
    # return p.short_url
    erb :"static/index"
end

get '/:short_url' do
    params[:short_url]
    @p=Url.find_by(short_url: params[:short_url])
    @p.increment_click_count
    @p.save
    redirect to "http://#{@p.long_url}"
end
