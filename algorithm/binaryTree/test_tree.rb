#_*_ coding:utf-8 _*_
require './default_tree'
require './BinaryTree'

include BinaryTree

@new_tree = BinaryTree::Node.new('^')
@new_tree =  BinaryTree::Tree.create_by_str(@default_tree,false)
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

#@t = BinaryTree::Node.new('^')
#@p = BinaryTree::Node.new('^')
#@k = 0
#
#tempAry = []
#@default_tree.each_char do |ch|
#  case ch
#    when '('
#      tempAry.push(@p)
#      @k = 1
#
#    when ')'
#      @t = tempAry.pop
#
#    when ','
#      @k = 2
#
#    else
#      @p = BinaryTree::Node.new(ch)
#      if @new_tree.value == '^'
#        @new_tree = @p
#      elsif @k == 1
#        @t = tempAry.pop
#        @t.left = @p
#        tempAry.push(@t)
#      else
#        @t = tempAry.pop
#        @t.right = @p
#        tempAry.push(@t)
#      end
#    end
#end
