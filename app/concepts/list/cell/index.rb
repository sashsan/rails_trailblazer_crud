# frozen_string_literal: true

class List
  module Cell
    class Index < Trailblazer::Cell
      def total
        model.empty? ? 'No posts' : model.count
      end

      def create_new
        link_to 'Create New Post', new_list_path
      end
    end
  end
end
