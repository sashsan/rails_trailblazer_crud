# frozen_string_literal: true

module List::Operation
  class Delete < Trailblazer::Operation
    step Model(List, :find_by)
    step :delete!
    step :success?

    def delete!(ctx, model:, **)
      model.destroy
    end

    def success?(ctx, res)
      return true unless res[:model].persisted?

      false
    end
  end
end