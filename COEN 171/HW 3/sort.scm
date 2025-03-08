; vi:ai:lisp:sm

(define (filter f lst)
    (cond 
        ((null? lst) lst)
        ((f (car lst)) (cons (car lst ) (filter f (cdr lst))))
        (else (filter f(cdr lst)))))

(define (quicksort lst)
    (if (null? lst) lst
        (let*
            ((x (car lst))        ;let* needed because of using higher order functions like filter    
            (xs (cdr lst))
            (above (lambda (y) (>= y x)))
            (below (lambda (y) (< y x))))
            (append (quicksort (filter below xs)) (cons x(quicksort (filter above xs)))))))
            
    
(display (quicksort '(8 6 7 5 3 0 9)))
(newline)

