#_*_ coding:utf-8 _*_
require './default_tree'
require './BinaryTree'

include BinaryTree

@new_tree = BinaryTree::Node.new('^')
#@new_tree =  BinaryTree::Tree.create_by_str(@default_tree,false)
#puts "广义表原型"
#puts @default_tree
#puts "先序遍历结果："
#@new_tree.visit(:preorder) do |node|
#  print "#{node.value} "
#end
#puts ""
#puts "中序遍历结果："
#@new_tree.visit(:inorder) do |node|
#  print "#{node.value} "
#end
#puts ""
#puts "后序遍历结果："
#@new_tree.visit(:postorder) do |node|
#  print "#{node.value} "
#end
#puts ""

#@huffman_str = "aaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccccddddddddeeeeeeeeeeeeeefffffffffffffffffffffffggghhhhhhhhhhh"
#
#@hash_huff = Hash.new(0)
#
#@huffman_str.each_char do |ch|
#  @hash_huff[ch] += 1
#end
#
#tempAry = []
#
#@hash_huff.each do |key,value|
#  tempAry << BinaryTree::Node.new(value,key)
#end
#
#while tempAry.size > 1
#  tempAry.sort! do |a,b|
#    a.value <=> b.value
#  end
#  left = tempAry[0]
#  right = tempAry[1]
#  tempTree = BinaryTree::Node.new(left.value + right.value)
#  tempTree.left = left
#  tempTree.right = right
#  left.parent = tempTree
#  right.parent = tempTree
#
#  tempAry.delete(left)
#  tempAry.delete(right)
#
#  tempAry << tempTree
#end
#
#tree = tempAry[0]


@huffman_str = "aaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccccddddddddeeeeeeeeeeeeeefffffffffffffffffffffffggghhhhhhhhhhh"

@str_to_decode = "0001000100010001000110101010101010101010101010101010101010101010101010101010101110111011101110111011101110111111111111111111111111111111111101101101101101101101101101101101101101100101010101010101010101010101010101010101010101000000000000001001001001001001001001001001001"
huffmanTree = BinaryTree::Huffman.create_by_str(@huffman_str)

puts huffmanTree.encode_str(@huffman_str)

puts huffmanTree.decode_str(@str_to_decode)

#result =  huffmantree.encode_hash
#@huffman_str.each_char do |ch|
#  print result[ch]
#end
#
#decode_hash = hash.new("")
#result.each do |key,value|
#  decode_hash[value] = key
#end
#tempstr = ""
#@str_to_decode.each_char do |ch|
#  tempstr += ch
#  if decode_hash.has_key? tempstr
#    print decode_hash[tempstr]
#    tempstr = ""
#  end
#end
#puts ""
#puts result
#huffmantree.visit(:preorder) do |node|
#  if node.symbol
#    print "#{node.symbol}:"
#    tempstr = ""
#    temp = node
#    while temp.parent
#      if temp.parent.right == temp
#        tempstr += "1"
#      else
#        tempstr += "0"
#      end
#      temp = temp.parent
#    end
#    puts tempstr.reverse!
#  end
#end

#tempary.each do |i|
#  puts i.value
#end

#while temp.size > 1
#  temptree = binarytree::node.new('^')
#  temptree.left = binarytree::node.new(temp[0][0],temp[0][1],nil,nil,temptree)
#  temptree.right = binarytree::node.new(temp[1][0],temp[1][1],nil,nil,temptree)
#end

#@t = binarytree::node.new('^')
#@p = binarytree::node.new('^')
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

