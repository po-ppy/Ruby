#_*_ coding:utf-8 _*_

require 'shoes'
Shoes.app title: "first" do
  background "#F3F".."#F90"

  title("shoooes",
        top: 60,
        align: "center",
        font: "Trebuchet MS",
        stroke: white)

  stack do
    para "first"
    para "second"
    para "third"
  end

  button("Click Me") do
    alert "GOOD JOB"
  end
  flow do
    stack width: 200 do
      caption "Column one"
      para "is 200 pixels wide"
    end
    stack width: -200 do
      caption "Column two"
      para "is 100% minus 200 pixels wide"
    end
  end
end