(defpackage :cl-num-utils
  (:nicknames :clnu)
  (:use #:cl #:iterate #:let-plus #:anaphora #:alexandria)
  (:shadow #:mean #:median #:variance   ; also in ALEXANDRIA
           #:displace-array             ; no longer in ALEXANDRIA TODO remove in 2012 June
           #:sum                        ; also in ITERATE
           )
  (:export
   ;; macros
   #:check-types
   #:define-with-multiple-bindings
   #:make-keyword+
   #:gensym+
   #:lazy-let*
   #:unlessf
   #:setf-nil
   #:expanding
   #:with-doubles
   ;; conditions
   #:reached-maximum-iterations
   ;; misc
   #:nonnegative?
   #:nonpositive?
   #:divides?
   #:square
   #:nif
   #:anif
   #:bic
   #:multf
   #:as-integer
   #:common-supertype
   #:round*
   #:maybe-copy-array
   #:convex-combination
   #:vector-last
   #:common
   #:common-length
   #:common-dimension
   #:*==-tolerance*
   #:==
   #:==*
   #:format-number
   #:ignore-error
   #:ignore-nil
   #:text-progress-bar
   #:within?
   #:fixnum?
   #:simple-fixnum-vector
   #:define-indirect-accessors
   #:keys-and-values
   #:thin
   #:thin-to
   #:log10
   #:log2
   #:1c
   ;; arithmetic
   #:numseq
   #:ivec
   #:sum
   #:product
   #:sum-of-squares
   #:cumulative-sum
   #:cumulative-product
   #:same-sign?
   #:absolute-square
   ;; array
   #:first*
   #:second*
   #:third*
   #:fourth*
   #:fifth*
   #:sixth*
   #:seventh*
   #:eighth*
   #:ninth*
   #:tenth*
   #:nrow
   #:ncol
   #:elements
   #:square?
   #:seqs-to-matrix
   #:seqs-to-matrix*
   #:matrix
   #:matrix*
   #:vector*
   #:row-major-loop
   #:array-element-type-available
   #:displace-array
   #:make-similar-array
   #:uniform-array
   #:generate-array
   #:rep
   #:reshape
   #:flatten-array
   #:subarrays
   #:subarray
   #:partition
   #:subvector
   #:combine
   #:matrix-to-columns
   #:columns-to-matrix
   #:map1
   #:as-array
   #:diagonal
   #:transpose
   #:transpose*
   #:valid-permutation?
   #:permute
   #:as-row
   #:as-column
   #:outer*
   #:norm1
   #:norm2
   #:normsup
   #:real-epsilon
   #:*default-min-step-correction*
   #:pretty-step
   ;; bins
   #:bin-index
   #:bin-locations
   #:bin-location
   #:even-bins
   #:even-bins-p
   #:pretty-bins
   #:integer-bins
   #:integer-bins-p
   #:format-bin-location
   #:binary-search
   ;; statistics
   #:tally
   #:add
   #:pool
   #:empty-accumulator
   #:not-enough-elements-in-accumulator
   #:information-not-collected-in-accumulator
   #:central-sample-moments
   #:*central-sample-moments-default-degree*
   #:mean
   #:variance
   #:sd
   #:central-m2
   #:central-m3
   #:central-m4
   #:skewness
   #:kurtosis
   ;; #:sample-ratio
   ;; #:quantile
   ;; #:quantiles
   ;; #:median
   ;; #:sum
   ;; #:product
   ;; #:sample-ratio-accumulator
   ;; #:mean-accumulator
   ;; #:incf-mean
   ;; #:array-mean-accumulator
   ;; #:mean-sse-accumulator
   ;; #:covariance-accumulator
   ;; #:covariance
   ;; #:correlation
   ;; #:covariance-xy
   ;; #:correlation-xy
   ;; #:autocovariance-accumulator
   ;; #:autocovariances
   ;; #:autocorrelations
   ;; #:lags
   ;; #:at
   ;; #:at-object
   ;; #:at-subscripts
   ;; #:sparse-accumulator-array
   ;; #:ref
   ;; #:limits
   ;; #:residual-pair
   ;; #:acf-accumulator
   ;; #:histogram-accumulator
   ;; #:bins
   ;; #:locations-and-tallies
   ;; #:location-limits
   ;; #:*frequency-print-width*
   ;; #:scott-rule
   ;; #:histogram1
   ;; #:subranges
   ;; #:demean
   ;; #:aggregate
   ;; #:empirical-quantile
   ;; #:empirical-quantile-probabilities
   ;; #:sorted-reals
   ;; #:sort-reals
   ;; #:ensure-sorted-reals
   ;; #:ensure-sorted-vector
   ;; interval
   #:interval
   #:interval-p
   #:interval-left
   #:interval-right
   #:&interval
   #:interval-length
   #:interval-midpoint
   #:in-interval?
   #:extend-interval
   #:extendf-interval
   #:interval-hull
   #:relative
   #:relative-fraction
   #:spacer
   #:spacer-weight
   #:shrink-interval
   #:split-interval
   ;; sub
   #:sub
   #:asub
   #:sub-incompatible-dimensions
   #:sub-invalid-array-index
   #:incl
   #:cat
   #:rev
   #:ivec*
   #:sub-resolve-index
   #:sub-resolve-selection
   #:positions
   #:mask
   #:which
   #:bit-to-boolean
   #:boolean-to-bit
   #:bracket
   ;; elementwise
   #:e+
   #:e-
   #:e*
   #:e/
   #:e2+
   #:e2-
   #:e2*
   #:e2/
   #:e1-
   #:e1/
   #:eexpt
   #:eexp
   #:elog
   #:esqrt
   #:econjugate
   #:ereduce
   #:emin
   #:emax
   #:stack-dimensions
   #:stack-into
   #:stack*
   #:stack
   #:concat*
   #:concat
   ;; utilities
   ;; data-frame
   #:data-frame
   #:make-data-frame
   #:make-data-frame2
   #:add-columns
   #:add-columns2
   #:add-column
   #:copy-data-frame
   #:keys
   #:matrix-to-data-frame
   #:map-data-frame
   #:map-into-data-frame
   ;; interaction
   #:interaction
   ;; optimization
   #:reached-max-iter
   #:golden-section-minimize
   ;; differentiation
   #:differentiate
   #:elasticity
   #:derivative
   ;; rootfinding
   #:*rootfinding-epsilon*
   #:*rootfinding-delta-relative*
   #:rootfinding-delta
   #:root-bisection
   ;; quadrature
   #:romberg-quadrature
   ;; NEED TO SORT THESE OUT
   #:elementwise-float-contagion
   #:common-array-element-type
   #:stack-element-type
   #:map-columns
   #:recycle-column
   #:recycle-row
   #:amap
   #:subarray-location
   #:esquare
   #:map-rows
   #:column-sums
   #:column-means
   #:row-sums
   #:row-means
   #:column-with-type
   #:column
   #:row
   #:row-with-type
   #:normalize1
   #:abs-diff
   #:chebyshev-recursion
   #:chebyshev-root
   #:chebyshev-roots
   #:chebyshev-regression
   #:chebyshev-evaluate
   #:chebyshev-approximate
   #:chebyshev-approximate-implementation
   #:internal-error
   #:not-implemented
   #:left
   #:right
   #:semi-elasticity
   #:generate-sequence
   #:splice-when
   #:splice-awhen
   #:vv-transpose
   #:finite-interval
   #:grid-in
   #:plusminus-interval
   #:quantile
   #:quantiles
   #:ensure-sorted-reals
   #:covariance-xy
   #:correlation-xy
   #:shift-interval
   #:ensure-sorted-vector
   #:x-moments
   #:y-moments
   #:sample-covariance
   #:covariance
   #:correlation))