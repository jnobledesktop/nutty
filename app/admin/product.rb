ActiveAdmin.register Product do
  permit_params :title, :description, :specs, :sku, :price, :image, :related_product_id

  filter :title
  filter :sku
  filter :created_at
  filter :updated_at
  filter :price

  index do
    selectable_column
    column :image do |product|
      image_tag product.image.url(:thumb)
    end
    column :title
    column :sku
    column :price
    column :created_at
    column :updated_at
    default_actions
  end

  show do |product|
    attributes_table do
      row :image do
        image_tag product.image.url(:thumb)
      end
      row :title
      row :sku
      row 'Customers who want to buy this product' do
        product.carts.collect(&:email).join(", ")
      end
      row 'Customers who have bought this product' do
        product.orders.collect(&:email).uniq.join(", ")
      end
      row :price
      row :description
      row :specs
    end
    active_admin_comments
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :sku, label: "SKU", hint: "A unique SKU for this product. Very important!"
      f.input :related_product
      f.input :image, as: :file
      f.input :price, as: :string
      f.input :description
      f.input :specs
    end
    f.actions
  end
  
end
