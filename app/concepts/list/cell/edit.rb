# frozen_string_literal: true

module List::Cell
  class Edit < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
    include SimpleForm::ActionViewExtensions::FormHelper

    def current_list
      model[:model].todo
    end

    def current_class
      return model[:result][:model].class unless model[:result].nil?

      self.class
    end

    def modal
      model[:model]
    end

    def back
      link_to 'Back', list_path(model.id)
    end

    def delete
      link_to 'Delete Post', list_path(model.id), method: :delete
    end
  end
end
