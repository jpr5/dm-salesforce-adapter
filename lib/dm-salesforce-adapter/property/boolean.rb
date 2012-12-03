module SalesforceAdapter::Property
  class Boolean < ::DataMapper::Property::Integer
    FALSE = 0
    TRUE  = 1

    def load(value)
      [true, 1, '1', 'true', 'TRUE'].include?(value) ? true : false
    end

    def typecast(value)
      [true, 1, '1', 'true', 'TRUE'].include?(value) ? TRUE : FALSE
    end

    def custom?
      true
    end
  end
end
