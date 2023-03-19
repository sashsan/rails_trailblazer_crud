# frozen_string_literal: true

module List::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(List, :find_by)
      step Contract::Build(constant: List::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: :list)
    step Contract::Persist()
  end
end

