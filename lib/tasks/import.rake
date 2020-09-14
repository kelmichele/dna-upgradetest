namespace :import_dna do
  desc 'Import location data from CSV to database'
  task :import_loc => :environment do
    s3 = Aws::S3::Resource.new(
      region: 'us-east-1',
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    )
    obj = s3.bucket(ENV['storagelocation']).object('prod_towns.csv').get
    CSV.parse(obj.body, :headers => true) do |row|
      Application.create(row.to_hash.slice(*%w[townname state_id]))
    end
  end
end
