#_*_ coding:utf-8 _*_


module BinaryTree
  class Node
    attr_accessor :value, :symbol, :left, :right,:self,:parent

    def initialize(value = nil, symbol = nil, left = nil, right = nil, parent = nil)
      raise StandardError.new "must have a value!" if not value
      @value,@symbol,@left,@right,@parent = value,symbol,left,right,parent
    end

    def visit(order = :preorder, &block)
      raise StandardError.new "unexpected order,must select in :preorder,:inorder,:postorder " if not [:preorder,:inorder,:postorder].include?(order)
      case order
        when :preorder
          yield self
          @left.visit(order,&block) if left
          @right.visit(order,&block) if right

        when :inorder
          @left.visit(order,&block) if left
          yield self
          @right.visit(order,&block) if right

        when :postorder
          @left.visit(order,&block) if left
          @right.visit(order,&block) if right
          yield self
      end
    end

    def visit_and_map(order = :preorder,&block)
      ary = []
      visit(order){|node| ary << yield(node)}
      ary
    end

    def leaf?
      (not @left and not @right)
    end

    def left?
       (@parent and @parent.left == self)
    end

    def right?
       (@parent and @parent.rifht == self)
    end
       

  end   #the end of Node

  class  Tree

    def self.create_by_str(str,hasParent = false)
      result = Node.new('^')
      p = Node.new('^')
      t = Node.new('^')
      k = 0
      tempAry = []
      str.each_char do |ch|
        case ch
          when '('
            tempAry.push(p)
            k = 1
      
          when ')'
            t = tempAry.pop
      
          when ','
            k = 2
      
          else
            p = Node.new(ch)
            if result.value == '^'
              p.symbol = "root"
              result = p
            elsif k == 1
              t = tempAry.pop
              t.left = p
              if hasParent
                p.parent = t
              end
              tempAry.push(t)
            else
              t = tempAry.pop
              t.right = p
              if hasParent
                p.parent = t
              end
              tempAry.push(t)
            end
        end
      end
     return result
    end
  end  #the end of Tree

  class Huffman
    attr_accessor :huff
    def initialize(tree = nil)
      @huff = tree
    end
    def self.create_by_str(str)
      #@huffman_str = "aaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccccddddddddeeeeeeeeeeeeeefffffffffffffffffffffffggghhhhhhhhhhh"
      hash_huff = Hash.new(0)
      
      str.each_char do |ch|
        hash_huff[ch] += 1
      end
      
      create_by_hash(hash_huff)
    end
    def self.create_by_hash(hash_huff)
      tempAry = []
      
      hash_huff.each do |key,value|
        tempAry << BinaryTree::Node.new(value,key)
      end

      create_by_node_ary(tempAry)

    end

    def self.create_by_node_ary(tempAry)
      while tempAry.size > 1
        tempAry.sort! do |a,b|
          a.value <=> b.value
        end
        left = tempAry[0]
        right = tempAry[1]
        tempTree = BinaryTree::Node.new(left.value + right.value)
        tempTree.left = left
        tempTree.right = right
        left.parent = tempTree
        right.parent = tempTree
      
        tempAry.delete(left)
        tempAry.delete(right)
      
        tempAry << tempTree
      end
      @huff = tempAry[0]
      return self
    end

    def self.encode_hash(order = :preorder)
      raise StandardError.new "unexpected order,must select in :preorder,:inorder,:postorder " if not [:preorder,:inorder,:postorder].include?(order)
      result = Hash.new("") 
      @huff.visit(order) do |node|
        if node.symbol
          tempstr = ""
          temp = node
          while temp.parent
            if temp.parent.right == temp
              tempstr += "1"
            else
              tempstr += "0"
            end
            temp = temp.parent
          end
            result[node.symbol] =  tempstr.reverse!
        end
      end
      return result
    end

    def self.decode_str(str)
      result = ""
      
      decode_hash = Hash.new("")
      encode_hash.each do |key,value|
        decode_hash[value] = key
      end
      tempstr = ""
      str.each_char do |ch|
        tempstr += ch
        if decode_hash.has_key? tempstr
          result += decode_hash[tempstr]
          tempstr = ""
        end
      end
      return result

    end

    def self.encode_str(str)
      the_hash = encode_hash
      result = ""
      str.each_char do |ch|
        result += the_hash[ch]
      end
      return result
    end

  end

end
