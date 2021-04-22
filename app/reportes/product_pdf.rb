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

                Product.all.each do |x|
                    text_box x.id.to_s, at: [20, cursor]
                    text_box x.name, at: [70, cursor]
                    text_box x.description, at: [200, cursor]
                    text_box x.price.to_s, at: [400, cursor]
                    text_box x.tipo.name, at: [480, cursor]
                    move_down 15
                end
                   
                #define_grid(columns: 5, rows: 8, gutter: 11)
                #grid([1, 0], [7, 0]).bounding_box do
                #    text 'id', align: :center, size: 14, style: :bold
                #    Product.all.each do |i|
                #        text i.id.to_s, align: :center
                #    end
                #end
                #grid([1, 2], [7, 0]).bounding_box do
                #    text 'Nombre', align: :center, size: 14, style: :bold
                #    Product.all.each do |n|
                #        text n.name, align: :center
                #    end
                #end
                #grid([1, 3], [7, 2]).bounding_box do
                #    text 'Descripcion', align: :center, size: 14, style: :bold
                #    Product.all.each do |d|
                #        text d.description, align: :center
                #    end
                #end
                #grid([1, 4], [7, 3]).bounding_box do
                #    text 'Precio', align: :center, size: 14, style: :bold
                #    Product.all.each do |p|
                #        text p.price.to_s, align: :center
                #    end
                #end
                #grid([1, 5], [7, 3]).bounding_box do
                #    text 'Tipo', align: :center, size: 14, style: :bold
                #    Product.all.each do |t|
                #        text t.tipo.name, align: :center
                #    end
                #end  
            end
        end
        pdf
    end
end
