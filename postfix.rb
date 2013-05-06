OPERATORS = ["+", "-", "*", "/"]
NUM_OPERANDS = 2
post_expression = ARGV[0]
calcul_stack = []
tree_stack = []
Node = Struct.new(:value, :left, :right)

def abort_with_expression_error
  abort "Expression Error!"
end

def calculate(left, right, op)
  begin
    eval("#{left} #{op} #{right}")
  rescue
    p "When do the calculate"
    abort_with_expression_error
  end
end

def pre_traverse(node)
  return [] unless node
  [node.value]
    .concat(pre_traverse(node.left))
    .concat(pre_traverse(node.right))
end

def in_traverse(node)
  return [] unless node
  (in_traverse(node.left) << node.value).concat(in_traverse(node.right))
end

post_expression.split.each do |op|
  if OPERATORS.include?(op)
    abort_with_expression_error if calcul_stack.length < NUM_OPERANDS
    sub_result = calculate(*calcul_stack.pop(2), op)
    calcul_stack << sub_result

    # Build tree
    tree_stack << Node.new(op, *tree_stack.pop(2))
  else
    tree_stack << Node.new(op)
    calcul_stack << op
  end
end

abort_with_expression_error unless calcul_stack.length == 1 and calcul_stack[0].is_a?(Integer)

calculate_result = calcul_stack.pop
pre_array = pre_traverse(tree_stack[-1])
in_array = in_traverse(tree_stack[-1])
puts "Post-fix: #{post_expression}"
puts "Pre-fix : #{pre_array * ' '}"
puts "In-fix  : #{in_array * ' '}"
puts "Calculate result: #{calculate_result}"
