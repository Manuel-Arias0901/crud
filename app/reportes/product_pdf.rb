require 'prawn'
class ProductPdf
    def call
        #pdf = Prawn::Document.new
        #pdf.text "Hellow World!"  
        #pdf
        pdf = Prawn::Document.new( 
            page_size: [612, 792],
            page_layout: :portrait,
            margin: [25, 25, 25, 25]
        ) do
            stroke do
                rectangle [100, 300], 100, 200
                text 'Holi (:'
            end
        end
        pdf
    end
end
