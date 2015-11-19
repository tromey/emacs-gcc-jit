# Generate bindings for gcc-jit.

import gcc

pointer_types = {}

def note_pointer_type(ptr):
    global pointer_types
    if ptr not in pointer_types:
        targ = ptr.type
        if targ is gcc.Type.void():
            name = ":void"
        else:
            suffix = "-ptr"
            while isinstance(targ, gcc.PointerType):
                suffix += "-ptr"
                targ = targ.type
            if targ is gcc.Type.char():
                name = 'gcc-jit-string'
            elif targ is gcc.Type.char().const_equivalent:
                name = 'gcc-jit-const-string'
            elif isinstance(targ, gcc.RecordType):
                name = str(targ.name)
            else:
                raise ValueError("Unhandled pointer type", ptr)
            name = name.replace("_", "-") + suffix
            print '(defvar %s :pointer\n  "Typedef for %s")' % (name, str(ptr))
        pointer_types[ptr] = name
    return pointer_types[ptr]

def from_jit_h(name):
    return name.endswith('libgccjit.h')

def convert_type(t):
    if t is gcc.Type.void():
        return ":void"
    elif t is gcc.Type.size_t():
        return ":size_t"
    elif t is gcc.Type.char():
        return ":char"
    elif t is gcc.Type.signed_char():
        return ":schar"
    elif t is gcc.Type.unsigned_char():
        # A flaw in the ffi-module and maybe libffi
        return ":char"
    elif t is gcc.Type.double():
        return ":double"
    elif t is gcc.Type.float():
        return ":float"
    elif t is gcc.Type.short():
        return ":short"
    elif t is gcc.Type.unsigned_short():
        return ":ushort"
    elif t is gcc.Type.int():
        return ":int"
    elif t is gcc.Type.unsigned_int():
        return ":uint"
    elif t is gcc.Type.long():
        return ":long"
    elif t is gcc.Type.unsigned_long():
        return ":ulong"
    elif t is gcc.Type.uint32():
        return ":uint32"
    elif t is gcc.Type.uint64():
        return ":uint64"
    elif isinstance(t, gcc.PointerType):
        return note_pointer_type(t)
    elif isinstance(t, gcc.EnumeralType):
        return str(t.sizeof)
    raise ValueError("Unhandled type", t)

def note_declaration(decl, *args, **kwargs):
    if isinstance(decl, gcc.Constant):
        print "HI"
    if from_jit_h(decl.location.file) and isinstance(decl, gcc.FunctionDecl):
        c_name = decl.name
        lisp_name = c_name.replace('_', '-')
        rtype = convert_type(decl.type.type)
        argtypes = [convert_type(t) for t in decl.type.argument_types]
        print '(define-ffi-function %s\n  "%s"\n  %s\n  (%s)\n  libgccjit.so)' % (lisp_name, c_name, rtype, " ".join(argtypes))

print "(require 'ffi)"
print '(define-ffi-library libgccjit.so "libgccjit")'

def done(*arg, **kwargs):
    print "(provide 'gcc-jit)"

gcc.register_callback(gcc.PLUGIN_FINISH_DECL, note_declaration)
gcc.register_callback(gcc.PLUGIN_FINISH, done)
