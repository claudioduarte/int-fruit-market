# Create Vendors

def create_vendors
  countries = ["Albania", "Ghana", "Greece", "Italy", "Haiti", "Honduras", "Lesotho", "Montserrat", "Poland", "Portugal", "South Africa", "Switzerland", "Taiwan", "Tunisia", "Viet Nam", "Yemen"]

  vendors = HTTParty.get('https://api.predic8.de:443/shop/vendors/')
  parsed_response = JSON.parse(vendors.body)['vendors']

  if vendors.code == 200
    parsed_response.each do |vendor|
      Vendor.create(name: vendor['name'], country: countries[rand(0..15)])
    end
  else
    puts "Unable to add Vendors"
  end
end

# Create Fruits

def create_fruits
  fruits = HTTParty.get('https://api.predic8.de:443/shop/products/')
  parsed_response = JSON.parse(fruits.body)['products']

  if fruits.code == 200
    parsed_response.each do |fruit|
      Fruit.create(
        name: fruit['name'],
        description: 'This is a simple description for ' + fruit['name'] + '. This fruit can be purchased from any of our vendors.',
        image_url: 'https://api.predic8.de:443' + fruit['self_link']+ '/image'
      )
    end
  else
    puts "Unable to add Fruits"
  end
end

# Create Vendos with Fruits

def create_vendors_fruits
  VendorsFruit.create([
    {fruit_id: 1, vendor_id: 1, price: 0.49, quantity: 24},
    {fruit_id: 2, vendor_id: 2, price: 0.89, quantity: 65},
    {fruit_id: 3, vendor_id: 2, price: 3.49, quantity: 260},
    {fruit_id: 4, vendor_id: 1, price: 2.99, quantity: 55},
    {fruit_id: 5, vendor_id: 1, price: 1.79, quantity: 60},
    {fruit_id: 6, vendor_id: 2, price: 2.29, quantity: 79}
  ])
end

# Create Admin Users

def create_users
  users = User.create([
    {
      first_name: 'Cláudio',
      last_name: 'Duarte',
      email: 'hello@intfruitmarket.pt',
      password: 'ZyrjjxzPM2d3jFLz',
      password_confirmation: 'ZyrjjxzPM2d3jFLz',
      admin: true,
      vendor_id: 1
    },
    {
      first_name: 'João',
      last_name: 'Fernandes',
      email: 'sales@intfruitmarket.pt',
      password: 'sn2J2tcMF2R1jXIR',
      password_confirmation: 'sn2J2tcMF2R1jXIR',
      admin: true,
      vendor_id: 2
    }
    ])
end

# Execute methods

create_vendors
create_fruits
create_vendors_fruits
create_users
