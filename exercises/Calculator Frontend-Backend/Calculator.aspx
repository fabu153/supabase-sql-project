<%@ Page Title="Calculator" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calculator.aspx.vb" Inherits="Calculator._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <!-- Calculator wrapped in an UpdatePanel for partial page updates -->
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <div class="container mt-5" role="main">
        <div class="row justify-content-center">
          <div class="col-md-4">
            <div class="card shadow">
              <div class="card-header text-center">
                <h2>Calculator</h2>
              </div>
              <div class="card-body">
                <!-- Display for the calculator -->
                <asp:TextBox 
                    ID="txtDisplay" 
                    runat="server" 
                    CssClass="form-control text-right mb-3" 
                    ReadOnly="true" 
                    Text="0"
                    aria-live="polite" />
                
                <!-- Calculator buttons arranged in a grid -->
                <div class="row">
                  <div class="col-3">
                    <asp:Button ID="btn7" runat="server" Text="7" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="7" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn8" runat="server" Text="8" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="8" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn9" runat="server" Text="9" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="9" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnDivide" runat="server" Text="/" CssClass="btn btn-warning btn-block" OnClick="OperatorButton_Click" aria-label="Divide" />
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-3">
                    <asp:Button ID="btn4" runat="server" Text="4" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="4" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn5" runat="server" Text="5" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="5" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn6" runat="server" Text="6" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="6" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnMultiply" runat="server" Text="*" CssClass="btn btn-warning btn-block" OnClick="OperatorButton_Click" aria-label="Multiply" />
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-3">
                    <asp:Button ID="btn1" runat="server" Text="1" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="1" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn2" runat="server" Text="2" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="2" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btn3" runat="server" Text="3" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="3" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnSubtract" runat="server" Text="-" CssClass="btn btn-warning btn-block" OnClick="OperatorButton_Click" aria-label="Subtract" />
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-3">
                    <asp:Button ID="btn0" runat="server" Text="0" CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="0" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnDecimal" runat="server" Text="." CssClass="btn btn-light btn-block" OnClick="DigitButton_Click" aria-label="Decimal" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnClear" runat="server" Text="C" CssClass="btn btn-danger btn-block" OnClick="btnClear_Click" aria-label="Clear" />
                  </div>
                  <div class="col-3">
                    <asp:Button ID="btnAdd" runat="server" Text="+" CssClass="btn btn-warning btn-block" OnClick="OperatorButton_Click" aria-label="Add" />
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <asp:Button ID="btnEquals" runat="server" Text="=" CssClass="btn btn-success btn-block" OnClick="btnEquals_Click" aria-label="Equals" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
