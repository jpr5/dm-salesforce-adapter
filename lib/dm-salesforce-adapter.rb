require 'data_objects'
require 'dm-core'
require 'dm-types'
require 'dm-validations'

require 'soap/wsdlDriver'
require 'soap/header/simplehandler'
require 'rexml/element'

class SalesforceAdapter < ::DataMapper::Adapters::AbstractAdapter
  Inflector = ::DataMapper::Inflector
end

require 'dm-salesforce-adapter/resource'
require 'dm-salesforce-adapter/connection'
require 'dm-salesforce-adapter/connection/errors'
require 'dm-salesforce-adapter/soap_wrapper'
require 'dm-salesforce-adapter/sql'
require 'dm-salesforce-adapter/version'
require 'dm-salesforce-adapter/adapter'
require 'dm-salesforce-adapter/property'

# For convenience (WRT the examples)
module DataMapper::Salesforce
    Resource = SalesforceAdapter::Resource
end

::DataMapper::Adapters::SalesforceAdapter = SalesforceAdapter
::DataMapper::Adapters.const_added(:SalesforceAdapter)
