Product.destroy_all

p "Deleted all previous products in database"

Product.create!([{
  name: 'DreamWeaver Standard',
  description: "With patented transparent memory foam technology and proximity sensing creates beautiful white-noise to give you the best sleep you've ever had. Our goto memory foam pillow.",
  price: 129.99,
  image_url: "pillow1.png",
  active: true
},
{
  name: 'DreamWeaver Luxury',
  description: "Same relaxation brilliance as with the DreamWeaver Standard, the Luxury incorporates connectivity through Bluetooth and the ability to stream music or audio books to your pillow for advanced education or 'coercive persuasion'",
  price: 179.99,
  image_url: "pillow2.png",
  active: true
},
{
  name: 'DreamWeaver Elite',
  description: "This exotic, diamond encrusted, beauty adds a full 27 inch OLED panel and 16gb of storage to stream 4K movies right into your eyes while you sleep. Welcome, to heaven.",
  price: 229.99,
  image_url: "pillow3.png",
  active: true
},
{
  name: 'DreamWeaver Custom',
  description: "Customise your own DreamWeaver pillow by uploading an image of your doggo.",
  price: 149.99,
  image_url: "",
  active: true
},
{
  name: 'DreamWeaver Vapor',
  description: "A pillow so good, it doesn't exist yet. Coming Soon (TM)",
  price: 499999.99,
  image_url: "http://cdn77.eatliver.com/wp-content/uploads/2014/05/arms4.jpg",
  active: false
  }])

p "Created #{Product.count} products in the database"

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

p "Created #{OrderStatus.count} order statuses in the database"
