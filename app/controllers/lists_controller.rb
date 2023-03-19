class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists
  def index
    run ::List::Operation::Index

    render cell(::List::Cell::Index, result[:model]), layout: true
  end

  # GET /lists/1
  def show
    run ::List::Operation::Show

    render cell(::List::Cell::Show, result[:model]), layout: true
  end

  # GET /lists/new
  def new
    run ::List::Operation::Create::Present

    render cell(List::Cell::New, model: @model, form: @form, result: result), layout: true
  end

  # GET /lists/1/edit
  def edit
    run ::List::Operation::Update::Present

    render cell(List::Cell::Edit, model: @model, form: @form, result: result), layout: true
  end

  # POST /lists
  def create
    res = ::List::Operation::Create.call(
      params: params, 'contract.default.extract_key': :list
    )

    return redirect_to lists_path if res.success?

    render cell(List::Cell::New, model: res[:model], result: res), layout: true
  end

  # PATCH/PUT /lists/1
  def update
    res = run ::List::Operation::Update do |ctx|
      return redirect_to list_path(ctx[:model].id)
    end

    form = res[:'contract.default']
    error = result[:"result.contract.default"].errors[:todo]

    render cell(::List::Cell::Edit, model: @model, form: form, error: error), layout: true
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private

  def _run_options(options)
    options.merge(
      current_user: 'main'
    )
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:todo)
  end
end
