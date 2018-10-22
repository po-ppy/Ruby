Shoes.app title: 'hello',width: 620, height: 500 do
  @values1 = [24, 22, 10, 13, 20, 8, 22]
  @x_axis1 = ['a','b','c','d','e','f', 'g']
  @grf = plot 600, 400, title:"My Graph", caption:  "my caption could be long", 
    font: "Helvetica"
  @grf.add values: @values1, labels: @x_axis1,
       name: "foobar", min: 6, max: 26
end
