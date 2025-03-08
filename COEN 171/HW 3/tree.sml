datatype 'a tree = empty | node of 'a tree * 'a * 'a tree;

fun insert empty x = node(empty,x,empty)
  | insert (node(left,y,right)) x =
    if x < y then 
        node(insert left x, y, right) 
    else if x > y then 
        node(left, y, insert right x)
    else
      node(left, y, right);

fun member empty x = false
  | member (node(left,y,right)) x =
    if x = y then
        true
    else if x < y then
        member left x
    else
        member right x;

fun preorder empty = nil
  | preorder (node(left,d,right)) =
      d :: preorder left @ preorder right;

fun inorder empty = nil
  | inorder (node(left,d,right)) =
      inorder left @ d :: inorder right;

val build = foldl (fn (v,t) => insert t v) empty;