SELECT  WFS_CdiWorkArea, WFS_CdiWorkAreaFilho, WFO_CdiWorkAreaFilhoObjeto, WFO_D1sWorkAreaFilhoObjeto, WFO_CdiWorkAreaFilho, WFO_CdiObjeto, OBJ_D1sObjeto,
WFO_CosParametro
FROM WorkAreasFilhos
INNER JOIN WorkAreasFilhosObjetos ON (WFS_CdiWorkAreaFilho = WFO_CdiWorkAreaFilho)
INNER JOIN Objetos on (WFO_CdiObjeto = OBJ_CdiObjeto)
WHERE WFS_CdiWorkAreaFilho = 10275

delete from WorkAreasFilhosObjetos
where WFO_CdiObjeto = 2101
AND WFO_CdiWorkAreaFilhoObjeto > 121730