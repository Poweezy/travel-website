# Create favicon files
$favicon16 = 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAGlJREFUOE+tk8sNwjAQRC0QJaSDklIH6YAO6IAO6IAOSAdJB3QwGm9mn19ezA9Ze+PZd2YD4Y8RQuB5HjOLpGnKzs7OQim1bJqmabLb7Xav13t9vV7H8XjM6/X6OHv72p0gCK5SyoeU8gEAAPADXAsqhpRhCQAAAABJRU5ErkJggg=='
$favicon32 = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAOZJREFUWEfFlksOwjAMRDsJFwEp4hi0F+QCLNhwBPZsOAd7TsKKBUegrxetZOzEaVLJy3kmdvyTqAz6Q/zAhg8fPnz48OHDx3+Cm5n5fW8+m4+Z2+0ybDYbr9frdblcRlEUxW63G9I0DYVC5XLJt3SiKCqVSsViMaytraXq6ur8/f39fX192tn+7u7u9vb2fL7furu7i4qKDAaDXq93OBxmsxn/L97e3hYXF9fW1mKxmFarxePxOp0ulUqR3+9HqVRKpVJJpVLpdDrxeLxarRav16vT6Qg2BkNYrVZ8FovFbBSiooRCYRKJRKvVYjQasVgsRCKRXq+3WCw4HA7/+PH3AFEfXm0PxCsAAAAASUVORK5CYII='
$appleIcon = 'iVBORw0KGgoAAAANSUhEUgAAALQAAAC0CAYAAAA9zQYyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOxAAADsQBlSsOGwAABJ5JREFUVO7d28sNwjAMhuE2jAJMwgSMwiRMwiRMwShMwgSMwitPGodcWrfJ/0gW97Lp178lbz0M+vPTVa31Nb7H93S/3YdlWV7runYZY4wxpmmaL+M7xrfGN43v+z6n0+l0vV6f1+s1Go0Gx+PxZbPZ8vf39/b2tv39/QXX19fX5eXl7Xb7fp7P5/v5fN7v9/v/n8+nX9fX19fl5eXt7e39/f0C6/V6vV6v+/3+/Hw+P1+vV7PZbDabzWazWS9WazWbzWazWS9Wq9VqtVqtVqvVajWbzWaz+X6d3pNJJKrOZ8f79/3D0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0ND/AvdMNu9r8/vP39DQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ'

$bytes16 = [System.Convert]::FromBase64String($favicon16)
$bytes32 = [System.Convert]::FromBase64String($favicon32)

[System.IO.File]::WriteAllBytes('favicon-16x16.png', $bytes16)
[System.IO.File]::WriteAllBytes('favicon-32x32.png', $bytes32)

Write-Host "Favicon files created successfully"
