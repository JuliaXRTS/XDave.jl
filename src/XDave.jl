module XDave

using PythonCall

const xdave = PythonCall.pynew()
const ii_ff = PythonCall.pynew()

function __init__()
    PythonCall.pycopy!(xdave, pyimport("xdave"))
    PythonCall.pycopy!(ii_ff, xdave.ii_ff)

    return nothing
end


"""
    hi = hello_world()
A simple function to return "Hello, World!"
"""
function hello_world()
    return "Hello, World!"
end


export ScreeningConstants, PaulingShermanIonicFormFactor

include("ii_ff.jl")

end
