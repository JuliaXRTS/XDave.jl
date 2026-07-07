module XDave

using PythonCall

const xdave = PythonCall.pynew()

function __init__()
    return PythonCall.pycopy!(xdave, pyimport("xdave"))
end


"""
    hi = hello_world()
A simple function to return "Hello, World!"
"""
function hello_world()
    return "Hello, World!"
end


end
