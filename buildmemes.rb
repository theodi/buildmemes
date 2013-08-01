require 'sinatra/base'


class BuildMemes < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/p' do
    @@pass_images ||= Dir.glob('public/pass/*').map{|x| x.split('/',2)[1]}
    redirect to(@@pass_images.sample), 302
  end

  get '/f' do
    @@fail_images ||= Dir.glob('public/fail/*').map{|x| x.split('/',2)[1]}
    redirect to(@@fail_images.sample), 302
  end
  
end

BuildMemes.run!