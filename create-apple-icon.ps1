# Create Apple Touch Icon
$appleIconBase64 = 'iVBORw0KGgoAAAANSUhEUgAAALQAAAC0CAYAAAA9zQYyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOxAAADsQBlSsOGwAABJ5JREFUVO7d28sNwjAMhuE2jAJMwgSMwiRMwiRMwShMwgSMwitPGodcWrfJ/0gW97Lp178lbz0M+vPTVa31Nb7H93S/3YdlWV7runYZY4wxpmmaL+M7xrfGN43v+z6n0+l0vV6f1+s1Go0Gx+PxZbPZ8vf39/b2tv39/QXX19fX5eXl7Xb7fp7P5/v5fN7v9/v/n8+nX9fX19fl5eXt7e39/f0C6/V6vV6v+/3+/Hw+P1+vV7PZbDabzWazWS9WazWbzWaz+X6d3pNJJKrOZ8f79/3D0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ/AvdMNu9r8/vP39DQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ'

try {
    $bytes = [System.Convert]::FromBase64String($appleIconBase64)
    [System.IO.File]::WriteAllBytes('apple-touch-icon.png', $bytes)
    Write-Host "Apple touch icon created successfully"
} catch {
    Write-Host "Error creating apple touch icon: $_"
}
