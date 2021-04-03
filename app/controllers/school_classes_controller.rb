class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end

    def show
        find_class
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(params.require(:school_class).permit(:title, :room_number))
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def edit
        find_class
    end

    def update
        find_class
        @school_class.update(params.require(:school_class).permit(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    private

    def find_class
        @school_class = SchoolClass.find_by(id: params[:id])
    end
end