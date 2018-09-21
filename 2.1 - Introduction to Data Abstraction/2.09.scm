#lang sicp

; Exercise 2.09:
; ==============
; The width of an interval is half of the difference between its upper and lower
; bounds. The width is a measure of the uncertainty of the number specified by
; the interval. For some arithmetic operations the width of the result of
; combining two intervals is a function only of the widths of the argument
; intervals, whereas for others the width of the combination is not a function
; of the widths of the argument intervals.
;
; Show that the width of the sum (or difference) of two intervals is a function
; only of the widths of the intervals being added (or subtracted). Give examples
; to show that this is not true for multiplication or division.



; If we have an interval x: [x_a; x_b] then ist width is (x_b - x_a) / 2 and
; y: [y_a; y_b] with a width of (y_b - y_a) / 2, we can also easily calculate
; the sum z = x + y = [x_a + y_a; x_b + y_b]. Its width will be:
;
; width(z) = (z_b - z_a) / 2 =
; ((x_a + y_a) - (x_b + y_b)) / 2 =
; (x_a + y_a - x_b - y_b) / 2 =
; (x_a - x_b)/2 + (y_a - y_b)/2 =
; width(x) + width(y)
;
; As we can see, the width of the sum of two intervals is the sum of the
; individual widths of both intervals, thus is a function of only these widths.
;
; The same is true for subtraction. Let's consider an interval w = x - y:
;
; width(w) = (w_b - w_a) / 2 =
; ((x_b - y_a) - (x_a - y_b)) / 2 =
; (x_b - y_a - x_a + y_b) / 2 =
; (x_b - x_a)/2 + (y_b - y_a)/2 =
; width(x) + width(y)
; 
; To answer the second part of the question, we want to find examples of
; intervals, which show, that the width of the product is not a function of only
; the widths. We can do this by finding intervals of the same width, whose
; products have different widths. This shows, that we cannot determine the width
; of a product just by knowing the widths of the operands. Such intervals are
; for example:
;
; x = [0; 1], y = [2; 3], z = [4; 5]
;
; If we multiply x * y, then we get the interval [0; 3] with width 3/2. However,
; by multiplying x * z, we get the interval [0; 5], which has width 5/2. This
; shows, that by multiplying intervals with the same width, the product can have
; different widths depending not only on the width, but also the exact bounds
; of the intervals.