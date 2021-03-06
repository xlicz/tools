C $Header: /u/gcmpack/MITgcm/utils/exch2/code-mods/s6t_32x32/w2_e2setup.F,v 1.2 2008/07/29 19:37:49 jmc Exp $
C $Name:  $

C      *** THIS FILE IS AUTOMATICALLY GENERATED ***
       SUBROUTINE W2_E2SETUP

C      Tile toplogy settings data structures
#include "W2_EXCH2_TOPOLOGY.h"

C      Tile settings table
       CALL W2_E2SETUP_1
       CALL W2_E2SETUP_2
       CALL W2_E2SETUP_3
       CALL W2_E2SETUP_4
       CALL W2_E2SETUP_5
       CALL W2_E2SETUP_6
       RETURN
       END

       SUBROUTINE W2_E2SETUP_1
C      Topology for tile 1
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(1)=32
       exch2_tNy(1)=32
       exch2_tBasex(1)=0
       exch2_tBasey(1)=0
       exch2_txGlobalo(1)=1
       exch2_tyGlobalo(1)=1
       exch2_isWedge(1)=1
       exch2_isNedge(1)=1
       exch2_isEedge(1)=1
       exch2_isSedge(1)=1
       exch2_myFace(1)=1
       exch2_mydNx(1)=32
       exch2_mydNy(1)=32
       exch2_nNeighbours(1)=4

       exch2_neighbourId(1,1)=3
       exch2_iLo(1,1)=0
       exch2_iHi(1,1)=33
       exch2_jLo(1,1)=33
       exch2_jHi(1,1)=33
       exch2_opposingSend(1,1)=4
       exch2_pij(1,1,1)=0
       exch2_pij(2,1,1)=-1
       exch2_pij(3,1,1)=1
       exch2_pij(4,1,1)=0
       exch2_oi(1,1)=33
       exch2_oj(1,1)=32

       exch2_neighbourId(2,1)=6
       exch2_iLo(2,1)=0
       exch2_iHi(2,1)=33
       exch2_jLo(2,1)=0
       exch2_jHi(2,1)=0
       exch2_opposingSend(2,1)=1
       exch2_pij(1,2,1)=1
       exch2_pij(2,2,1)=0
       exch2_pij(3,2,1)=0
       exch2_pij(4,2,1)=1
       exch2_oi(2,1)=0
       exch2_oj(2,1)=-32

       exch2_neighbourId(3,1)=2
       exch2_iLo(3,1)=33
       exch2_iHi(3,1)=33
       exch2_jLo(3,1)=0
       exch2_jHi(3,1)=33
       exch2_opposingSend(3,1)=4
       exch2_pij(1,3,1)=1
       exch2_pij(2,3,1)=0
       exch2_pij(3,3,1)=0
       exch2_pij(4,3,1)=1
       exch2_oi(3,1)=32
       exch2_oj(3,1)=0

       exch2_neighbourId(4,1)=5
       exch2_iLo(4,1)=0
       exch2_iHi(4,1)=0
       exch2_jLo(4,1)=0
       exch2_jHi(4,1)=33
       exch2_opposingSend(4,1)=1
       exch2_pij(1,4,1)=0
       exch2_pij(2,4,1)=1
       exch2_pij(3,4,1)=-1
       exch2_pij(4,4,1)=0
       exch2_oi(4,1)=-32
       exch2_oj(4,1)=33
       RETURN
       END

       SUBROUTINE W2_E2SETUP_2
