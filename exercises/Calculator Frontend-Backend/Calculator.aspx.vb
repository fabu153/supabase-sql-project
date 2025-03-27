Option Strict On
Option Explicit On

Imports System

' Define an enumeration for operators.
Public Enum CalculatorOperator
    None = 0
    Add
    Subtract
    Multiply
    Divide
End Enum

Partial Public Class _Default
    Inherits System.Web.UI.Page

    ' ViewState keys for storing state.
    Private Const VIEWSTATE_FIRSTOPERAND As String = "FirstOperand"
    Private Const VIEWSTATE_OPERATOR As String = "Operator"
    Private Const VIEWSTATE_RESETDISPLAY As String = "ResetDisplay"

    ''' <summary>
    ''' Page load event. Initializes the calculator.
    ''' </summary>
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ResetCalculator()
        End If
    End Sub

    ''' <summary>
    ''' Resets the calculator display and stored values.
    ''' </summary>
    Private Sub ResetCalculator()
        txtDisplay.Text = "0"
        ViewState(VIEWSTATE_FIRSTOPERAND) = Nothing
        ViewState(VIEWSTATE_OPERATOR) = CalculatorOperator.None
        ViewState(VIEWSTATE_RESETDISPLAY) = False
    End Sub
    Private Sub ResetState()
        ' Reset the internal state but leave the display as is.
        ViewState(VIEWSTATE_FIRSTOPERAND) = Nothing
        ViewState(VIEWSTATE_OPERATOR) = CalculatorOperator.None
        ViewState(VIEWSTATE_RESETDISPLAY) = True
    End Sub


    ''' <summary>
    ''' Handles digit and decimal button clicks.
    ''' </summary>
    Protected Sub DigitButton_Click(sender As Object, e As EventArgs)
        Dim btn As Button = CType(sender, Button)
        Dim digit As String = btn.Text

        ' If starting a new operand, clear the display.
        If CBool(ViewState(VIEWSTATE_RESETDISPLAY)) Then
            txtDisplay.Text = String.Empty
            ViewState(VIEWSTATE_RESETDISPLAY) = False
        End If

        ' Prevent multiple decimals.
        If digit = "." AndAlso txtDisplay.Text.Contains(".") Then
            Return
        End If

        ' Replace initial "0" (except when adding a decimal).
        If txtDisplay.Text = "0" AndAlso digit <> "." Then
            txtDisplay.Text = digit
        Else
            txtDisplay.Text &= digit
        End If
    End Sub

    ''' <summary>
    ''' Handles operator button clicks and supports chained operations.
    ''' </summary>
    Protected Sub OperatorButton_Click(sender As Object, e As EventArgs)
        Dim btn As Button = CType(sender, Button)
        Dim opEnum As CalculatorOperator = GetOperatorFromString(btn.Text)

        ' If an operator is already set and a new number was entered, compute the intermediate result.
        If ViewState(VIEWSTATE_OPERATOR) IsNot Nothing AndAlso CType(ViewState(VIEWSTATE_OPERATOR), CalculatorOperator) <> CalculatorOperator.None AndAlso Not CBool(ViewState(VIEWSTATE_RESETDISPLAY)) Then
            CalculateIntermediateResult()
        End If

        ' Store the current display value as the first operand.
        Dim firstOperand As Double
        If Double.TryParse(txtDisplay.Text, firstOperand) Then
            ViewState(VIEWSTATE_FIRSTOPERAND) = firstOperand
        Else
            txtDisplay.Text = "Invalid number"
            Return
        End If

        ViewState(VIEWSTATE_OPERATOR) = opEnum
        ViewState(VIEWSTATE_RESETDISPLAY) = True
    End Sub

    ''' <summary>
    ''' Handles the equals button click to compute the result.
    ''' </summary>
    Protected Sub btnEquals_Click(sender As Object, e As EventArgs)
        If ViewState(VIEWSTATE_FIRSTOPERAND) IsNot Nothing AndAlso ViewState(VIEWSTATE_OPERATOR) IsNot Nothing Then
            CalculateIntermediateResult()
            ' Clear operator after calculation.
            ViewState(VIEWSTATE_OPERATOR) = CalculatorOperator.None
        End If
    End Sub

    ''' <summary>
    ''' Calculates the result using the stored first operand, current display value, and operator.
    ''' Supports chaining operations.
    ''' </summary>
    Private Sub CalculateIntermediateResult()
        Dim firstOperand As Double = CDbl(ViewState(VIEWSTATE_FIRSTOPERAND))
        Dim secondOperand As Double

        If Not Double.TryParse(txtDisplay.Text, secondOperand) Then
            txtDisplay.Text = "Invalid input"
            Return
        End If

        Dim opEnum As CalculatorOperator = CType(ViewState(VIEWSTATE_OPERATOR), CalculatorOperator)
        Try
            Dim result As Double = CalculatorEngine.PerformOperation(firstOperand, secondOperand, opEnum)
            txtDisplay.Text = result.ToString()
            ' Update first operand for chaining.
            ViewState(VIEWSTATE_FIRSTOPERAND) = result
            ViewState(VIEWSTATE_RESETDISPLAY) = True
        Catch ex As DivideByZeroException
            System.Diagnostics.Trace.WriteLine("Division error: " & ex.Message)
            txtDisplay.Text = "Cannot divide by zero"
            ResetState()
        Catch ex As Exception
            System.Diagnostics.Trace.WriteLine("Calculation error: " & ex.Message)
            txtDisplay.Text = "Calculation error"
            ResetState()
        End Try
    End Sub

    ''' <summary>
    ''' Clears the display and resets the calculator.
    ''' </summary>
    Protected Sub btnClear_Click(sender As Object, e As EventArgs)
        ResetCalculator()
    End Sub

    ''' <summary>
    ''' Maps the operator string to the corresponding CalculatorOperator enum.
    ''' </summary>
    Private Function GetOperatorFromString(op As String) As CalculatorOperator
        Select Case op
            Case "+"
                Return CalculatorOperator.Add
            Case "-"
                Return CalculatorOperator.Subtract
            Case "*"
                Return CalculatorOperator.Multiply
            Case "/"
                Return CalculatorOperator.Divide
            Case Else
                Return CalculatorOperator.None
        End Select
    End Function
End Class
