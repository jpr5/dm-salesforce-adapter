require 'bundler'
Bundler.require(:default, :test)

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$:.unshift root

require 'logger'
Dir.mkdir(root + "/tmp") unless File.exist?(root + "/tmp")
::DataMapper.logger = Logger.new(root + "/tmp/test.log")

require 'spec/fixtures/account'
require 'spec/fixtures/contact'

# Default config - needs to be overridden
sfconfig = {
    'adapter'  => 'salesforce',
    'username' => 'api-user@example.org',
    'password' => 'passwordAPIKEY',
    'path'     => root + "/config/salesforce.wsdl", # /path/to/your/salesforce.wsdl
    'apidir'   => ENV['SALESFORCE_DIR'] || root + "/tmp/soap", # /path/to/cache/classfiles
    'host'     => '',
}

# Override with database.yml, if present.
DB_YML = File.join(root, 'config', 'database.yml')
if File.readable? DB_YML
    dbconfig = YAML.load_file(DB_YML)
    raise unless dbconfig.kind_of? Hash
    sfconfig = dbconfig['development']['repositories']['salesforce']
end

require 'fileutils'
api_dir = sfconfig["apidir"]
wsdl    = sfconfig["path"]

raise "WSDL not found: #{wsdl}" unless File.exist?(wsdl)

FileUtils.rm_rf(api_dir)
FileUtils.mkdir_p(api_dir)

raise "require valid configuration" unless
    File.directory? api_dir and File.readable? wsdl

DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:salesforce, sfconfig)
