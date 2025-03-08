Object subclass: #Node
    instanceVariableNames: 'data left right'
    classVariableNames: ''
    poolDisctionaries: ''

!Node class methodsFor: 'Instance'!
data: anObject
    ^(self new) initialize: anObject
    
!!

!Node methodsFor: 'manipulation'!
initialize: anObject                          
    data := anObject
    "left and right initialize as nil"
!

insert: anObject
    anObject < data ifTrue: [
        left isNil ifTrue: [left := Node data: anObject] ifFalse: [left insert: anObject]
    ].
    anObject > data ifTrue: [
        right isNil ifTrue: [right := Node data: anObject] ifFalse: [right insert: anObject]
    ] 
    "Node::insert() doesn't do anything if anObject == data"
!

member: anObject
    anObject < data ifTrue: [
            left isNil ifTrue: [^false] ifFalse: [^left member: anObject]
        ].
    anObject > data ifTrue: [
            right isNil ifTrue: [^false] ifFalse: [^right member: anObject]
        ].
        ^true
!!

Object subclass: #Tree
    instanceVariableNames: 'root'
    classVariableNames: ''
    poolDisctionaries: '' 

!Tree class methodsFor: 'manipulation'!

insert: anObject
    root isNil ifTrue: [
        root := Node data: anObject] ifFalse: [root insert: anObject]
!

member: anObject
    root isNil ifTrue: [^false] ifFalse: [^root member: anObject]
!!