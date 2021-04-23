require 'prawn'
class ProductPdf
    def call
        #pdf = Prawn::Document.new
        #pdf.text "Hellow World!"  
        #pdf
        pdf = Prawn::Document.new( 
            page_size: 'LETTER',
            page_layout: :portrait,
            margin: [25, 25, 25, 25]
        ) do
            
            stroke do
                rectangle [0, 745], 560, 80
                move_down 20
                text 'Almacen Manuel', style: :bold, align: :center, size: 18
                text 'Productos', align: :center, size: 14, style: :bold
                horizontal_line 0, 560, at: 28
                move_down 50

                text_box 'Id', at: [20, cursor], style: :bold
                text_box 'Nombre', at: [70, cursor], style: :bold
                text_box 'Descripcion', at: [200, cursor], style: :bold
                text_box 'Precio', at: [400, cursor], style: :bold
                text_box 'Tipo', at: [480, cursor], style: :bold
                move_down 20
                p "Holiii"

                Product.all.each do |x|
                    text_box x.id.to_s, at: [20, cursor]
                    text_box x.name, at: [70, cursor]
                    text = text_box x.description, at: [200, cursor], width: 180, height: 15, overflow: :truncate
                    text_box x.price.to_s, align: :center, width: 50, at: [400, cursor]
                    text_box x.tipo.name, at: [480, cursor]
                    move_down 15
                    while text.length > 0  do
                        text = text_box text, at: [200, cursor], width: 180, height: 15, overflow: :truncate
                        move_down 15
                    end 
                    move_down 10
                end
               
            end
        end
        pdf
    end
end
