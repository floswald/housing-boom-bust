!
!   FnVFN.f90
!
!
!   Created by Kurt Mitman on 10/10/14.
!
!

DOUBLE PRECISION FUNCTION FnVFN(bsav)

USE Params
USE Globals
USE funcs
USE Procedures

IMPLICIT NONE

DOUBLE PRECISION, INTENT(IN) :: bsav
DOUBLE PRECISION             :: cons,qltemp,qltemp2
DOUBLE PRECISION             :: vals(2)
INTEGER                      :: inds(2)



call basefun(GridB,nb,bsav,vals,inds)

! call BiLinInterp1(nb,GridB,ngpPh,PhGrid,ql(:,gil,ginds(1),gih,giExo,:,gij+1),bsav,gPh,qltemp)
! call BiLinInterp1(nb,GridB,ngpPh,PhGrid,ql(:,gil,ginds(2),gih,giExo,:,gij+1),bsav,gPh,qltemp2)
qltemp=0.0d0
qltemp2=0.0d0

cons=gliq+(gvals(1)*qltemp+gvals(2)*qltemp2)*gloc*ghouse-FnQb(bsav,gPh*ghouse-gmort)*bsav


if(cons .GT. cmin) then

FnVFN = -1.0d0*(uown(cons,ghouse,gij)+bet*(vals(1)*sum(gvals*EVown(inds(1),gil,ginds,gih,gij))+vals(2)*sum(gvals*EVown(inds(2),gil,ginds,gih,gij))))

else

FnVFN = 1.0d10+10.0d0*(cmin-cons)

endif


END FUNCTION FnVFN
