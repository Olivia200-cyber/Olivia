Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.WindowState = 'Maximized'
$form.FormBorderStyle = 'None'
$form.TopMost = $true
$form.BackColor = 'Black'

$label = New-Object Windows.Forms.Label
$label.Text = "Votre session a été suspendue pour maintenance.`nElle reprendra dans 2 minutes..."
$label.ForeColor = 'White'
$label.Font = New-Object Drawing.Font("Arial",24,[Drawing.FontStyle]::Bold)
$label.AutoSize = $true
$label.BackColor = 'Black'
$label.Location = New-Object Drawing.Point(400,300)

$form.Controls.Add($label)

$timer = New-Object Timers.Timer
$timer.Interval = 120000  # 2 minutes en ms
$timer.AutoReset = $false
$timer.add_Elapsed({ $form.Close() })

$timer.Start()
[void]$form.ShowDialog()
