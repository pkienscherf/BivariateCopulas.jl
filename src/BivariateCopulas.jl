######
# This file is part of the BivariateCopulas.jl package.
#
#   Module definition
#
#           University of Liverpool, Institute for Risk and Uncertainty
#
#                                           Authors: Ander Gray & Liam T. Henry
#                                           Email:  ander.gray@liverpool.ac.uk
######

module BivariateCopulas

using Reexport

@reexport using Distributions             #   https://github.com/JuliaStats/Distributions.jl
using LinearAlgebra                       #   Main Library
using Interpolations                      #   https://github.com/JuliaMath/Interpolations.jl

import Distributions: cdf, quantile, rand

import Base: rand

global  n  = 200;                       # Number of descretizations
global bOt = 0.0001;                    # smallest quantile to use if left tail is unbounded. Should we use these to define the copula ranges?
global tOp = 0.9999;                    # largest quantile to use if right tail is unbounded
#global bOt = 0;
#global tOp = 1;

abstract type AbstractCopula <: Real end
abstract type AbstractJoint <: Real end
abstract type AbstractMarginal <: ContinuousUnivariateDistribution end

include("copulas.jl")
include("NormalDistribution.jl")

export 
    copula, density, cdf, sample, rand, CholeskyGaussian,
    conditional, calcCdf, calcDensity, M, W, Pi, Frank, Clayton, Gaussian,
    norm_cdf, bivariate_cdf, mvNormCdf, Joint, invCdf, marginal, quantile, 
    ρCopula, SpearmanCopula, KendalCopula, τCopula


end #BivariateCopulas