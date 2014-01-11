env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmarks_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!