gem 'aws'
gem 'subexec'
gem 'mini_magick'
#require 'iron_worker_ng'

client = IronWorkerNG::Client.new()
client.tasks.create(
    'ImageProcessor',
    image_url:  "http://dev.iron.io/images/iron_pony.png",
    aws_access: "",
    aws_secret: "",
    aws_s3_bucket_name: "webmarks",
)

def upload_file(filename = "output.png")
  filepath = filename
  puts "\nUploading the file to s3..."
  s3 = Aws::S3Interface.new(@params['aws_access'], @params['aws_secret'])

  #aws_access         = ""
  #aws_secret         = ""
  #aws_s3_bucket_name = "webmarks"
  #s3 = Aws::S3Interface.new(aws_access, aws_secret)
  #s3.create_bucket(aws_s3_bucket_name)
  s3.create_bucket(@params['aws_s3_bucket_name'])
  response = s3.put(@params['aws_s3_bucket_name'], filename, File.open(filepath))
  if response
    puts "Uploading succesful"
    link = s3.get_link(@params['aws_s3_bucket_name'], filename)
    puts "\nYou can view the file here on s3:\n" + link
  else
    puts "Error placing the file in s3."
  end
  puts "-"*60
end

puts "hello!"

upload_file
