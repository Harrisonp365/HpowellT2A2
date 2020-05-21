
brands = Brand.create([
    {name: "Adidas"},
    {name: "Nike"},
    {name: "Reebok"},
    {name: "Skecher"},
    {name: "Crocs"},
    {name: "Timberland"},
    {name: "Gucci"},
    {name: "Celine"},
    {name: "Vans"},
    {name: "DrMartens"},
    {name: "Jordan"},
    {name: "Testoni"},
    {name: "Converse"},
    {name: "Puma"},
    {name: "YEEZY"},
    {name: "New Balance"},
    {name: "ASICS"},
    {name: "Visvim"},
    {name: "Saucony"},
    {name: "Diadora"},
    {name: "Under Armour"},
    {name: "A Bathing Ape"},
    {name: "OFF-WHITE"},
    {name: "Louis Vuitton"},
    {name: "Dior"},
    {name: "Balenciaga"},
    {name: "Burberry"},
    {name: "Alexander McQueen"},
    {name: "Versace"},
    {name: "Prada"},
    {name: "Saint Laurent"},
    {name: "Chanel"},
    {name: "Common Projects"},
    {name: "Fear Of God"},
    {name: "Birkenstock"},
    {name: "Brooks"}
  ])
  
  categories = Category.create([
      {name: "Men"},
      {name: "Women"},
      {name: "Child"},
      {name: "Infant"},
      {name: "Toddler"}
  ])
  
  # Create dummy users
  5.times do
    user = User.create(
        email: Faker::Internet.free_email,
        password: '123456',
    )
  end