(define add1
  (lambda (n)
    (+ n 1)))

(define sub1
  (lambda (n)
    (- n 1)))

(define plus
  (lambda (n m)
    (cond
     ((zero? m) n)
     (else
      (add1 (plus n (sub1 m)))))))

(define minus
  (lambda (n m)
    (cond
     ((zero? m) n)
     (else
      (sub1 (minus n (sub1 m)))))))

(define tup?
  (lambda (tup)
    (cond
     ((null? tup) #t)
     ((number? (car tup)) (tup? (cdr tup)))
     (else #f))))

(define addtup
  (lambda (tup)
    (cond
     ((null? tup) 0)
     (else
      (plus (car tup)
            (addtup (cdr tup)))))))

(define x
  (lambda (n m)
    (cond
     ((zero? m) 0)
     (else
      (plus n (x n (sub1 m)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond
     ((null? tup1) tup2)
     ((null? tup2) tup1)
     (else
      (cons (+ (car tup1) (car tup2))
            (tup+ (cdr tup1) (cdr tup2)))))))

(define >
  (lambda (n m)
    (cond
     ((zero? n) #f)
     ((zero? m) #t)
     (else
      (> (sub1 n) (sub1 m))))))

(define <
  (lambda (n m)
    (cond
     ((zero? m) #f)
     ((zero? n) #t)
     (else
      (< (sub1 n) (sub1 m))))))

(define =
  (lambda (n m)
    (cond
     ((zero? n) (zero? m))
     (else
      (= (sub1 n) (sub1 m))))))

(define =
  (lambda (n m)
    (cond
     ((< n m) #f)
     ((> n m) #f)
     (else #t))))

(define ^
  (lambda (n m)
    (cond
     ((zero? m) 1)
     ((zero? n) 0)
     (else
      (x n (expt n (sub1 m)))))))

(define division
  (lambda (n m)
    (cond
     ((< n m) 0)
     (else
      (add1 (division (minus n m) m))))))

(define len
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else
      (add1 (len (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
     ((zero? (sub1 n))
      (car lat))
     (else
      (pick (sub1 n)
            (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
     ((zero? (sub1 n))
      (cdr lat))
     (else
      (cons (car lat)
            (rempick (sub1 n)
                     (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
     ((null? lat)
      (quote ()))
     (else
      (cond
       ((number? (car lat))
        (no-nums (cdr lat)))
       (else
        (cons (car lat)
              (no-nums (cdr lat)))))))))

(define all-nums
  (lambda (lat)
    (cond
     ((null? lat)
      (quote ()))
     (else
      (cond
       ((not (number? (car lat)))
        (all-nums (cdr lat)))
       (else
        (cons (car lat)
              (all-nums (cdr lat)))))))))

(define all-nums
  (lambda (lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((number? (car lat))
        (cons (car lat)
              (all-nums (cdr lat))))
       (else (all-nums (cdr lat))))))))

(define eqan?
  (lambda (a1 a2)
    (cond
     ((and (number? a1)
           (number? a2))
      (= a1 a2))
     ((or (number? a1)
          (number? a2)) #f)
     (else
      (eq? a1 a2)))))

(define occur
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     (else
      (cond
       ((eq? (car lat) a)
        (add1 (occur a (cdr lat))))
       (else (occur a (cdr lat))))))))

(define rempick
  (lambda (n lat)
    (cond
     ((one? n) (cdr lat))
     (else
      (cons (car lat) (rempick (sub1 n) (cdr lat)))))))
