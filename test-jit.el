(require 'gcc-jit)

(defvar test-jit-context (gcc-jit-context-acquire))

(defun make-square ()
  (with-ffi-strings ((param-name "i")
		     (square-name "square"))
    (with-ffi-temporary (param-pointer :pointer)
      (let* ((int-type (gcc-jit-context-get-type test-jit-context
						 GCC-JIT-TYPE-INT))
	     (NULL (ffi-null-pointer))
	     (param (gcc-jit-context-new-param test-jit-context NULL int-type
					       param-name))
	     (ignore ;; this is just to fill in param-pointer.
	      (ffi--mem-set param-pointer :pointer param))
	     (function (gcc-jit-context-new-function test-jit-context NULL
						     GCC-JIT-FUNCTION-EXPORTED
						     int-type
						     square-name
						     1 param-pointer
						     0))
	     (block (gcc-jit-function-new-block func NULL))
	     (expr (gcc-jit-context-new-binary-op
		    test-jit-context NULL
		    GCC-JIT-BINARY-OP-MULT
		    int-type
		    (gcc-jit-param-as-rvalue param)
		    (gcc-jit-param-as-rvalue param))))
	(gcc-jit-block-end-with-return block NULL expr)
	;; Return a function.
	(ffi-lambda (gcc-jit-context-compile test-jit-context) :int '(:int))))))
