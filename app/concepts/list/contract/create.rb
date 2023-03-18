require 'reform'
require 'reform/form/dry'
require 'dry-validation'

module List::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :todo

    validation do
      params do
        required(:todo).filled(min_size?: 3)
      end
    end
  end
end

