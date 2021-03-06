module ModelingToolkit

using DiffEqBase
import MacroTools: splitdef, combinedef
import IterTools: product

abstract type Expression <: Number end
abstract type AbstractOperation <: Expression end
abstract type AbstractOperator <: Expression end
abstract type AbstractComponent <: Expression end
abstract type AbstractConnection <: Expression end
abstract type AbstractSystem end
abstract type AbstractDomain end

include("domains.jl")
include("variables.jl")

Base.promote_rule(::Type{T},::Type{T2}) where {T<:Number,T2<:Expression} = Expression
Base.one(::Type{T}) where T<:Expression = Constant(1)
Base.zero(::Type{T}) where T<:Expression = Constant(0)

function caclulate_jacobian end

include("operations.jl")
include("operators.jl")
include("systems/diffeqs/diffeqsystem.jl")
include("systems/diffeqs/first_order_transform.jl")
include("systems/nonlinear/nonlinear_system.jl")
include("function_registration.jl")
include("connections.jl")
include("simplify.jl")
include("utils.jl")

export Operation, Expression, AbstractOperator, AbstractComponent, AbstractDomain
export @register
end # module
