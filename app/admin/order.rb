ActiveAdmin.register Order do

csv do
  column :id
  column :email
  column :total
  column("Products") { |o| o.products.collect(&:title).join(", ") } 
  column("Order Date") { |o| o.created_at.strftime("%-m/%-d/%Y %-I:%M%p") }
end
  
end