C      Topology for tile 2
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(2)=32
       exch2_tNy(2)=32
       exch2_tBasex(2)=0
       exch2_tBasey(2)=0
       exch2_txGlobalo(2)=33
       exch2_tyGlobalo(2)=1
       exch2_isWedge(2)=1
       exch2_isNedge(2)=1
       exch2_isEedge(2)=1
       exch2_isSedge(2)=1
       exch2_myFace(2)=2
       exch2_mydNx(2)=32
       exch2_mydNy(2)=32
       exch2_nNeighbours(2)=4

       exch2_neighbourId(1,2)=3
       exch2_iLo(1,2)=0
       exch2_iHi(1,2)=33
       exch2_jLo(1,2)=33
       exch2_jHi(1,2)=33
       exch2_opposingSend(1,2)=2
       exch2_pij(1,1,2)=1
       exch2_pij(2,1,2)=0
       exch2_pij(3,1,2)=0
       exch2_pij(4,1,2)=1
       exch2_oi(1,2)=0
       exch2_oj(1,2)=32

       exch2_neighbourId(2,2)=6
       exch2_iLo(2,2)=0
       exch2_iHi(2,2)=33
       exch2_jLo(2,2)=0
       exch2_jHi(2,2)=0
       exch2_opposingSend(2,2)=3
       exch2_pij(1,2,2)=0
       exch2_pij(2,2,2)=-1
       exch2_pij(3,2,2)=1
       exch2_pij(4,2,2)=0
       exch2_oi(2,2)=33
       exch2_oj(2,2)=-32

       exch2_neighbourId(3,2)=4
       exch2_iLo(3,2)=33
       exch2_iHi(3,2)=33
       exch2_jLo(3,2)=0
       exch2_jHi(3,2)=33
       exch2_opposingSend(3,2)=2
       exch2_pij(1,3,2)=0
       exch2_pij(2,3,2)=1
       exch2_pij(3,3,2)=-1
       exch2_pij(4,3,2)=0
       exch2_oi(3,2)=32
       exch2_oj(3,2)=33

       exch2_neighbourId(4,2)=1
       exch2_iLo(4,2)=0
       exch2_iHi(4,2)=0
       exch2_jLo(4,2)=0
       exch2_jHi(4,2)=33
       exch2_opposingSend(4,2)=3
       exch2_pij(1,4,2)=1
       exch2_pij(2,4,2)=0
       exch2_pij(3,4,2)=0
       exch2_pij(4,4,2)=1
       exch2_oi(4,2)=-32
       exch2_oj(4,2)=0
       RETURN
       END

       SUBROUTINE W2_E2SETUP_3
C      Topology for tile 3
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(3)=32
       exch2_tNy(3)=32
       exch2_tBasex(3)=0
       exch2_tBasey(3)=0
       exch2_txGlobalo(3)=65
       exch2_tyGlobalo(3)=1
       exch2_isWedge(3)=1
       exch2_isNedge(3)=1
       exch2_isEedge(3)=1
       exch2_isSedge(3)=1
       exch2_myFace(3)=3
       exch2_mydNx(3)=32
       exch2_mydNy(3)=32
       exch2_nNeighbours(3)=4

       exch2_neighbourId(1,3)=5
       exch2_iLo(1,3)=0
       exch2_iHi(1,3)=33
       exch2_jLo(1,3)=33
       exch2_jHi(1,3)=33
       exch2_opposingSend(1,3)=4
       exch2_pij(1,1,3)=0
       exch2_pij(2,1,3)=-1
       exch2_pij(3,1,3)=1
       exch2_pij(4,1,3)=0
       exch2_oi(1,3)=33
       exch2_oj(1,3)=32

       exch2_neighbourId(2,3)=2
       exch2_iLo(2,3)=0
       exch2_iHi(2,3)=33
       exch2_jLo(2,3)=0
       exch2_jHi(2,3)=0
       exch2_opposingSend(2,3)=1
       exch2_pij(1,2,3)=1
       exch2_pij(2,2,3)=0
       exch2_pij(3,2,3)=0
       exch2_pij(4,2,3)=1
       exch2_oi(2,3)=0
       exch2_oj(2,3)=-32

       exch2_neighbourId(3,3)=4
       exch2_iLo(3,3)=33
       exch2_iHi(3,3)=33
       exch2_jLo(3,3)=0
       exch2_jHi(3,3)=33
       exch2_opposingSend(3,3)=4
       exch2_pij(1,3,3)=1
       exch2_pij(2,3,3)=0
       exch2_pij(3,3,3)=0
       exch2_pij(4,3,3)=1
       exch2_oi(3,3)=32
       exch2_oj(3,3)=0

       exch2_neighbourId(4,3)=1
       exch2_iLo(4,3)=0
       exch2_iHi(4,3)=0
       exch2_jLo(4,3)=0
       exch2_jHi(4,3)=33
       exch2_opposingSend(4,3)=1
       exch2_pij(1,4,3)=0
       exch2_pij(2,4,3)=1
       exch2_pij(3,4,3)=-1
       exch2_pij(4,4,3)=0
       exch2_oi(4,3)=-32
       exch2_oj(4,3)=33
       RETURN
       END

       SUBROUTINE W2_E2SETUP_4
