#_*_ coding:utf-8 _*_

require 'matrix'

@map = Matrix[[0,1,1,1,2,2,2],[2,0,2,2,1,2,2],[2,2,0,2,2,2,2],[2,1,1,0,1,2,2],[2,2,2,2,0,2,2],[2,2,2,2,2,2,0,1],[2,2,2,2,2,2,0]]
@visitedAry = [0,0,0,0,0,0,0]

def visited?(i)
  if(i < 0 || i > @visitedAry.size)
    return false
  else
    return @visitedAry[i] == 1 ? true : false
  end
end

def visit(i)
  if(i < 0 || i > @visitedAry.size)
    return false
  else
    @visitedAry[i] = 1
    return true
  end

end


def bfs_cur(current,queue)
  visit(current)
  w = -1
  queue << current
  while(queue.size > 0)
    outOne = queue.shift
    (0...n).each do |i|
      if(@map[outOne,i] != 0)
        w = i
      end
      if(!visited[w] && w != -1)
        visit(w)
        queue << w
      end

    end
  end

end

def bfs()
  (0...@visitedAry.size).each do |i|
    if(!visited?(i))
      bfs_cur(i)
    end
  end
end
