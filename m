Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3114AC3058
	for <lists+freedreno@lfdr.de>; Sat, 24 May 2025 17:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36E10E0E5;
	Sat, 24 May 2025 15:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhcYwmwU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8667B10E090
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 15:55:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OFn4E0001895
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 15:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ENaXaAptX7hV0LnSeomxQb
 fTAaRBDEz7YM383T9ESwA=; b=LhcYwmwULS5KfUeqGBzXGcoruxONco/eBptlY/
 nM1vtfzRk5rUckwf11bl6c8rdzYN8frmxC8Az0cbDkZRSZK3FcSEJIrFqIrIyiEB
 MKTJw3/ehE7aHXwNeS/cIzqi0PW3nTF50HalXOvQC83Pf75UWiKOYzfigigLv38I
 weXKpwY8VkZgKz7K1OkE3kCAEWLBZN9O+mwSn19m14dhC92kGZN87opWCDpK2kWU
 lwtVj/mQITdmtbukbCtD87LgnriAef/AaZC44X5p5oW/+k+jmyLuXXTOzz52FGA3
 oPWHvbEtDf1YFGd5WTyFsjfjfzfhioH7+2ljeC37eOuffw5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w8tnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 15:55:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2341e468d02so2106335ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748102147; x=1748706947;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENaXaAptX7hV0LnSeomxQbfTAaRBDEz7YM383T9ESwA=;
 b=v+IFxpD1ftC2vF8GWJl4KWo6sVtum//R8dRlJ5Bnze5lWKbQQG8lDDoyc6v2hEvXZc
 OipTktaoA01l87W4jokwQ5Q4APZD6AttcL8MrSYKMAgDWf3i03wA/QFBL4a8LVv63KVh
 nzTH4PPkosdkJvTa7+XuWJMwkQIzXShPoC/ukJX/elTxjq6LltXDhes2zmQsRbSsnsW+
 6BlT9pL3dUKVW5RzCXf6q4dphB0Xf2m2N3xowaJaMI1UOmIYyTwqEahLeftbmUaUMDkL
 2hXhfOKCiKGzMqDPIfh8a76Tm0Avb09Xm4mOh+33mRZbeY25SkV50fL/wLlESyNAd2SL
 jdFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWttMqwRhCDzK5N1Os3Mf3j0KIiuuTvv+64KBKH6uG1y9xD2YHokeUdKqJNNsoWKVAhDIulARg0fpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz1FmTS2X4DtGL/N/konQzDHE9ODQ18gQyXKCzK2YnbL46YyXA
 /uvlRXoq54zvS86a+EHWN5emUZPU7tSJAp16PF7o65gzKipJ6B1QI0syv4ZRMbauwJM90nzem6+
 9pUiKtas0TNdvltwZVuhw+rwg+cPuqfLCBZfn3YVgmCxqm3IFfl1JdhttSckAWoL/gDxYxos=
X-Gm-Gg: ASbGncucEmxNy7KdfySey2TD7xJXJ/oFsNOOT82axhzRZu6U73Rlxz7uxvPE2mt2Veo
 FIZdZ/kOYewzGOluIu9uP+xBeZFFNxrhn9oPzpksFbgqyOByS6R2laT57Xh0vokdw9QYF7iIC0E
 ErtEXGH3BfTOX0ywTVHw9HFmF4UORE5SxOMKXX5BE3u/tKaIifcuQPywc7G0wLvChIopsQOsRSb
 1DBzUWVkbChqh+9hy5STlXmwXX0qEVlWp/F9+gps4+RlScOhdBmXq24EDIXtXOXYj4HhmRa3aDY
 zLSoMUf/LiCUwgoa6O9Q5fTILyr5uPPPiBqs5Peuqd4WkFrB0dE=
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id
 d9443c01a7336-23414f62af9mr58433785ad.21.1748102147396; 
 Sat, 24 May 2025 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qiynLRSJOmSDekV7ueADk6ZcUv9RFrAPGuFI8AxKbhuiTjsCzxUbRLDcJyHbQbuDV90JCQ==
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id
 d9443c01a7336-23414f62af9mr58433375ad.21.1748102146905; 
 Sat, 24 May 2025 08:55:46 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2341ccad6fcsm12090755ad.170.2025.05.24.08.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:25:37 +0530
Subject: [PATCH v2] drivers: gpu: drm: msm: registers: improve reproducibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjrMWgC/2WMywrCMBQFf6XctSl5anDlf0gXMQ97wTZtokEp+
 Xdjt24OzGGYDbJP6DOcuw2SL5gxzg34oQM7mvnuCbrGwClXVHFBbjgnv5CgrWbBUCeYgyYvyQd
 876Hr0HjE/Izps3cL+71/icIII1YYKY+KaS1Pl5hzv77Mw8Zp6tvAUGv9ApwpD82jAAAA
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
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6831ec04 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: F7_lUtkzTIwVvoOdNzl_WPYQHEuHanx4
X-Proofpoint-GUID: F7_lUtkzTIwVvoOdNzl_WPYQHEuHanx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NSBTYWx0ZWRfXyXXTbRm57QPL
 bEMQkZDGk+9gQ8P2g4d1Kx6FiUrx3tWLM0MTivwh/QltSWBa2URcBhEOMrZyhpy5rnQU2cp6kKC
 VuDyNwknlNlwvGJvGfk5dT2FqnBVAp02ZM/nGiYbXaAogUsT0UmBdjRYlvMAi9XUBop8p5MbHCH
 Lw3TC4bOlacMqfbDbjWxHz7vkVgQkazUfkLFknVGZQXCpFa4kuEdRe+kjRMHRyQwAd6/E8+tYLU
 9RJEat3u0OQ3CqNYA5DkKmSohsNbcN2NPEew22wfOL8idrmxutuRc3IBpqoZpUyrgYRHGSHxylq
 1KVY58/y/hpmraiD+EklEVamssFzMJ98Jp0OqtwrBfauHJXGJy7qyDVsNG77AFHkClv9VuTJtN4
 ZRg0YAFuF6wHWrWiWOYo4Qy8dnbeQOOQxF4Y5CKSps4k69xI1vj0NWAxRBAqnwP7yVPFf+TR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=874 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240145
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

From: Ryan Eatmon <reatmon@ti.com>

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

This change was originally submitted to the linux-yocto-dev kernel [1]
to address binary reproducibility QA errors. However, the fix is generic 
enough to be applicable to the mainline kernel and would benefit other 
distributions as well. So proposing it here for broader inclusion.

[1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
---
Changes in v2:
- Corrected author id
- Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
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

