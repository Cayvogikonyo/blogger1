Paperclip::Attachment.default_options[:url] = 'jogooletters.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 'jogooletters.s3.amazonaws.com'
Paperclip.interpolates(:s3_sg_url) do |att, style| 
"#{att.s3_protocol}://s3-eu-west-2.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
end