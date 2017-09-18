#_*_ coding:utf-8 _*_
require './default_tree'
require './BinaryTree'

include BinaryTree

@new_tree =  Tree.create_by_str(@default_tree,false)
puts "广义表原型"
puts @default_tree
puts "先序遍历结果："
@new_tree.visit(:preorder) do |node|
  print "#{node.value} "
end
puts ""
puts "中序遍历结果："
@new_tree.visit(:inorder) do |node|
  print "#{node.value} "
end
puts ""
puts "后序遍历结果："
@new_tree.visit(:postorder) do |node|
  print "#{node.value} "
end
puts ""

