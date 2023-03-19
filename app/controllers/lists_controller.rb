class ListsController < ApplicationController

  def index
    run ::List::Operation::Index

    render cell(::List::Cell::Index, result[:model]), layout: true
  end

  def show
    run ::List::Operation::Show

    render cell(::List::Cell::Show, result[:model]), layout: true
  end

  def new
    run ::List::Operation::Create::Present

    render cell(List::Cell::New, model: @model, form: @form, result: result), layout: true
  end

  def edit
    run ::List::Operation::Update::Present

    render cell(List::Cell::Edit, model: @model, form: @form, result: result), layout: true
  end

  def create
    res = ::List::Operation::Create.call(
      params: params, 'contract.default.extract_key': :list
    )

    return redirect_to lists_path if res.success?

    render cell(List::Cell::New, model: res[:model], result: res), layout: true
  end

  def update
    res = run ::List::Operation::Update do |ctx|
      return redirect_to list_path(ctx[:model].id)
    end

    form = res[:'contract.default']
    error = result[:"result.contract.default"].errors[:todo]

    render cell(::List::Cell::Edit, model: @model, form: form, error: error), layout: true
  end

  def destroy
    run ::List::Operation::Delete

    redirect_to lists_path
  end

  private

  def _run_options(options)
    options.merge(
      current_user: 'main'
    )
  end

  def list_params
    params.require(:list).permit(:todo)
  end
end
