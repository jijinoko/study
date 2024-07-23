class Component
  attr_accessor :parent
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def puts_estimated_cost
    puts "#{title} (想定工数:#{estimated_cost})"
  end

  def estimated_cost
    raise NotImplementedError
  end

  def add(component)
    raise NotImplementedError
  end
end

class Todo < Component
  def initialize(title, estimated_cost)
    super(title)
    @estimated_cost = estimated_cost
  end

  def estimated_cost
    @estimated_cost
  end
end

class TodoComposite < Component
  def initialize(title)
    super(title)
    @children = []
  end

  def estimated_cost
    @children.map(&:estimated_cost).sum
  end

  def add(component)
    @children << component
    component.parent = self
  end
end

pj = TodoComposite.new('一覧画面追加PJ')

pbi_1 = TodoComposite.new('PBI1-検索機能')
pbi_1_todo_1 = Todo.new('ルーティング', 2)
pbi_1_todo_2 = Todo.new('コントローラアクション', 6)
pbi_1_todo_3 = Todo.new('テスト', 2)
pbi_1.add(pbi_1_todo_1)
pbi_1.add(pbi_1_todo_2)
pbi_1.add(pbi_1_todo_3)
pbi_1.puts_estimated_cost

pbi_2 = TodoComposite.new('PBI2-結果表示')
pbi_2_todo_1 = Todo.new('HTML追加', 5)
pbi_2_todo_2 = Todo.new('CSS追加', 10)
pbi_2.add(pbi_2_todo_1)
pbi_2.add(pbi_2_todo_2)
pbi_2.puts_estimated_cost

pj.add(pbi_1)
pj.add(pbi_2)
pj.puts_estimated_cost
