# Generate bindings for gcc-jit.

import gcc

special_types = {}

def emit_enum_constants(values):
    for (name, value) in values:
        name = str(name).replace("_", "-")
        print "(defconst %s %s)" % (name, value)

def note_special_type(special):
    global special_types
    if special not in special_types:
        if isinstance(special, gcc.EnumeralType):
            # We check for this attr because it's not available in all
            # releases of gcc-python-plugin.
            if hasattr(special, 'values'):
                emit_enum_constants(special.values)
            if special.sizeof == gcc.Type.int().sizeof:
                equiv = gcc.Type.int()
            elif special.sizeof == gcc.Type.long().sizeof:
                equiv = gcc.Type.int()
            else:
                raise ValueError("Unhandled enum type size", t)
            base_type = convert_type(equiv)
            name = str(special).replace("_", "-") + "-enum"
            print '(defconst %s %s\n  "Typedef for %s")' % (name, base_type, str(special))
        else:
            targ = special.type
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
                    raise ValueError("Unhandled pointer type", special)
                name = name.replace("_", "-") + suffix
                print '(defconst %s :pointer\n  "Typedef for %s")' % (name, str(special))
        special_types[special] = name
    return special_types[special]

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
        return note_special_type(t)
    elif isinstance(t, gcc.EnumeralType):
        return note_special_type(t)
    raise ValueError("Unhandled type", t)

def note_declaration(decl, *args, **kwargs):
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
