# frozen_string_literal: true

class List
  module Cell
    class Show < Trailblazer::Cell
      property :todo
      property :created_at

      def edit
        link_to 'Edit', edit_list_path(model.id)
      end

      def delete
        link_to 'Delete', list_path(model.id), method: :delete, data: { confirm: 'Are you sure?' }
      end

      def back
        link_to 'Back to posts list', lists_path
      end
    end
  end
end
