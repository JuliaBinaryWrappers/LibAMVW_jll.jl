# Autogenerated wrapper script for LibAMVW_jll for x86_64-linux-musl-libgfortran4
export libamvwsingle, libamvwdouble

using OpenBLAS32_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libamvwsingle`
const libamvwsingle_splitpath = ["lib", "libamvwsingle.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libamvwsingle_path = ""

# libamvwsingle-specific global declaration
# This will be filled out by __init__()
libamvwsingle_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libamvwsingle = "libamvwsingle.so"


# Relative path to `libamvwdouble`
const libamvwdouble_splitpath = ["lib", "libamvwdouble.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libamvwdouble_path = ""

# libamvwdouble-specific global declaration
# This will be filled out by __init__()
libamvwdouble_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libamvwdouble = "libamvwdouble.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LibAMVW")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (OpenBLAS32_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (OpenBLAS32_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libamvwsingle_path = normpath(joinpath(artifact_dir, libamvwsingle_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libamvwsingle_handle = dlopen(libamvwsingle_path)
    push!(LIBPATH_list, dirname(libamvwsingle_path))

    global libamvwdouble_path = normpath(joinpath(artifact_dir, libamvwdouble_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libamvwdouble_handle = dlopen(libamvwdouble_path)
    push!(LIBPATH_list, dirname(libamvwdouble_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

