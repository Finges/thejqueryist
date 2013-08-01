class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      format.html do
        if @todo.save
          flash[:notice] = "Todo has been created"
          redirect_to @todo
        else
          flash[:alert] = "Todo has not been created"
          render :action => "new"
        end
      end
      format.js do
        unless @todo.save
          render text: @todo.errors.full_message.join,
            status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      format.html do
        if @todo.update(todo_params)
          flash[:notice] = "Todo has been updated"
          redirect_to @todo
        else
          flash[:alert] = "Todo has not been update"
          render :action => "edit"
        end
      end
      format.js do
        unless @todo.update(todo_params)
          render text: @todo.errors.full_message.join,
            status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:description, :done, :due)
    end
end
