;;
;;
;; CHANGE THE FREQUENCY OF LOADING THIS SCHEME FILE
;; (ti-menu-load-string  "/solve/execute-commands add-edit control-run-time 10 \"iteration\"  \"/file/read-macros controlruntime.scm\"  ")
;; (ti-menu-load-string  "/solve/execute-commands add-edit control-run-time 10 \"time-step\"  \"/file/read-macros controlruntime.scm\"  ")
;;
;; (ti-menu-load-string "/solve/execute-commands/enable door-open ")
;; (ti-menu-load-string "/solve/execute-commands/enable door-close ")
;;
;; (ti-menu-load-string  "/solve/execute-commands add-edit control-run-time 1 \"time-step\" , ")
;;
;; (ti-menu-load-string  "/solve/execute-commands add-edit door-open 1 \"time-step\"  ,  ")
;; (ti-menu-load-string  "/solve/execute-commands add-edit door-close 1 \"time-step\"  ,  ")
;; 
;; (ti-menu-load-string  "/file/auto-save/data-frequency 200")
;;
;; LOAD CASE FILE
;; (ti-menu-load-string  "/file/read-case OR-COR-TINLET-3.cas.gz")
;;
;;
;; WRITE DAT FILE
;; (ti-menu-load-string  "/file/write-data  ./temp.dat.gz ok")
;;
;;
;; (ti-menu-load-string "/solve/set/pseudo-transient , , , 2 1")
;;
;; (ti-menu-load-string "/define/boundary-conditions/velocity-inlet cor_inlet , , , , , , , , , , , , , 297.15 , , , , , , ,")
;;
;; (ti-menu-load-string "/define/boundary-conditions outlet-vent or_outlet , , -95 , , , , , , , , , , , , , , , , , 100")
;; (ti-menu-load-string "/define/boundary-conditions outlet-vent or_outlet , , 3.59 , , , , , , , , , , , , , 0")
;;
;; (ti-menu-load-string "/define/boundary-conditions pressure-outlet cor_outlet , , -0.05 , 297.15 , , , , , , , , , , , , , ")
;;
;;
;;
;; (ti-menu-load-string "solve/set/under-relaxation pressure 0.5 mom 0.3 temperature 1  k 0.5  epsilon 0.5")
;;
;; (ti-menu-load-string "file/auto-save/data-frequency 1000")
;; (ti-menu-load-string "file/auto-save/case-frequency if-case-is-modified")
;;
;; (ti-menu-load-string "/define/boundary-conditions/modify-zones/zone-type xdoor-d01  porous-jump")
;; 
;;
;; (ti-menu-load-string "/define/boundary-conditions porous-jump , , , 50 , , ")
;; (ti-menu-load-string "/define/boundary-conditions pressure_outlet or_outlet , , 5 , , , , , , , , , , , , , , , , , , ")
;;
;; (ti-menu-load-string "/solve/monitors/residual/convergence-criteria 1e-4 , , , , , , , , , , , , , " )
;;
;; (ti-menu-load-string "/define/models/dpm/unsteady-tracking yes no 0.2 yes  ")
;;
