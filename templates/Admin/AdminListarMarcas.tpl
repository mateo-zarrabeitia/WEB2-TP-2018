<div class="wrapper">
<h2>Marcas</h2>
  {foreach from=$marcas item=marca}
      <ul class="list-group">
            <li class="list-group-item">
                  <strong>Nombre:</strong> {$marca['nombre']}
                  <strong>Descripcion:</strong> {$marca['descripcion']}
              <a href="borrarMarca/{$marca['marca']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            </li>
      </ul>
  {/foreach}
  </div>
