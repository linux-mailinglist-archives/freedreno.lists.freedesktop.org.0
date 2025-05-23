Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E720AC2FFD
	for <lists+freedreno@lfdr.de>; Sat, 24 May 2025 16:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8F10E009;
	Sat, 24 May 2025 14:25:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D055810E7D8
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 13:06:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCtoYU009837
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=D2ZwAv3+/k8jq5bB/r8jN+
 Yh3nUziGncMv3EzvPlvAA=; b=PshbatdsvJ3uQjQ8BnuYeX81N/+IFW0dRTLdX4
 w5g6Dxn4NWdF4XqWbnxdlc/VHyirTbr/S3oyOIz7ywde21qp/YyPkzAYVdJHqj4+
 +mjHQlYodHPgljgsECGsNEvV3+9qrl/rQsAv2gH+SNpE0a+HYzxsKHMqJkPPk7WB
 0HMewcrb0W34cLzNsqLgNW/tdCkexABUbSnZvJB71XlMy7WqTZ2JRiqBEWspd8bq
 cIwngnleKUIwVcKBvQnlQrPOcitClg9xSjoUS9tqaOYyrFKVR0i3EAizIhHToE3B
 jUrvmuF7e4NNatwboAXN6J4ZE4p+ITESac/WQ8S5xDbyS/GQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb9xhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 13:06:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-310a3196132so2295402a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 06:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005583; x=1748610383;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2ZwAv3+/k8jq5bB/r8jN+Yh3nUziGncMv3EzvPlvAA=;
 b=Cn6W//lWUKdDXNRD1gQA6OWhvwegBUNJmpfYfh5s6WF4d/Yb6XzLDNlb/4a1DCQOvG
 LsHJ8732KFRinGGyIdU0eeupmT+5M4qQUSUs1BMc47Vgl5ZGeAvDYEsFdito2W2kdwGX
 nLLMQldkiKwO4mWCZgvrvSICj1vseMVqSVR0PBUUIPCu+oIZBhJkoAJa6HLAIBmPE95q
 doFXFBcosQqXZ34wiTGgj0CFjLlys80uTUD9TKkpwSVo9sibCj9xLvYWf2+DDBZ1AKrM
 w9LZeL00xn8SZUZVrzg9GNVAf77U56SJlenV7xqf+zBG4ff1xaJxnmsMrVKuDYRrnI/s
 WTqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+1kgp/YmY4iCaAuUAGijU0ZGNdmhM/Xm/bkPHCDFNXlOOaydI/B9PEZco9KgLCBPVggJQyR4VyZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz65sJfxEoKvEquaOwnNrCtQOKN0I3ULSQpdUlQZLkVafpUueTG
 L0yVxDCIl4grAa7h7LwYWnzQkSp2qX0uHFsOuVEu/qazCqMuai9fly6hc/lvF/LewbV3mH34t2l
 mmOitxUCYlxnic8Hfod9zJqiL4fdK50i66u5UAUksPLj/J1sC/9UjE9stOxV1ZLtyDvGWKeQ=
X-Gm-Gg: ASbGnctEdb9iGfbwGAj78G+o/RBxKTwKxlng3R7LQrJrsEAsc7AzBJ3ABUGIcnHBQ0g
 lQacxFQqO1su/ojxMaiZt+7IonzcGlY53gER5v3Ro8er0zMD+9qMqyEWR0Ue7kSOYBolIbb4OyM
 B+y8u8cwkEQSi8UlU3lKdMAeI54ETkbiDYTA0YmJgGNHw1zbKsseaKOFcmD3Br1pIU3s2z8iNPV
 Ni/xu2i79wpq4Is3b52k9KCqSAPwgVjaNiYKGCWEmcgP0d20L2mhosCoNrRdYAniYkRhfMKkiYv
 Npd6rv8tmYO673ejYlZF3QgkTyyAA0TJFO7uPoxlhFsLSU2MWNQ=
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id
 98e67ed59e1d1-310e972afd0mr4224642a91.22.1748005583128; 
 Fri, 23 May 2025 06:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdJsIyMKqkXweP/UYp5yhqH8qznBRczsJ+cQdN4PhNXmYJdgeETzFaBLjNJrPAKxxcvN1ZUQ==
