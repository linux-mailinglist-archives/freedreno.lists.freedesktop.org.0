Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58AB3FE70
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5757910E685;
	Tue,  2 Sep 2025 11:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNw51qeb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC77D10E689
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582ABFcv030132
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=; b=oNw51qeb20gRjh5K
 SJcSqN5ur9YoYdqRKWm9llbBe3eiVlesT2Fx66WHqOb034ZYy3dxmRjtYb72jMG5
 5/0vqw7EPbnbe7QVv+aPp1UWh0KHrSFGohsWTQN1VkfBuqogbs3IXMMwPvITfNDp
 VKZ4Lm3RH+KU3F0u/iGhPXWx1L2HBjOybiIN4WZnQ6oTmnUNJUX4krJqhzsmifsF
 uNjxD4q4MCtzk86FBcjDYPDQ76v4d58SfkT/di42x2MaC8ra9vHhOJXTCfZMe9nM
 5fiCvpVWJEwVBV9RKzLOgHzsFEpevhoY7FPLszqABuVCn6s+yZVDcUXqQ8UX2Iam
 tIk+EQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3fvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-325e31cecd6so5133843a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813857; x=1757418657;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=;
 b=tj8Jh53SSIfoub5pnfWCObnWZ4tRY6HCT3Z7xGx1vmEKf4Gx9jqMx4VAxWRKlHDCnu
 FunEDZxgRq8rePiCBkr8njbTwLTfb6ytI27yvUxgzw6BCOxM7l6FKUJtpGeLWE+Sd22l
 1z+bWVvXwVD5vDeIBDKfOrPGmgi6s+23rYQbrpn9Ck+0h0mEsMZ7UMScvKyq7WruasHm
 Pv7rPmefOSQyFyhAzEJ5f+OIsEOdGArqxbNtZSXM8esTbFGK6GZKvFUH8JlBbiDagd/G
 TgsB8i4U60NNIUEuHXS2SZkxEXuUng+uZ3NLbEt/ShLgdI37r7DCZ0NPODqQQQtGwUk4
 MNWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwOn9BCRKURS6Gmwu7lVmGaSWMns4RUGOhWexn+NMAZ/a5GYcsNQstiLYmLUDh6s9j9Pe1s+aIN3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOqeyCiLwz75FtMGAXsXUfw6xxTj5eLMh9fttj+Yax8RFaKJCf
 ZyI0wNWs/1jawklPq6lDiWQJkdo5Z0gQPa2AvMQjdg5Aq/NGI9V5/+UkZN3TONktIgcIZoUvdmD
 Z9061TVjtLaVyLS/PxweE8w76OYV7dA0FpoIqg0TvFTKg4QZowXXE/jgganbI7xmP60fzIdo=
X-Gm-Gg: ASbGncsULoKYqzjovEfl0SphzK5i++Xmrj3HSK58HWmaJ0INWbi2pocrRhtQeqxp8hp
 H9tLOSwgv2L3jrA4TAAG21cBcLAziDu9pprRwRPXwc7FuODw8dER79hPFcpy2fcc3Ww/5IMEjyi
 d+Ev40f6sLRgXircOt36pxy8E2QPEIIh+pBhtnHX6JqjdqS8m28lPWTwMAOnsW0xYcuZ4/ICWhn
 mDv/LF2R2CF7G7KHSjL8S7NedV8ylweFg+ekhujj3S8hZkqQhqo16lWvMzx/po0pKqp4T2koJKZ
 Go1C7ngsz6S0NKLry1d7aZN3Qi8Qa1LsqVyl+NmxjuYwqWFMAW1yd1CQqOSqjxjY
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-32ae706be21mr503237a91.11.1756813856675; 
 Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErTRmAFRWJHqjCbxLE3P2bbrtdzC5Cpz+xDsMeCUqIW1F+tMhJ6J1sfw37u0AjKJ9vrGGI6Q==
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-32ae706be21mr503191a91.11.1756813856183; 
 Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:02 +0530
Subject: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=1742;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NOwN+cR8tlV/aqnCXaU04cGy/XLeEqERgLf8m3fHuTk=;
 b=nETh6INr+D/D59TGsO48PohgUoYDADrMA8vDopH+eYwucT0xR9w6Xy9nVRTXxpN6RHUT8Y2cd
 vj8CoQJRz/+CLeVlmJ41VG+K5uMvPKxvAXahNtEUBILnkPu31iD82g2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6da22 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5u7-6dn6khLgd3CzhdsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dzgSs5Yh30d6SZPoWh6pqDsk-_woV6Ji
X-Proofpoint-ORIG-GUID: dzgSs5Yh30d6SZPoWh6pqDsk-_woV6Ji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwcsVD7tg187h
 BVkx9LkWWC4AHiTPtm4Ve6ej/IZuliaidQDkP9X7Fq2Wrxo9ECUmuU4TTOc93Ud303BAwYTm9DR
 bP/a0mNgQjdTyjZovJ6t9qUn0NXI5Ycut8mSiPDD26zDoV+CJW0Pr0dkCuJp1HERApBARfVBK/W
 AWzZJbT6Y9R+ikGDXoJPtKQicSFea+l6qIfeUgg9kso7QFApL6SYYjnd3qogo5OMJMsv+AsXLgj
 02+94a2dfe3jhmGky9opTIZY6A1auxbVLqtlv+SEnmF4lRWFYbS9BUHrs7f6Nzh+Fd6zgjP9Tsd
 1BR62193BvcBDcYWu2ZYcHZBZfpLg1XPNTyWquGkKv/rkTC0tnb0hZgQMZ482nXIn5voVQ3Ndwk
 U501B2jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

During bringup of a new GPU support, it is convenient to have knob to
quickly disable GPU, but keep the display support. This helps to
fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
modparam to support this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 50945bfe9b4992118f23db3cd17ac348be9f9c9d..28f744f3caf7c59412aab06f912cd09a01e185ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ bool disable_acd;
 MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
+static bool skip_gpu;
+MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+module_param(skip_gpu, bool, 0400);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
@@ -184,6 +188,9 @@ bool adreno_has_gpu(struct device_node *node)
 	uint32_t chip_id;
 	int ret;
 
+	if (skip_gpu)
+		return false;
+
 	ret = find_chipid(node, &chip_id);
 	if (ret)
 		return false;
@@ -404,10 +411,16 @@ static struct platform_driver adreno_driver = {
 
 void __init adreno_register(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_register(&adreno_driver);
 }
 
 void __exit adreno_unregister(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_unregister(&adreno_driver);
 }

-- 
2.50.1