C      Topology for tile 4
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(4)=32
       exch2_tNy(4)=32
       exch2_tBasex(4)=0
       exch2_tBasey(4)=0
       exch2_txGlobalo(4)=97
       exch2_tyGlobalo(4)=1
       exch2_isWedge(4)=1
       exch2_isNedge(4)=1
       exch2_isEedge(4)=1
       exch2_isSedge(4)=1
       exch2_myFace(4)=4
       exch2_mydNx(4)=32
       exch2_mydNy(4)=32
       exch2_nNeighbours(4)=4

       exch2_neighbourId(1,4)=5
       exch2_iLo(1,4)=0
       exch2_iHi(1,4)=33
       exch2_jLo(1,4)=33
       exch2_jHi(1,4)=33
       exch2_opposingSend(1,4)=2
       exch2_pij(1,1,4)=1
       exch2_pij(2,1,4)=0
       exch2_pij(3,1,4)=0
       exch2_pij(4,1,4)=1
       exch2_oi(1,4)=0
       exch2_oj(1,4)=32

       exch2_neighbourId(2,4)=2
       exch2_iLo(2,4)=0
       exch2_iHi(2,4)=33
       exch2_jLo(2,4)=0
       exch2_jHi(2,4)=0
       exch2_opposingSend(2,4)=3
       exch2_pij(1,2,4)=0
       exch2_pij(2,2,4)=-1
       exch2_pij(3,2,4)=1
       exch2_pij(4,2,4)=0
       exch2_oi(2,4)=33
       exch2_oj(2,4)=-32

       exch2_neighbourId(3,4)=6
       exch2_iLo(3,4)=33
       exch2_iHi(3,4)=33
       exch2_jLo(3,4)=0
       exch2_jHi(3,4)=33
       exch2_opposingSend(3,4)=2
       exch2_pij(1,3,4)=0
       exch2_pij(2,3,4)=1
       exch2_pij(3,3,4)=-1
       exch2_pij(4,3,4)=0
       exch2_oi(3,4)=32
       exch2_oj(3,4)=33

       exch2_neighbourId(4,4)=3
       exch2_iLo(4,4)=0
       exch2_iHi(4,4)=0
       exch2_jLo(4,4)=0
       exch2_jHi(4,4)=33
       exch2_opposingSend(4,4)=3
       exch2_pij(1,4,4)=1
       exch2_pij(2,4,4)=0
       exch2_pij(3,4,4)=0
       exch2_pij(4,4,4)=1
       exch2_oi(4,4)=-32
       exch2_oj(4,4)=0
       RETURN
       END

       SUBROUTINE W2_E2SETUP_5