X-Received: by 2002:a17:90b:1b03:b0:2ff:58e1:2bb4 with SMTP id
 98e67ed59e1d1-310e972afd0mr4224601a91.22.1748005582662; 
 Fri, 23 May 2025 06:06:22 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-310f1544d30sm816165a91.15.2025.05.23.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 06:06:22 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Fri, 23 May 2025 18:36:16 +0530
Subject: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMdyMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3aTMvKLUAt00i2QLw7REgxRjwxQloOKCotS0zAqwQdGxtbUAkV5
 3W1gAAAA=
X-Change-ID: 20250523-binrep-f8c81fa0d31d
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 3iEu6Nea5rldUabcRI7wxQXMM1gxiICi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExNiBTYWx0ZWRfX71+ormDeo33k
 EKNiUYfrwkGeZZr5GdvlDaxVRKTSZrSayt8cF6h74vSVa/dI9G8MZOYWT9NDcV2Wc5yPdC6AkD+
 XwRNDLl4s77ZRKMeBMsdDGeRkYIhhTcm6FbzhGWKZkIZdgRPptAb1stfrYbNxcDBg+0EFuHsS9d
 NnWgO5164UDaVjLuTbj7V6e/dYSVw6WBzk18OXJmCPyMH/wLzt2rr4S2ak+y0rJPlgR4UTnijDD
 ZX4k1OgM7uaGUVydg9yD77P++u0FKH93Mdpq6KYESMlt/r25VDufqv1WAI5tpzY5kUTDh7zyhiL
 JQm6hS6KuwKxLt7NUphSm4wJp1nW2HwgT/0zFZOm5Mgrf40hEUz6NgLLKFHnCcRBQ6tCMvdmBmi
 jIJWWEiG0GdCVh1j/zUtQ3gT6KhFW4b6TNWe/KQG/6vo0F6R6sx3n1ahzFlnp2R8YbHqO3zQ
X-Proofpoint-GUID: 3iEu6Nea5rldUabcRI7wxQXMM1gxiICi
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=683072d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=709 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230116
X-Mailman-Approved-At: Sat, 24 May 2025 14:25:18 +0000
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The files generated by gen_header.py capture the source path to the
input files and the date.  While that can be informative, it varies
based on where and when the kernel was built as the full path is
captured.

Since all of the files that this tool is run on is under the drivers
directory, this modifies the application to strip all of the path before
drivers.  Additionally it prints <stripped> instead of the date.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
The files generated by gen_header.py include the source path to the
input files and the build date. While this information can be useful,
it inadvertently exposes build system configuration details in the
binaries. This hinders binary reproducibility, as the output will
vary if the build environment changes.
---
 drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 3926485bb197b0992232447cb71bf1c1ebd0968c..a409404627c7180d5b0626f0ce6255d7d0df5113 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,6 +11,7 @@ import collections
 import argparse
 import time
 import datetime
+import re
 
 class Error(Exception):
 	def __init__(self, message):
@@ -877,13 +878,14 @@ The rules-ng-ng source files this header was generated from are:
 """)
 	maxlen = 0
 	for filepath in p.xml_files:
-		maxlen = max(maxlen, len(filepath))
+		new_filepath = re.sub("^.+drivers","drivers",filepath)
+		maxlen = max(maxlen, len(new_filepath))
 	for filepath in p.xml_files:
-		pad = " " * (maxlen - len(filepath))
+		pad = " " * (maxlen - len(new_filepath))
 		filesize = str(os.path.getsize(filepath))
 		filesize = " " * (7 - len(filesize)) + filesize
 		filetime = time.ctime(os.path.getmtime(filepath))
-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
 	if p.copyright_year:
 		current_year = str(datetime.date.today().year)
 		print()

---
base-commit: fc5c669c902c3039aa41731b6c58c0960d0b1bbf
change-id: 20250523-binrep-f8c81fa0d31d

Best regards,
-- 
Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

