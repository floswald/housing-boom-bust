!
!   FnVFFRetJ.f90
!   
!   Created by Kurt Mitman on 10/10/14.
!
!

DOUBLE PRECISION FUNCTION FnVFFRetJ(bsav)

USE Params
USE Globals
USE funcs
USE Procedures

IMPLICIT NONE

DOUBLE PRECISION, INTENT(IN) :: bsav
DOUBLE PRECISION             :: cons
DOUBLE PRECISION             :: vals(2)
INTEGER                      :: inds(2)




cons=gliq-FnQb(bsav,0.0d0)*bsav

if(cons .GT. cmin) then

    FnVFFRetJ = -1.0d0*(urent(cons,GridHR(1),gij)-xi+ubequest(bsav))

!    call basefun(GridB,nb,bsav,vals,inds)
!    FnVFFRetJ = -1.0d0*(uown(cons,GridHR(1),gij)-xi+vals(1)*ubequest(GridB(inds(1)))+vals(2)*ubequest(GridB(inds(2))))
else

FnVFFRetJ = 1.0d10+10.0d0*(cmin-cons)

endif


END FUNCTION FnVFFRetJ
