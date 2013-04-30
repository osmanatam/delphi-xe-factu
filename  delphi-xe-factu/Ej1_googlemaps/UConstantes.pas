{ Ejemplo de utilización de Google Maps en Delphi.
  by  Neftalí  -Germán Estévez-  2009
  http://neftali.clubdelphi.com

  NOTA: Este ejemplo y su código es de libre distribución. Si te es de utilidad,
  tienes sugerencias, comentarios o errores puedes escribirlos en mi web.
  Todos ellos serán bienvenidos.  ;-D
  http://neftali.clubdelphi.com

  NOTE: This sampole and its code is freely distributed. If you are useful,
   have suggestions, comments or errors can post it to my website.
   All of them are welcome. ;-D
   http://neftali.clubdelphi.com
}
unit UConstantes;

interface

uses
  Messages;

// Errores
const
  EMAP_MSG_ERRORGETRES = 'Error no se encuentra el recurso.';


const
  CM_AFTERSHOW = WM_USER + 7841;

// varios
const
  FILENAME_LUGARES = 'Lugares.txt';

// constantes relacionadas con mapas HTML
const
  CHAR_SPACE = ' ';
  STR_EMPTY = '';
  CHAR_PLUS = '+';
  CHAR_CRLF = #13#10;
  RES_HTML_PAGEMAP  = 'RES_HTML_PAGEMAP';
  G_NORMAL_MAP      = 'G_NORMAL_MAP';
  G_SATELLITE_MAP   = 'G_SATELLITE_MAP';
  G_HYBRID_MAP      = 'G_HYBRID_MAP';

// elementos y controles del mapa
const
  MAP_LARGE_CONTROL = 'GLargeMapControl';
  MAP_SMALL_ZOOM    = 'GSmallZoomControl';
  MAP_TYPE_CONTROL  = 'GMapTypeControl';  

// Constantes para consultas
const
  G_GEO_SUCCESS             = 'G_GEO_SUCCESS';
  G_GEO_BAD_REQUEST         = 'G_GEO_BAD_REQUEST';
  G_GEO_SERVER_ERROR        = 'G_GEO_SERVER_ERROR';
  G_GEO_MISSING_QUERY       = 'G_GEO_MISSING_QUERY';
  G_GEO_MISSING_ADDRESS     = 'G_GEO_MISSING_ADDRESS';
  G_GEO_UNKNOWN_ADDRESS     = 'G_GEO_UNKNOWN_ADDRESS';
  G_GEO_UNAVAILABLE_ADDRESS = 'G_GEO_UNAVAILABLE_ADDRES';
  G_GEO_UNKNOWN_DIRECTIONS  = 'G_GEO_UNKNOWN_DIRECTIONS';
  G_GEO_BAD_KEY             = 'G_GEO_BAD_KEY';
  G_GEO_TOO_MANY_QUERIES    = 'G_GEO_TOO_MANY_QUERIES';
  G_GEO_UNKNOW_CODE         = 'unknow code';

// constantes de precision
const
  STR_PREC_0 = 'Ubicación desconocida.';
  STR_PREC_1 = 'Precisión a nivel de país.';
  STR_PREC_2 = 'Precisión a nivel de región';
  STR_PREC_3 = 'Precisión a nivel de subregión';
  STR_PREC_4 = 'Precisión a nivel de ciudad o pueblo.';
  STR_PREC_5 = 'Precisión a nivel de código postal.';
  STR_PREC_6 = 'Precisión a nivel de calle.';
  STR_PREC_7 = 'Precisión a nivel de intersección.';
  STR_PREC_8 = 'Precisión a nivel de dirección.';
  STR_PREC_9 = 'Precisión a nivel de edificio.';
  G_PREC_UNKNOW_CODE = 'unknow code';

implementation

end.
