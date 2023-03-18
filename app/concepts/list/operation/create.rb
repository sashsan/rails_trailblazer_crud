# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren
module List::Operation
  class Create < Trailblazer::Operation
    # just for new endpoint and show form
    class Present < Trailblazer::Operation
      step Model(List, :new)
      step Contract::Build(constant: List::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate()
    step Contract::Persist()
    step :notify!

    def notify!(ctx, model:, **)
      ctx['result.notify'] = Rails.logger.info("New todo list #{model.todo}.")
    end
  end
end
# rubocop:enable Style/ClassAndModuleChildren
