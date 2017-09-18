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

end
