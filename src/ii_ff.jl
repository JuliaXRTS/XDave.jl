export ScreeningConstants, PaulingShermanIonicFormFactor

struct ScreeningConstants{T}
    py::Py

    function ScreeningConstants(::Type{T}, py::Py) where {T <: AbstractFloat}
        return new{T}(py)
    end
end

ScreeningConstants(::Type{T}) where {T <: AbstractFloat} = ScreeningConstants(T, xdave.ii_ff.ScreeningConstants())
ScreeningConstants() = ScreeningConstants(Float64)

_SC_MEMBER_FUNCTIONS = (:c1s, :c2s, :c2p, :c3s, :c3p, :c4s, :c3d)

for f in _SC_MEMBER_FUNCTIONS
    @eval $f(sc::ScreeningConstants{T}, ZA::Int, ZB::Int) where {T} = pyconvert(T, sc.py.$f(ZA, ZB))
end


struct PaulingShermanIonicFormFactor{T}
    py::Py

    function PaulingShermanIonicFormFactor(::Type{T}, py::Py) where {T <: AbstractFloat}
        return new{T}(py)
    end
end

PaulingShermanIonicFormFactor(::Type{T}) where {T <: AbstractFloat} = PaulingShermanIonicFormFactor(T, xdave.ii_ff.PaulingShermanIonicFormFactor())
PaulingShermanIonicFormFactor() = PaulingShermanIonicFormFactor(Float64)


_PS_MEMBER_FUNCTIONS = (:calculate_effective_charge_state, :calculate_form_factor)

for f in _PS_MEMBER_FUNCTIONS
    @eval function $f(ff::PaulingShermanIonicFormFactor{T}, args...; kwargs...) where {T}
        return pyconvert(T, pycall(getfield(ff, :py).$f, args...; kwargs...))
    end
end
