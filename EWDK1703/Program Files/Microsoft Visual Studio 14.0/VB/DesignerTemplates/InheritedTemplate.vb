Imports System.Drawing
Imports System.Data
Imports System.Windows.Forms
Imports [!output BASE_NAMESPACE]


Public Class [!output SAFE_ITEM_NAME]
    Inherits [!output BASE_FULL_NAME]
    
    Public Sub New()
        MyBase.New()
        
        'This call is required by the Windows Form Designer.
        InitializeComponent()
        
        'TODO: Add any initialization after the InitializeComponent call
    End Sub
    
    'Form overrides dispose to clean up the component list.
    Public Overrides Sub Dispose()
        MyBase.Dispose()
        If Not (components Is Nothing) Then
            components.Dispose()
        End If
    End Sub
    
#Region " Windows Form Designer generated code "
    
    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    
    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        components = New System.ComponentModel.Container()
    End Sub
    
#End Region
    
End Class
