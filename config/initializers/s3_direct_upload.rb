S3DirectUpload.config do |c|
  c.access_key_id = Configuration[:aws_access_key]
  c.secret_access_key = Configuration[:aws_secret_key]
  c.bucket = Configuration[:aws_bucket]
  # c.region = ""              # region prefix of your bucket url (optional), eg. "s3-eu-west-1"
  # c.url = ""                 # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
end