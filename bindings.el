(require 'ffi)
(define-ffi-library libgccjit.so "libgccjit")
(defvar gcc-jit-context-ptr :pointer
  "Typedef for struct gcc_jit_context *")
(define-ffi-function gcc-jit-context-acquire
  "gcc_jit_context_acquire"
  gcc-jit-context-ptr
  ()
  libgccjit.so)
(define-ffi-function gcc-jit-context-release
  "gcc_jit_context_release"
  :void
  (gcc-jit-context-ptr)
  libgccjit.so)
(defvar gcc-jit-const-string-ptr :pointer
  "Typedef for const char *")
(define-ffi-function gcc-jit-context-set-str-option
  "gcc_jit_context_set_str_option"
  :void
  (gcc-jit-context-ptr 4 gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-set-int-option
  "gcc_jit_context_set_int_option"
  :void
  (gcc-jit-context-ptr 4 :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-set-bool-option
  "gcc_jit_context_set_bool_option"
  :void
  (gcc-jit-context-ptr 4 :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-set-bool-allow-unreachable-blocks
  "gcc_jit_context_set_bool_allow_unreachable_blocks"
  :void
  (gcc-jit-context-ptr :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-set-bool-use-external-driver
  "gcc_jit_context_set_bool_use_external_driver"
  :void
  (gcc-jit-context-ptr :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-add-command-line-option
  "gcc_jit_context_add_command_line_option"
  :void
  (gcc-jit-context-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(defvar gcc-jit-result-ptr :pointer
  "Typedef for struct gcc_jit_result *")
(define-ffi-function gcc-jit-context-compile
  "gcc_jit_context_compile"
  gcc-jit-result-ptr
  (gcc-jit-context-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-compile-to-file
  "gcc_jit_context_compile_to_file"
  :void
  (gcc-jit-context-ptr 4 gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-dump-to-file
  "gcc_jit_context_dump_to_file"
  :void
  (gcc-jit-context-ptr gcc-jit-const-string-ptr :int)
  libgccjit.so)
(defvar FILE-ptr :pointer
  "Typedef for struct FILE *")
(define-ffi-function gcc-jit-context-set-logfile
  "gcc_jit_context_set_logfile"
  :void
  (gcc-jit-context-ptr FILE-ptr :int :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-first-error
  "gcc_jit_context_get_first_error"
  gcc-jit-const-string-ptr
  (gcc-jit-context-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-last-error
  "gcc_jit_context_get_last_error"
  gcc-jit-const-string-ptr
  (gcc-jit-context-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-result-get-code
  "gcc_jit_result_get_code"
  :void
  (gcc-jit-result-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-result-get-global
  "gcc_jit_result_get_global"
  :void
  (gcc-jit-result-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-result-release
  "gcc_jit_result_release"
  :void
  (gcc-jit-result-ptr)
  libgccjit.so)
(defvar gcc-jit-object-ptr :pointer
  "Typedef for struct gcc_jit_object *")
(define-ffi-function gcc-jit-object-get-context
  "gcc_jit_object_get_context"
  gcc-jit-context-ptr
  (gcc-jit-object-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-object-get-debug-string
  "gcc_jit_object_get_debug_string"
  gcc-jit-const-string-ptr
  (gcc-jit-object-ptr)
  libgccjit.so)
(defvar gcc-jit-location-ptr :pointer
  "Typedef for struct gcc_jit_location *")
(define-ffi-function gcc-jit-context-new-location
  "gcc_jit_context_new_location"
  gcc-jit-location-ptr
  (gcc-jit-context-ptr gcc-jit-const-string-ptr :int :int)
  libgccjit.so)
(define-ffi-function gcc-jit-location-as-object
  "gcc_jit_location_as_object"
  gcc-jit-object-ptr
  (gcc-jit-location-ptr)
  libgccjit.so)
(defvar gcc-jit-type-ptr :pointer
  "Typedef for struct gcc_jit_type *")
(define-ffi-function gcc-jit-type-as-object
  "gcc_jit_type_as_object"
  gcc-jit-object-ptr
  (gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-type
  "gcc_jit_context_get_type"
  gcc-jit-type-ptr
  (gcc-jit-context-ptr 4)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-int-type
  "gcc_jit_context_get_int_type"
  gcc-jit-type-ptr
  (gcc-jit-context-ptr :int :int)
  libgccjit.so)
(define-ffi-function gcc-jit-type-get-pointer
  "gcc_jit_type_get_pointer"
  gcc-jit-type-ptr
  (gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-type-get-const
  "gcc_jit_type_get_const"
  gcc-jit-type-ptr
  (gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-type-get-volatile
  "gcc_jit_type_get_volatile"
  gcc-jit-type-ptr
  (gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-array-type
  "gcc_jit_context_new_array_type"
  gcc-jit-type-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-type-ptr :int)
  libgccjit.so)
(defvar gcc-jit-field-ptr :pointer
  "Typedef for struct gcc_jit_field *")
(define-ffi-function gcc-jit-context-new-field
  "gcc_jit_context_new_field"
  gcc-jit-field-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-type-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-field-as-object
  "gcc_jit_field_as_object"
  gcc-jit-object-ptr
  (gcc-jit-field-ptr)
  libgccjit.so)
(defvar gcc-jit-struct-ptr :pointer
  "Typedef for struct gcc_jit_struct *")
(defvar gcc-jit-field-ptr-ptr :pointer
  "Typedef for struct gcc_jit_field * *")
(define-ffi-function gcc-jit-context-new-struct-type
  "gcc_jit_context_new_struct_type"
  gcc-jit-struct-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-const-string-ptr :int gcc-jit-field-ptr-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-opaque-struct
  "gcc_jit_context_new_opaque_struct"
  gcc-jit-struct-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-struct-as-type
  "gcc_jit_struct_as_type"
  gcc-jit-type-ptr
  (gcc-jit-struct-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-struct-set-fields
  "gcc_jit_struct_set_fields"
  :void
  (gcc-jit-struct-ptr gcc-jit-location-ptr :int gcc-jit-field-ptr-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-union-type
  "gcc_jit_context_new_union_type"
  gcc-jit-type-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-const-string-ptr :int gcc-jit-field-ptr-ptr)
  libgccjit.so)
(defvar gcc-jit-type-ptr-ptr :pointer
  "Typedef for struct gcc_jit_type * *")
(define-ffi-function gcc-jit-context-new-function-ptr-type
  "gcc_jit_context_new_function_ptr_type"
  gcc-jit-type-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-type-ptr :int gcc-jit-type-ptr-ptr :int)
  libgccjit.so)
(defvar gcc-jit-param-ptr :pointer
  "Typedef for struct gcc_jit_param *")
(define-ffi-function gcc-jit-context-new-param
  "gcc_jit_context_new_param"
  gcc-jit-param-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-type-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-param-as-object
  "gcc_jit_param_as_object"
  gcc-jit-object-ptr
  (gcc-jit-param-ptr)
  libgccjit.so)
(defvar gcc-jit-lvalue-ptr :pointer
  "Typedef for struct gcc_jit_lvalue *")
(define-ffi-function gcc-jit-param-as-lvalue
  "gcc_jit_param_as_lvalue"
  gcc-jit-lvalue-ptr
  (gcc-jit-param-ptr)
  libgccjit.so)
(defvar gcc-jit-rvalue-ptr :pointer
  "Typedef for struct gcc_jit_rvalue *")
(define-ffi-function gcc-jit-param-as-rvalue
  "gcc_jit_param_as_rvalue"
  gcc-jit-rvalue-ptr
  (gcc-jit-param-ptr)
  libgccjit.so)
(defvar gcc-jit-function-ptr :pointer
  "Typedef for struct gcc_jit_function *")
(defvar gcc-jit-param-ptr-ptr :pointer
  "Typedef for struct gcc_jit_param * *")
(define-ffi-function gcc-jit-context-new-function
  "gcc_jit_context_new_function"
  gcc-jit-function-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr 4 gcc-jit-type-ptr gcc-jit-const-string-ptr :int gcc-jit-param-ptr-ptr :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-builtin-function
  "gcc_jit_context_get_builtin_function"
  gcc-jit-function-ptr
  (gcc-jit-context-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-function-as-object
  "gcc_jit_function_as_object"
  gcc-jit-object-ptr
  (gcc-jit-function-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-function-get-param
  "gcc_jit_function_get_param"
  gcc-jit-param-ptr
  (gcc-jit-function-ptr :int)
  libgccjit.so)
(define-ffi-function gcc-jit-function-dump-to-dot
  "gcc_jit_function_dump_to_dot"
  :void
  (gcc-jit-function-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(defvar gcc-jit-block-ptr :pointer
  "Typedef for struct gcc_jit_block *")
(define-ffi-function gcc-jit-function-new-block
  "gcc_jit_function_new_block"
  gcc-jit-block-ptr
  (gcc-jit-function-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-as-object
  "gcc_jit_block_as_object"
  gcc-jit-object-ptr
  (gcc-jit-block-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-get-function
  "gcc_jit_block_get_function"
  gcc-jit-function-ptr
  (gcc-jit-block-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-global
  "gcc_jit_context_new_global"
  gcc-jit-lvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr 4 gcc-jit-type-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-lvalue-as-object
  "gcc_jit_lvalue_as_object"
  gcc-jit-object-ptr
  (gcc-jit-lvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-lvalue-as-rvalue
  "gcc_jit_lvalue_as_rvalue"
  gcc-jit-rvalue-ptr
  (gcc-jit-lvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-rvalue-as-object
  "gcc_jit_rvalue_as_object"
  gcc-jit-object-ptr
  (gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-rvalue-get-type
  "gcc_jit_rvalue_get_type"
  gcc-jit-type-ptr
  (gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-rvalue-from-int
  "gcc_jit_context_new_rvalue_from_int"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr :int)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-rvalue-from-long
  "gcc_jit_context_new_rvalue_from_long"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr :long)
  libgccjit.so)
(define-ffi-function gcc-jit-context-zero
  "gcc_jit_context_zero"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-one
  "gcc_jit_context_one"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-rvalue-from-double
  "gcc_jit_context_new_rvalue_from_double"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr :double)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-rvalue-from-ptr
  "gcc_jit_context_new_rvalue_from_ptr"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr :void)
  libgccjit.so)
(define-ffi-function gcc-jit-context-null
  "gcc_jit_context_null"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-string-literal
  "gcc_jit_context_new_string_literal"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-unary-op
  "gcc_jit_context_new_unary_op"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr 4 gcc-jit-type-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-binary-op
  "gcc_jit_context_new_binary_op"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr 4 gcc-jit-type-ptr gcc-jit-rvalue-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-comparison
  "gcc_jit_context_new_comparison"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr 4 gcc-jit-rvalue-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(defvar gcc-jit-rvalue-ptr-ptr :pointer
  "Typedef for struct gcc_jit_rvalue * *")
(define-ffi-function gcc-jit-context-new-call
  "gcc_jit_context_new_call"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-function-ptr :int gcc-jit-rvalue-ptr-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-call-through-ptr
  "gcc_jit_context_new_call_through_ptr"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr :int gcc-jit-rvalue-ptr-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-cast
  "gcc_jit_context_new_cast"
  gcc-jit-rvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr gcc-jit-type-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-array-access
  "gcc_jit_context_new_array_access"
  gcc-jit-lvalue-ptr
  (gcc-jit-context-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-lvalue-access-field
  "gcc_jit_lvalue_access_field"
  gcc-jit-lvalue-ptr
  (gcc-jit-lvalue-ptr gcc-jit-location-ptr gcc-jit-field-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-rvalue-access-field
  "gcc_jit_rvalue_access_field"
  gcc-jit-rvalue-ptr
  (gcc-jit-rvalue-ptr gcc-jit-location-ptr gcc-jit-field-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-rvalue-dereference-field
  "gcc_jit_rvalue_dereference_field"
  gcc-jit-lvalue-ptr
  (gcc-jit-rvalue-ptr gcc-jit-location-ptr gcc-jit-field-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-rvalue-dereference
  "gcc_jit_rvalue_dereference"
  gcc-jit-lvalue-ptr
  (gcc-jit-rvalue-ptr gcc-jit-location-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-lvalue-get-address
  "gcc_jit_lvalue_get_address"
  gcc-jit-rvalue-ptr
  (gcc-jit-lvalue-ptr gcc-jit-location-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-function-new-local
  "gcc_jit_function_new_local"
  gcc-jit-lvalue-ptr
  (gcc-jit-function-ptr gcc-jit-location-ptr gcc-jit-type-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-add-eval
  "gcc_jit_block_add_eval"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-add-assignment
  "gcc_jit_block_add_assignment"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-lvalue-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-add-assignment-op
  "gcc_jit_block_add_assignment_op"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-lvalue-ptr 4 gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-add-comment
  "gcc_jit_block_add_comment"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-end-with-conditional
  "gcc_jit_block_end_with_conditional"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr gcc-jit-block-ptr gcc-jit-block-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-end-with-jump
  "gcc_jit_block_end_with_jump"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-block-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-end-with-return
  "gcc_jit_block_end_with_return"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-block-end-with-void-return
  "gcc_jit_block_end_with_void_return"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr)
  libgccjit.so)
(defvar gcc-jit-case-ptr :pointer
  "Typedef for struct gcc_jit_case *")
(define-ffi-function gcc-jit-context-new-case
  "gcc_jit_context_new_case"
  gcc-jit-case-ptr
  (gcc-jit-context-ptr gcc-jit-rvalue-ptr gcc-jit-rvalue-ptr gcc-jit-block-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-case-as-object
  "gcc_jit_case_as_object"
  gcc-jit-object-ptr
  (gcc-jit-case-ptr)
  libgccjit.so)
(defvar gcc-jit-case-ptr-ptr :pointer
  "Typedef for struct gcc_jit_case * *")
(define-ffi-function gcc-jit-block-end-with-switch
  "gcc_jit_block_end_with_switch"
  :void
  (gcc-jit-block-ptr gcc-jit-location-ptr gcc-jit-rvalue-ptr gcc-jit-block-ptr :int gcc-jit-case-ptr-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-new-child-context
  "gcc_jit_context_new_child_context"
  gcc-jit-context-ptr
  (gcc-jit-context-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-dump-reproducer-to-file
  "gcc_jit_context_dump_reproducer_to_file"
  :void
  (gcc-jit-context-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(defvar gcc-jit-string-ptr-ptr :pointer
  "Typedef for char * *")
(define-ffi-function gcc-jit-context-enable-dump
  "gcc_jit_context_enable_dump"
  :void
  (gcc-jit-context-ptr gcc-jit-const-string-ptr gcc-jit-string-ptr-ptr)
  libgccjit.so)
(defvar gcc-jit-timer-ptr :pointer
  "Typedef for struct gcc_jit_timer *")
(define-ffi-function gcc-jit-timer-new
  "gcc_jit_timer_new"
  gcc-jit-timer-ptr
  ()
  libgccjit.so)
(define-ffi-function gcc-jit-timer-release
  "gcc_jit_timer_release"
  :void
  (gcc-jit-timer-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-set-timer
  "gcc_jit_context_set_timer"
  :void
  (gcc-jit-context-ptr gcc-jit-timer-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-context-get-timer
  "gcc_jit_context_get_timer"
  gcc-jit-timer-ptr
  (gcc-jit-context-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-timer-push
  "gcc_jit_timer_push"
  :void
  (gcc-jit-timer-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-timer-pop
  "gcc_jit_timer_pop"
  :void
  (gcc-jit-timer-ptr gcc-jit-const-string-ptr)
  libgccjit.so)
(define-ffi-function gcc-jit-timer-print
  "gcc_jit_timer_print"
  :void
  (gcc-jit-timer-ptr FILE-ptr)
  libgccjit.so)
(provide 'gcc-jit)
