; vi:ai:lisp:sm

(define (make-node left x right) (list x left right))
(define (make-leaf x) (make-node '() x '()))

(define (insert tree x) ; tree acts like a list
    (if (null? tree) (make-leaf x)
        (let 
            ((left (cadr tree))
             (y (car tree))
             (right (caddr tree)))
            (cond
                ((< x y) (make-node (insert left x) y right))
                ((> x y) (make-node left y (insert right x)))
		        (else tree)))))

(define (a-member tree x)
    (if (null? tree) #f
        (let 
            ((left (cadr tree))
             (y (car tree))
             (right (caddr tree)))
            (cond
                ((= x y) #t)
                ((< x y) (a-member left x))
                (else (a-member right x))))))

; inorder function
(define (inorder tree)
    (if (null? tree) tree
    (let
        ((d (car tree))
        (left (cadr tree))
        (right (caddr tree)))
        (append (inorder left) (cons d (inorder right))))))

;preorder function    
(define (preorder tree)
    (if (null? tree) tree
        (let
            ((d (car tree))
            (left (cadr tree))
            (right (caddr tree)))
            (append (cons d (preorder left)) (preorder right)))))

