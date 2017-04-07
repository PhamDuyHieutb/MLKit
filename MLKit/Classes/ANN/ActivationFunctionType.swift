//
//  ActivationFunctionType.swift
//  Pods
//
//  Created by Guled  on 4/7/17.
//
//

import Foundation

/// Enum for determining the appropriate activation function for a Layer object.
public enum ActivationFunctionType {

    case step /// Step Activation Function
    case linear /// Linear Activation Function
    case siglog /// SigLog Activation Function
    case hypertan /// HypterTan Activation Function
    case softsign /// SoftSign Activation Function
    case sinusoid /// Sinusoid Activation Function
    case gaussian /// Sinusoid Activation Function

    /**
     The activate method returns an activation function.
    */
    func activate() -> (_:Float) -> Float {
        switch self {
        case .step:
            return fncStep
        case .linear:
            return fncLinear
        case .siglog:
            return fncSigLog
        case .hypertan:
            return fncHyperTan
        case .softsign:
            return fncSoftSign
        case .sinusoid:
            return fncSinusoid
        case .gaussian:
            return fncGuassian

        default:
            return error
        }
    }


    /**
     The activate method returns the derivative of the activation function a Layer object is using.
    */
    func derivative() -> (_:Float) -> Float {
        switch self {
        case .linear:
            return derivativeOfLinear
        case .siglog:
            return derivativeOfSigLog
        case .hypertan:
            return derivativeOfHyperTan
        case .softsign:
            return derivativeOfSoftSign
        case .sinusoid:
            return derivativeOfSinusoid
        case .gaussian:
            return derivativeOfGaussian

        default:
            return error
        }
    }


    // MARK: ACTIVATION FUNCTIONS
    private func fncStep(val: Float) -> Float {
        return val >= 0 ? 1.0 : 0.0
    }

    private func fncLinear(val: Float) -> Float {
        return val
    }

    private func fncSigLog(val: Float) -> Float {
        return 1.0 / (1.0 + exp(-val))
    }

    private func fncHyperTan(val: Float) -> Float {
        return tanh(val)
    }

    private func fncSoftSign(val: Float) -> Float {
        return val / 1 + abs(val)
    }

    private func fncSinusoid(val: Float) -> Float {
        return sin(val)
    }

    private func fncGuassian(val: Float) -> Float {
        return exp(powf((-val), 2))
    }

    // MARK: Derivatives
    private func derivativeOfLinear(val: Float) -> Float {
        return 1.0
    }

    private func derivativeOfSigLog(val: Float) -> Float {
        return fncSigLog(val: val) * (1.0 - fncSigLog(val: val))
    }

    private func derivativeOfHyperTan(val: Float) -> Float {
        return (1.0 / powf(cosh(val), 2.0))
    }

    private func derivativeOfSoftSign(val: Float) -> Float {
        return 1 / powf((1 + abs(val)), 2)
    }

    private func derivativeOfSinusoid(val: Float) -> Float {
        return cosf(val)
    }

    private func derivativeOfGaussian(val: Float) -> Float {
        return -2 * val * exp(powf((-val), 2))
    }

    // Error Method
    private func error(val: Float) -> Float {
        return -1
    }

}
