Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A7B0B5E8
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDD510E37D;
	Sun, 20 Jul 2025 12:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CK15wmZj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA9710E372
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KCFout030962
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=; b=CK15wmZjwLqVxFF+
 HUoGDkBx2r15Oxpj8YJuVlT5KgPd+CVdQnGrA3QlXxP75VuQoymPj7Hb0Qr6SgH9
 IAEZRMKDhNOWQau/kqrm06mIB4I61SsEBEAVjl3AQ3uq2oe047iyzR4+/ogMSI8S
 Oc8hDNwOYNFyR11olShvu9ilpL/auQ1VnO+p/J9bkQ0Eg9x15gwmh0j3W+X7Q3KH
 H+Ts4JuRVgKv4qUXKVQOaCM8YIdGA4BuxIz/LM/lpkjCYWKCQyw3EiaGji52jKiM
 s8Bfx2MLDsSJzUOYSXSZNOk1SEVOdsZtamAgRDk2IcrUt6lmr5vGGrePKSrhdh+9
 mMX+5A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vt5by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747ddba7c90so3001352b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013859; x=1753618659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=;
 b=Lxd/PKyAu9ltcZA5Fuz7iJkgMlaVQhLWuqmZvTxL2Vt5pt+Q5+HjPJKpRv06wzkBGo
 UjlWg4AZ2RBVyLBP/8K1jvXMklBx+wBqbDf44nxoZlCZETNrdTpe0oy1ueixZACSNkqI
 0buyGE5uUn2lJYcXHByXLZxx/y60/3pzUTLDuESb5oj2LPhCjmGci7AU8azgBuzunOBX
 iETs0WekUIqGVBql4T24Gx/ma7UV7yQl2CPisv81F0PXRkCtohKAQ+4iI4dvoAaR2J8C
 fHhjDLy4hm6ipc3irn/0n1sLbayMwwIYW+GDrV1Pe8/LJHQ63t4KBIPZRUq8DJlWzl41
 o42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWW+0sNooOppoIvxHEMgSSAMIjOgapA8ox9jcQsfvx2IPz4opxGB0tyyGLloTUikqLnpjVfPygIqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLRIBpkKv8EseR96pd3ESGXS0+8wXNZqw+FMk0B3ijhexBdPOd
 Aw/EUT6Xg920BNzLcKchXeDcsTfMXFsZ23p7VBsv4s4NSK8kcw6FdxlSlcY0+hctXnGZGiU5S+6
 irsuOkkoGjV8Xjal4wuoglgioOp8JedK6RXiugY3lCm9u9qUNovJNzH1r5XQU4ocCefGr4n4=
X-Gm-Gg: ASbGnct+wNS2oes+gGNVo9hdv0kxLKx47y5X/KMuRW1MrFBH9prOtqPyoPZD0jIvz+B
 Tjvp5bleritmENLQYWg2+ehd172lSKQmkcoUH42oBtw1Vg921/39brxg7Is3idjyqmGPQoslqby
 Sfkmkn4au350nn9Hd9v2iA9BhKNVE3sPwgfUlfAtO6PVsk/Ub8BxQ04p3ZhYAHFOj+2MMTkd8jq
 cKSrCzHneETX7Te08phVffxD5u+mYJ0TxrqAi1lsx2wCG/AEZBSEaeNOncMrgwaNPEJuln8lHFO
 EO6wsRodOgUoYXp2MgEnfn67UW5fO0xuwzq0W8LedepJVJ3CiL9wCuhORMDTkefF
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id
 d2e1a72fcca58-75930138e54mr15194868b3a.18.1753013858936; 
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHky5Ub717uk0wP0u9f8RtsuBSVWNnbbl9pWx4XoUOaKPKD1lY6iSnhVS3KCoxJyIWeda1fcw==
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id
 d2e1a72fcca58-75930138e54mr15194831b3a.18.1753013858492; 
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:13 +0530
Subject: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1263;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqLkCf4B4+rAHo40MJEHOqWO43efxrMMyMYz8FlTqtg=;
 b=57s3/rl0XfByZyUpDrauyiUmLfsidvykGjHJF25PhHK0hs0Hz0klsQf6cNk5NMPG4Gw8jnW4b
 RIB6TjQpayICXoNmtM+GNdsFQFkeP9cvdQ8ia7aHmoGMGigvy0nd2ix
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687cde63 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=_nbzAfXQmFRcFNHC6JoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bqH6Lx1uGK5xyMdkMqKRAtPst0lad4IZ
X-Proofpoint-ORIG-GUID: bqH6Lx1uGK5xyMdkMqKRAtPst0lad4IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX9WmN2o3sEJ7U
 HWijeUYdiILlLrr1ZLnmPpKzNgR80lSPC/PgKqKmwTXqbAno9fK8vIu/Ljd5MF46ivVnUpMRrGN
 2seSJT4bfBwiwZvoQBureFaWPADBUCeb4kv1x+8tVT1VFlHTzsI/wf0b+38UAbNoRLgsHaOMweK
 EQnw6YUjVmGS9uNZ+PRlnwclSzajEgwnrzjyVqs/oLrQk75sCJCXe1HYg1Jb7HLmW72+PgxXIGF
 QQboNRctvknAIufdHPaN9Zi//6MxETIb/aMvXHtL5gYnSbNPI+0anBp1oistiAfyiYHkB8QSUg8
 fduTYcp5XURRTnmhJAoc7BYKBobr1iU1ExTtunWfd7LPSweKNHSKDCrgf2MyiPtkFiqhbMj0Hlg
 xuVSCRRhZp54qO557mEHbkT0xQpOBRmkqYIm9dZWfpDq4idWrckafVrPe44/qjkgtvett+1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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

When IFPC is supported, devfreq idling is redundant and adds
unnecessary pm suspend/wake latency. So skip it when IFPC is
supported.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include "adreno/adreno_gpu.h"
 #include "msm_gpu.h"
 #include "msm_gpu_trace.h"
 
@@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
 	/*
 	 * Cancel any pending transition to idle frequency:
 	 */
@@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }

-- 
2.50.1

