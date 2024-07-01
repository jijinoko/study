# オブジェクトを作成するためのインタフェース
class Creator

  # どのクラスをインスタンス化するかについてはサブクラスに委ねる
  def factory_method
    raise NotImplementedError
  end

  # オブジェクト作成をサブクラス内にカプセル化することで、スーパークラスのクライアントコードをサブクラスのオブジェクト作成コードから分離できる
  # Creatorはどの具象Productクラスとも疎結合なので、追加変更が発生してもCreatorに影響が出ない
  def some_operation
    factory_method.operation
  end
end

class ConcreteCreatorA < Creator
  def factory_method
    ConcreteProductA.new
  end
end

class ConcreteCreatorB < Creator
  def factory_method
    ConcreteProductB.new
  end
end

class Product
  def operation
    raise NotImplementedError
  end
end

class ConcreteProductA < Product
  def operation
    puts "Result of the ConcreteProductA"
  end
end

class ConcreteProductB < Product
  def operation
    puts "Result of the ConcreteProductB"
  end
end

creator = ConcreteCreatorA.new
creator.some_operation

creator = ConcreteCreatorB.new
creator.some_operation

# 実際に利用しているコードでは、具象Creatorをいきなり呼び出すのではなく、
# ファクトリメソッドに引数を渡してその値によって生成されるオブジェクトが変わるようにcase文を使用しているのを見かける
