# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
AWS::S3::Base.establish_connection!(
 :access_key_id   => ENV['S3_KEY'],
 :secret_access_key => ENV['S3_SECRET']
)