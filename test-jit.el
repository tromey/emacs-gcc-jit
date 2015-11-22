(require 'gcc-jit)

(defun make-square ()
  (with-ffi-strings ((param-name "i")
		     (square-name "square"))
    (with-ffi-temporary (param-pointer :pointer)
      (let* ((context (gcc-jit-context-acquire))
	     (int-type (gcc-jit-context-get-type context
						 GCC-JIT-TYPE-INT))
	     (NULL (ffi-null-pointer))
	     (param (gcc-jit-context-new-param context NULL int-type
					       param-name))
	     (ignore ;; this is just to fill in param-pointer.
	      (ffi--mem-set param-pointer :pointer param))
	     (function (gcc-jit-context-new-function context NULL
						     GCC-JIT-FUNCTION-EXPORTED
						     int-type
						     square-name
						     1 param-pointer
						     0))
	     (block (gcc-jit-function-new-block func NULL))
	     (expr (gcc-jit-context-new-binary-op
		    context NULL
		    GCC-JIT-BINARY-OP-MULT
		    int-type
		    (gcc-jit-param-as-rvalue param)
		    (gcc-jit-param-as-rvalue param))))
	(gcc-jit-block-end-with-return block NULL expr)
	(let ((jit-result (gcc-jit-context-compile context)))
	  ;; Return a function.
	  ;; Note we never free the result.
	  (ffi-lambda  (gcc-jit-result-get-code jit-result square-name)
		       :int '(:int))
	  (gcc-jit-context-release context))))))

(ert-deftest jit-square ()
  (let ((square (make-square)))
    (should (eq (funcall square 7) 49))))
