#_*_ coding:utf-8 _*_


module BinaryTree
  class Node
    attr_accessor :value, :symbol, :left, :right

    def initialize(value = nil, symbol = nil, left = nil, right = nil)
      raise StandardError.new "must have a value!" if not value
      @value,@symbol,@left,@right = value,symbol,left,right
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
      visit(order){|node| array << yield(node)}
      array
    end

    def leaf?
      (not @left and not @right)
    end
  end

end
