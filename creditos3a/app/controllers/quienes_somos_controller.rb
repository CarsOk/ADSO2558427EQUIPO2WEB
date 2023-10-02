class QuienesSomosController < ApplicationController
    layout 'quienes_somos_layout', only: [:index]
    def index
        render 'quienes_somos'
    end
end
