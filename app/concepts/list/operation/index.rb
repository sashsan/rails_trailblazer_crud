class List
  module Operation
    class Index < Trailblazer::Operation
      step :model!

      def model!(ctx, *)
        ctx['model'] = ::List.all.reverse_order
      end
    end
  end
end