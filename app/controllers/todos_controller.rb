class TodosController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    def index
        @todos = Todo.order(priorities: :asc)
    end
    def new
        @todo = Todo.new
    end
    def create
        @todo = Todo.create todo_params
        flash[:notice] = "Todo '#{@todo.title}' created successfully.........."
        redirect_to todos_path,  notice: 'Todo was successfully Created.'
    end
    def edit
    end
    def update
        @todo.update todo_params
        flash[:notice] = "Todo Updated successfully.........."
        redirect_to todo_path, notice: 'Todo was successfully updated.'
    end
    def destroy
        Todo.find(params[:id]).destroy
        flash[:notice] = "Todo created successfully.........."
        redirect_to todos_path, notice: 'Todo was successfully Deleted.'
    end
    private
        def find_user
            @todo = Todo.find(params[:id])
        end

        def todo_params
            params.require(:todo).permit(:title, :description, :due_date, :priorities)
        end
end