C      Topology for tile 5
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(5)=32
       exch2_tNy(5)=32
       exch2_tBasex(5)=0
       exch2_tBasey(5)=0
       exch2_txGlobalo(5)=129
       exch2_tyGlobalo(5)=1
       exch2_isWedge(5)=1
       exch2_isNedge(5)=1
       exch2_isEedge(5)=1
       exch2_isSedge(5)=1
       exch2_myFace(5)=5
       exch2_mydNx(5)=32
       exch2_mydNy(5)=32
       exch2_nNeighbours(5)=4

       exch2_neighbourId(1,5)=1
       exch2_iLo(1,5)=0
       exch2_iHi(1,5)=33
       exch2_jLo(1,5)=33
       exch2_jHi(1,5)=33
       exch2_opposingSend(1,5)=4
       exch2_pij(1,1,5)=0
       exch2_pij(2,1,5)=-1
       exch2_pij(3,1,5)=1
       exch2_pij(4,1,5)=0
       exch2_oi(1,5)=33
       exch2_oj(1,5)=32

       exch2_neighbourId(2,5)=4
       exch2_iLo(2,5)=0
       exch2_iHi(2,5)=33
       exch2_jLo(2,5)=0
       exch2_jHi(2,5)=0
       exch2_opposingSend(2,5)=1
       exch2_pij(1,2,5)=1
       exch2_pij(2,2,5)=0
       exch2_pij(3,2,5)=0
       exch2_pij(4,2,5)=1
       exch2_oi(2,5)=0
       exch2_oj(2,5)=-32

       exch2_neighbourId(3,5)=6
       exch2_iLo(3,5)=33
       exch2_iHi(3,5)=33
       exch2_jLo(3,5)=0
       exch2_jHi(3,5)=33
       exch2_opposingSend(3,5)=4
       exch2_pij(1,3,5)=1
       exch2_pij(2,3,5)=0
       exch2_pij(3,3,5)=0
       exch2_pij(4,3,5)=1
       exch2_oi(3,5)=32
       exch2_oj(3,5)=0

       exch2_neighbourId(4,5)=3
       exch2_iLo(4,5)=0
       exch2_iHi(4,5)=0
       exch2_jLo(4,5)=0
       exch2_jHi(4,5)=33
       exch2_opposingSend(4,5)=1
       exch2_pij(1,4,5)=0
       exch2_pij(2,4,5)=1
       exch2_pij(3,4,5)=-1
       exch2_pij(4,4,5)=0
       exch2_oi(4,5)=-32
       exch2_oj(4,5)=33
       RETURN
       END

       SUBROUTINE W2_E2SETUP_6
C      Topology for tile 6
#include "W2_EXCH2_TOPOLOGY.h"
       exch2_tNx(6)=32
       exch2_tNy(6)=32
       exch2_tBasex(6)=0
       exch2_tBasey(6)=0
       exch2_txGlobalo(6)=161
       exch2_tyGlobalo(6)=1
       exch2_isWedge(6)=1
       exch2_isNedge(6)=1
       exch2_isEedge(6)=1
       exch2_isSedge(6)=1
       exch2_myFace(6)=6
       exch2_mydNx(6)=32
       exch2_mydNy(6)=32
       exch2_nNeighbours(6)=4

       exch2_neighbourId(1,6)=1
       exch2_iLo(1,6)=0
       exch2_iHi(1,6)=33
       exch2_jLo(1,6)=33
       exch2_jHi(1,6)=33
       exch2_opposingSend(1,6)=2
       exch2_pij(1,1,6)=1
       exch2_pij(2,1,6)=0
       exch2_pij(3,1,6)=0
       exch2_pij(4,1,6)=1
       exch2_oi(1,6)=0
       exch2_oj(1,6)=32

       exch2_neighbourId(2,6)=4
       exch2_iLo(2,6)=0
       exch2_iHi(2,6)=33
       exch2_jLo(2,6)=0
       exch2_jHi(2,6)=0
       exch2_opposingSend(2,6)=3
       exch2_pij(1,2,6)=0
       exch2_pij(2,2,6)=-1
       exch2_pij(3,2,6)=1
       exch2_pij(4,2,6)=0
       exch2_oi(2,6)=33
       exch2_oj(2,6)=-32

       exch2_neighbourId(3,6)=2
       exch2_iLo(3,6)=33
       exch2_iHi(3,6)=33
       exch2_jLo(3,6)=0
       exch2_jHi(3,6)=33
       exch2_opposingSend(3,6)=2
       exch2_pij(1,3,6)=0
       exch2_pij(2,3,6)=1
       exch2_pij(3,3,6)=-1
       exch2_pij(4,3,6)=0
       exch2_oi(3,6)=32
       exch2_oj(3,6)=33

       exch2_neighbourId(4,6)=5
       exch2_iLo(4,6)=0
       exch2_iHi(4,6)=0
       exch2_jLo(4,6)=0
       exch2_jHi(4,6)=33
       exch2_opposingSend(4,6)=3
       exch2_pij(1,4,6)=1
       exch2_pij(2,4,6)=0
       exch2_pij(3,4,6)=0
       exch2_pij(4,4,6)=1
       exch2_oi(4,6)=-32
       exch2_oj(4,6)=0
       RETURN
       END

