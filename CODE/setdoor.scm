; SET DOOR FROM INTERIOR TYPE TO INTERIOR TYPE
(do ((x 42 (+ x 1))) ((> x 50))
    (ti-menu-load-string
         (format #f "/define/boundary-conditions/modify-zones/zone-type xdoor-d~02d interior" x)
    ) 
)
