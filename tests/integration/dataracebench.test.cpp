/* Copyright 2021 Coderrect Inc. All Rights Reserved.
Licensed under the GNU Affero General Public License, version 3 or later (“AGPL”), as published by the Free Software
Foundation. You may not use this file except in compliance with the License. You may obtain a copy of the License at
https://www.gnu.org/licenses/agpl-3.0.en.html
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include <catch2/catch.hpp>

#include "helpers/ReportChecking.h"

TEST_CASE("dataracebench", "[integration][dataracebench][omp]") {
  std::vector<Oracle> oracles = {
      Oracle("DRB001-antidep1-orig-yes.ll", {"DRB001-antidep1-orig-yes.c:58:10 DRB001-antidep1-orig-yes.c:58:12"}),
      Oracle("DRB002-antidep1-var-yes.ll", {"DRB002-antidep1-var-yes.c:67:9 DRB002-antidep1-var-yes.c:67:10"}),
      Oracle("DRB003-antidep2-orig-yes.ll", {"DRB003-antidep2-orig-yes.c:67:15 DRB003-antidep2-orig-yes.c:67:18"}),
      Oracle("DRB004-antidep2-var-yes.ll", {"DRB004-antidep2-var-yes.c:70:15 DRB004-antidep2-var-yes.c:70:18"}),
      // DRB 5-8 are indirect array access
      Oracle("DRB009-lastprivatemissing-orig-yes.ll",
             {"DRB009-lastprivatemissing-orig-yes.c:59:6 DRB009-lastprivatemissing-orig-yes.c:59:6"}),
      Oracle("DRB010-lastprivatemissing-var-yes.ll",
             {"DRB010-lastprivatemissing-var-yes.c:63:6 DRB010-lastprivatemissing-var-yes.c:63:6"}),
      Oracle("DRB011-minusminus-orig-yes.ll",
             {
                 "DRB011-minusminus-orig-yes.c:74:16 DRB011-minusminus-orig-yes.c:74:16",  // read-write
                 "DRB011-minusminus-orig-yes.c:74:16 DRB011-minusminus-orig-yes.c:74:16"   // write-write
             }),
      Oracle("DRB012-minusminus-var-yes.ll",
             {
                 "DRB012-minusminus-var-yes.c:74:16 DRB012-minusminus-var-yes.c:74:16",  // read-write
                 "DRB012-minusminus-var-yes.c:74:16 DRB012-minusminus-var-yes.c:74:16"   // write-write
             }),
      Oracle("DRB013-nowait-orig-yes.ll", {"DRB013-nowait-orig-yes.c:72:12 DRB013-nowait-orig-yes.c:75:13"}),
      Oracle("DRB014-outofbounds-orig-yes.ll",
             {"DRB014-outofbounds-orig-yes.c:75:14 DRB014-outofbounds-orig-yes.c:75:15"}),
      Oracle("DRB015-outofbounds-var-yes.ll",
             {"DRB015-outofbounds-var-yes.c:80:14 DRB015-outofbounds-var-yes.c:80:15"}),
      Oracle("DRB016-outputdep-orig-yes.ll", {"DRB016-outputdep-orig-yes.c:74:6 DRB016-outputdep-orig-yes.c:73:12",
                                              "DRB016-outputdep-orig-yes.c:74:6 DRB016-outputdep-orig-yes.c:74:6"}),
      Oracle("DRB017-outputdep-var-yes.ll", {"DRB017-outputdep-var-yes.c:72:6 DRB017-outputdep-var-yes.c:71:12",
                                             "DRB017-outputdep-var-yes.c:72:6 DRB017-outputdep-var-yes.c:72:6"}),
      // DRB 18 and 19 array index fails // misses the race on output
      // FIXME: the racy object is opted out by SROA
      //      Oracle("DRB020-privatemissing-var-yes.ll",
      //             {"DRB020-privatemissing-var-yes.c:65:9 DRB020-privatemissing-var-yes.c:65:9",
      //              "DRB020-privatemissing-var-yes.c:66:10 DRB020-privatemissing-var-yes.c:65:10"}),
      Oracle("DRB021-reductionmissing-orig-yes.ll",
             {"DRB021-reductionmissing-orig-yes.c:70:11 DRB021-reductionmissing-orig-yes.c:70:11",    // write-write
              "DRB021-reductionmissing-orig-yes.c:70:11 DRB021-reductionmissing-orig-yes.c:70:13"}),  // read-write
      Oracle("DRB022-reductionmissing-var-yes.ll",
             {"DRB022-reductionmissing-var-yes.c:72:11 DRB022-reductionmissing-var-yes.c:72:11",
              "DRB022-reductionmissing-var-yes.c:72:11 DRB022-reductionmissing-var-yes.c:72:13"}),
      Oracle("DRB023-sections1-orig-yes.ll", {"DRB023-sections1-orig-yes.c:58:7 DRB023-sections1-orig-yes.c:60:7",
                                              "DRB023-sections1-orig-yes.c:60:7 DRB023-sections1-orig-yes.c:58:7"}),
      // DRB 24 and 25 are simd
      Oracle("DRB026-targetparallelfor-orig-yes.ll",
             {"DRB026-targetparallelfor-orig-yes.c:64:9 DRB026-targetparallelfor-orig-yes.c:64:10"}),
      // DRB 27 is task
       Oracle("DRB027-taskdependmissing-orig-yes.ll",
             {"DRB027-taskdependmissing-orig-yes.c:61:7 DRB027-taskdependmissing-orig-yes.c:61:7",
              "DRB027-taskdependmissing-orig-yes.c:61:7 DRB027-taskdependmissing-orig-yes.c:63:7",
              "DRB027-taskdependmissing-orig-yes.c:63:7 DRB027-taskdependmissing-orig-yes.c:61:7",
              "DRB027-taskdependmissing-orig-yes.c:63:7 DRB027-taskdependmissing-orig-yes.c:63:7",
              "DRB027-taskdependmissing-orig-yes.c:63:7 DRB027-taskdependmissing-orig-yes.c:66:20"}),
      
      // FIXME: the racy object is opted out by SROA
      //      Oracle("DRB028-privatemissing-orig-yes.ll",
      //             {"DRB028-privatemissing-orig-yes.c:65:9 DRB028-privatemissing-orig-yes.c:65:9",
      //              "DRB028-privatemissing-orig-yes.c:66:10 DRB028-privatemissing-orig-yes.c:65:10"}),
      Oracle("DRB029-truedep1-orig-yes.ll", {"DRB029-truedep1-orig-yes.c:64:11 DRB029-truedep1-orig-yes.c:64:12"}),
      Oracle("DRB030-truedep1-var-yes.ll", {"DRB030-truedep1-var-yes.c:68:11 DRB030-truedep1-var-yes.c:68:12"}),
      Oracle("DRB031-truedepfirstdimension-orig-yes.ll",
             {"DRB031-truedepfirstdimension-orig-yes.c:66:14 DRB031-truedepfirstdimension-orig-yes.c:66:15"}),
      Oracle("DRB032-truedepfirstdimension-var-yes.ll",
             {"DRB032-truedepfirstdimension-var-yes.c:69:14 DRB032-truedepfirstdimension-var-yes.c:69:15"}),
      Oracle("DRB033-truedeplinear-orig-yes.ll",
             {"DRB033-truedeplinear-orig-yes.c:64:13 DRB033-truedeplinear-orig-yes.c:64:14"}),
      Oracle("DRB034-truedeplinear-var-yes.ll",
             {"DRB034-truedeplinear-var-yes.c:66:13 DRB034-truedeplinear-var-yes.c:66:14"}),
      Oracle("DRB035-truedepscalar-orig-yes.ll",
             {"DRB035-truedepscalar-orig-yes.c:67:9 DRB035-truedepscalar-orig-yes.c:66:12",
              "DRB035-truedepscalar-orig-yes.c:67:9 DRB035-truedepscalar-orig-yes.c:67:9"}),
      Oracle("DRB036-truedepscalar-var-yes.ll",
             {"DRB036-truedepscalar-var-yes.c:67:9 DRB036-truedepscalar-var-yes.c:66:12",
              "DRB036-truedepscalar-var-yes.c:67:9 DRB036-truedepscalar-var-yes.c:67:9"}),
      Oracle("DRB037-truedepseconddimension-orig-yes.ll",
             {"DRB037-truedepseconddimension-orig-yes.c:63:14 DRB037-truedepseconddimension-orig-yes.c:63:15"}),
      Oracle("DRB038-truedepseconddimension-var-yes.ll",
             {"DRB038-truedepseconddimension-var-yes.c:65:14 DRB038-truedepseconddimension-var-yes.c:65:15"}),
      Oracle("DRB039-truedepsingleelement-orig-yes.ll",
             {"DRB039-truedepsingleelement-orig-yes.c:62:9 DRB039-truedepsingleelement-orig-yes.c:62:15"}),
      Oracle("DRB040-truedepsingleelement-var-yes.ll",
             {"DRB040-truedepsingleelement-var-yes.c:63:9 DRB040-truedepsingleelement-var-yes.c:63:15"}),
      Oracle("DRB041-3mm-parallel-no.ll", {}),
      Oracle("DRB042-3mm-tile-no.ll", {}),  // uses simd, may need to check later
      Oracle("DRB043-adi-parallel-no.ll", {}),
      Oracle("DRB044-adi-tile-no.ll", {}),  // uses simd, may need to check later
      Oracle("DRB045-doall1-orig-no.ll", {}),
      Oracle("DRB046-doall2-orig-no.ll", {}),
      Oracle("DRB047-doallchar-orig-no.ll", {}),
      Oracle("DRB048-firstprivate-orig-no.ll", {}),
      Oracle("DRB049-fprintf-orig-no.ll", {}),
      Oracle("DRB050-functionparameter-orig-no.ll", {}),
      Oracle("DRB051-getthreadnum-orig-no.ll", {}),
      // 52 indirect array
      Oracle("DRB053-inneronly1-orig-no.ll", {}),  // multi-dimen array
      Oracle("DRB054-inneronly2-orig-no.ll", {}),  // multi-dimen array
      // 55-58 complex array access
      // 59 FP caused by last private??
      Oracle("DRB060-matrixmultiply-orig-no.ll", {}),
      Oracle("DRB061-matrixvector1-orig-no.ll", {}),
      Oracle("DRB062-matrixvector2-orig-no.ll", {}),
      Oracle("DRB063-outeronly1-orig-no.ll", {}),
      Oracle("DRB064-outeronly2-orig-no.ll", {}),
      Oracle("DRB065-pireduction-orig-no.ll", {}),
      Oracle("DRB066-pointernoaliasing-orig-no.ll", {}),
      Oracle("DRB067-restrictpointer1-orig-no.ll", {}),
      Oracle("DRB068-restrictpointer2-orig-no.ll", {}),
      Oracle("DRB069-sectionslock1-orig-no.ll", {}),
      // 70 simd
      Oracle("DRB071-targetparallelfor-orig-no.ll", {}),
      // 72 task
      // 73 Broken Debug Info
      // 74 critical and flush
      Oracle("DRB075-getthreadnum-orig-yes.ll",
             {"DRB075-getthreadnum-orig-yes.c:60:18 DRB075-getthreadnum-orig-yes.c:64:33"}),
      Oracle("DRB076-flush-orig-no.ll", {}),
      Oracle("DRB077-single-orig-no.ll", {}),
      // 78-79 task
      Oracle("DRB080-func-arg-orig-yes.ll",
             {"DRB080-func-arg-orig-yes.c:59:6 DRB080-func-arg-orig-yes.c:59:6",    // read-write
              "DRB080-func-arg-orig-yes.c:59:6 DRB080-func-arg-orig-yes.c:59:6"}),  // write-write
      Oracle("DRB081-func-arg-orig-no.ll", {}),
      Oracle("DRB082-declared-in-func-orig-yes.ll",
             {"DRB082-declared-in-func-orig-yes.c:57:5 DRB082-declared-in-func-orig-yes.c:57:5",    // read-write
              "DRB082-declared-in-func-orig-yes.c:57:5 DRB082-declared-in-func-orig-yes.c:57:5"}),  // write-write
      Oracle("DRB083-declared-in-func-orig-no.ll", {}),
      Oracle(
          "DRB084-threadprivatemissing-orig-yes.ll",
          {"DRB084-threadprivatemissing-orig-yes.c:61:7 DRB084-threadprivatemissing-orig-yes.c:61:7",    // write-write
           "DRB084-threadprivatemissing-orig-yes.c:61:7 DRB084-threadprivatemissing-orig-yes.c:61:8"}),  // read-write
      Oracle("DRB085-threadprivate-orig-no.ll", {}),
      Oracle("DRB086-static-data-member-orig-yes.ll",
             {"DRB086-static-data-member-orig-yes.cpp:72:13 DRB086-static-data-member-orig-yes.cpp:72:13",
              "DRB086-static-data-member-orig-yes.cpp:72:13 DRB086-static-data-member-orig-yes.cpp:72:13"}),
      Oracle("DRB087-static-data-member2-orig-yes.ll",
             {"DRB087-static-data-member2-orig-yes.cpp:74:13 DRB087-static-data-member2-orig-yes.cpp:74:13",
              "DRB087-static-data-member2-orig-yes.cpp:74:13 DRB087-static-data-member2-orig-yes.cpp:74:13"}),
      Oracle("DRB088-dynamic-storage-orig-yes.ll",
             {"DRB088-dynamic-storage-orig-yes.c:63:14 DRB088-dynamic-storage-orig-yes.c:63:14",
              "DRB088-dynamic-storage-orig-yes.c:63:14 DRB088-dynamic-storage-orig-yes.c:63:14"}),
      Oracle("DRB089-dynamic-storage2-orig-yes.ll",
             {"DRB089-dynamic-storage2-orig-yes.c:73:15 DRB089-dynamic-storage2-orig-yes.c:73:15",
              "DRB089-dynamic-storage2-orig-yes.c:73:15 DRB089-dynamic-storage2-orig-yes.c:73:15"}),
      // 90 missed read-write race
      Oracle("DRB091-threadprivate2-orig-no.ll", {}),
      Oracle(
          "DRB092-threadprivatemissing2-orig-yes.ll",
          {"DRB092-threadprivatemissing2-orig-yes.c:68:11 DRB092-threadprivatemissing2-orig-yes.c:68:11",  // write-write
           "DRB092-threadprivatemissing2-orig-yes.c:68:11 DRB092-threadprivatemissing2-orig-yes.c:68:12"}),  // read-write
      Oracle("DRB093-doall2-collapse-orig-no.ll", {}),
      // 94 ordered + depend sink
      // 95 taskloop
      // 96 collapse + taskloop + multi-dimen
      // 97 target teams+distribute
      // 98 simd + collpase
      Oracle("DRB099-targetparallelfor2-orig-no.ll", {}),
      // 100-101 task
      Oracle("DRB102-copyprivate-orig-no.ll", {}),
      Oracle("DRB103-master-orig-no.ll", {}),
      Oracle("DRB104-nowait-barrier-orig-no.ll", {}),
      // 105-107 task
      Oracle("DRB108-atomic-orig-no.ll", {}),
      Oracle("DRB109-orderedmissing-orig-yes.ll",
             {"DRB109-orderedmissing-orig-yes.c:56:6 DRB109-orderedmissing-orig-yes.c:56:6",
              "DRB109-orderedmissing-orig-yes.c:56:6 DRB109-orderedmissing-orig-yes.c:56:6"}),
      Oracle("DRB110-ordered-orig-no.ll", {}),
      Oracle("DRB111-linearmissing-orig-yes.ll",
             {
                 "DRB111-linearmissing-orig-yes.c:68:6 DRB111-linearmissing-orig-yes.c:67:7",  // read-write
                 "DRB111-linearmissing-orig-yes.c:68:6 DRB111-linearmissing-orig-yes.c:68:6",  // read-write
                 "DRB111-linearmissing-orig-yes.c:68:6 DRB111-linearmissing-orig-yes.c:68:6"   // write-write
             }),
      // 112 linear
      Oracle("DRB113-default-orig-no.ll", {}),
      // 114 omp if
      // 115 simd
      // 116 target teams
      // 117 task
      Oracle("DRB118-nestlock-orig-no.ll", {}),
      Oracle("DRB119-nestlock-orig-yes.ll", {"DRB119-nestlock-orig-yes.c:32:8 DRB119-nestlock-orig-yes.c:32:8",
                                             "DRB119-nestlock-orig-yes.c:32:8 DRB119-nestlock-orig-yes.c:32:8"}),
      Oracle("DRB120-barrier-orig-no.ll", {}),
      Oracle("DRB121-reduction-orig-no.ll", {}),
      // 122-123 task
      // 124 master // wont-fix, variable expunged by optimisation
      Oracle("DRB125-single-orig-no.ll", {}),
      // 126 // doesn't check thread counts
      // 127-136 task
      // 137-138 simd
      // 139 // nested parallel
      Oracle("DRB140-reduction-barrier-orig-yes.ll",
             {"DRB140-reduction-barrier-orig-yes.c:25:7 DRB140-reduction-barrier-orig-yes.c:27:31",
              "DRB140-reduction-barrier-orig-yes.c:25:7 DRB140-reduction-barrier-orig-yes.c:27:33",
              "DRB140-reduction-barrier-orig-yes.c:27:31 DRB140-reduction-barrier-orig-yes.c:25:7"}),
      Oracle("DRB141-reduction-barrier-orig-no.ll", {}),
      // 142-143 atomic details
      // 144-154 target teams distribute
      Oracle("DRB155-missingordered-orig-gpu-no.ll", {}),
      // 156-157 target teams distribute
      // 158 target task+depend
      Oracle("DRB159-nobarrier-orig-gpu-no.ll", {}),
      // 160-164 target teams distribute
      // 165-168 cannot be built
      // 169 multi-dimen array // Missed TP
      Oracle("DRB170-nestedloops-orig-no.ll", {}),
      // 171 threadprivate // crash
      Oracle("DRB172-critical2-orig-no.ll", {}),
  };

  checkOracles(oracles, "integration/dataracebench/");
}