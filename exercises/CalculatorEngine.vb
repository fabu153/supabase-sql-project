Option Strict On
Option Explicit On

Public Class CalculatorEngine
    ''' <summary>
    ''' Adds two numbers.
    ''' </summary>
    Public Shared Function Add(a As Double, b As Double) As Double
        Return a + b
    End Function

    ''' <summary>
    ''' Subtracts the second number from the first.
    ''' </summary>
    Public Shared Function Subtract(a As Double, b As Double) As Double
        Return a - b
    End Function

    ''' <summary>
    ''' Multiplies two numbers.
    ''' </summary>
    Public Shared Function Multiply(a As Double, b As Double) As Double
        Return a * b
    End Function

    ''' <summary>
    ''' Divides the first number by the second.
    ''' </summary>
    ''' <exception cref="DivideByZeroException">Thrown if b is zero.</exception>
    Public Shared Function Divide(a As Double, b As Double) As Double
        If b = 0 Then
            Throw New DivideByZeroException("Cannot divide by zero.")
        End If
        Return a / b
    End Function

    ''' <summary>
    ''' Performs the operation based on the CalculatorOperator.
    ''' </summary>
    Public Shared Function PerformOperation(a As Double, b As Double, op As CalculatorOperator) As Double
        Select Case op
            Case CalculatorOperator.Add
                Return Add(a, b)
            Case CalculatorOperator.Subtract
                Return Subtract(a, b)
            Case CalculatorOperator.Multiply
                Return Multiply(a, b)
            Case CalculatorOperator.Divide
                Return Divide(a, b)
            Case Else
                Throw New InvalidOperationException("Invalid operator.")
        End Select
    End Function
End Class
