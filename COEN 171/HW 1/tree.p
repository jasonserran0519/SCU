program tree(input,output);
    type
    treeNodePtr = ^treeNode;
    treeNode = record
        info: integer;
        left: treeNodePtr;
        right: treeNodePtr;
    end;

    function insert(var root: treeNodePtr; value: integer): treeNodePtr;
    begin 
        if root = nil then
        begin
            new(root);
            root^.left := nil;
            root^.right := nil;
            root^.info := value;
        end
        else if value < root^.info then
            insert(root^.left, value) 
        else if value > root^.info then
            insert(root^.right, value);
        insert := root;
    end;

    
    function member(var root : treeNodePtr; value : integer) : boolean;
    begin
        if root = nil then
            member := false
        else if value < root^.info then
            member := member(root^.left, value)
        else if value > root^.info then
            member := member(root^.right, value)
        else
            member := true; 
    end;

var 
    t : treeNodePtr;
    x : integer;

begin
    t := nil;
    readln(x);

    while x <> -1 do
    begin
        t := insert(t,x);
        readln(x);
    end;

    readln(x);

    while x <> -1 do 
    begin
        if member(t, x) then
            writeln('true')
        else
            writeln('false');
        readln(x);
    end;
end. 