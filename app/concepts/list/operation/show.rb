class List
  module Operation
    class Show < Trailblazer::Operation
      step Model(List, :find_by)
      step :notify!

      def notify!(ctx, model:, **)
        ctx['result.notify'] = Rails.logger.info("Show List #{model.todo}.")
      end
    end
  end
end