require 'csv'
class ProductCsv
    def call
        csv_string = CSV.generate do |csv|
            csv << ["id","nombre", "descripcion", "precio", "tipo"]
            Product.all.each do |x|
                csv << [x.id, x.name, x.description, x.price, x.tipo.name]
            end
            csv
        end
        csv_string
    end
end
