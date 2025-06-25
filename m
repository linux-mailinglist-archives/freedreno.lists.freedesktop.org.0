Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7FAE8D90
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AE410E7D8;
	Wed, 25 Jun 2025 18:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXY8dKKs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F410E7F6
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAb8hX021793
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
 O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=aXY8dKKsLj/cT/1qK7TVhpav/7L
 UPP86Cr1vsRkmb0BWeGizTgB/q5Qx91qYGLq8/lts3a5LNr2x4p4SZJMxRi6bGKN
 PwdFBELzWvU5FTiWkhGYv1H87BJINRiiCtbtgu1VM5LAka/a98HsKnzn99H3Z/BP
 wv9VzFGfQIkEI3RH+C85UirTfCdKiWozEJjC7NbYofLAq/TjiR/ciwrYsTSGHfV+
 XMvkAZbexekRF4xD85S7FROndkdWfJQdRUw8E0XlKBV5vcCCRmVP8BJrNWSB6y72
 AK1KBhhS7aZiISGhY9EFFKEMbsLPy38kgK/uJOZIxLkkiZiNSfIo1hYUYwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7489d1f5e9fso282468b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877962; x=1751482762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
 b=POF/bv+Gt+K4tDS3CYVD4egd9fgkL4GmXaRAYCd8jvt6+pc4XttfuxDuUzOeN3Wsee
 Q8Z6SHUFSY5ZJSE10/j/SNhku2mCS3aBRfh9623IoNAXjn2aEZ3FGMyoZ8YxjhPFgeIz
 eb6ndWSjdzw7QWaM3sxXmRiz9cr5bh0mEfy3R5Ws+aQfCIkyK3VPUmuI13VWdB8BUPhi
 JRDOqe/nsPsuNOeg4h1m55FO2oJWe+swFQ6Z1al999ZE+UZfqLz24lLSY9jzUebkIUEk
 p0vKa8t7DHr2QyuV84dh7vizwNQ946VoChBV56xIYVGw8m5x8Zku/lCLD+mP51itVIsv
 BH9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLa40OEP4/sF48rU3pFnFwxBfA38ZhMresiMQmOje4WjzDsu2it1xhKRHe2pgBemyzeAV5lHTs+ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDrVXNQRm7XPAaXz9UXINCkp9SfFHEE9uLpO/Y2AOUDDPdz1Jx
 j60Z/taYF9MMiROmlt6vXW45sozW5Jwd8hUR6ZPgTpNS6raog4czjdkly/Ax0C5Pm6IWboPkk0k
 kKz3XHI3fh+ij/AVbC83x5SQilm1RoPSWr2z168v7vmDu34J3UUtmJgG+Sp3TJ6qkIDVeWrQ=
X-Gm-Gg: ASbGncsIj1kx4YP/vjIPsA/wkRsglhDscOXj4r0lj/j05U9/1+bWibEt50ZA7mOkz5W
 C4lS6jByS3AwGL6+Mmvrdl/7w/WDJAeQjhzl8B5Ros5yzENJ1+08H6NcQgLas3XjXkoNMDRl6BZ
 hjTm03oLM/RZFyr2xANRpW90rG3q2LFyN96dRRFlDwy0JhNDVnZtpDtPecJwRlG4bQyjskqvDzs
 EckHv5X57rvxh+60lrK6339nVEAR1D/kzgwvFl3Wykl6vdCL3ZA+uQlVN9N3rKvbdFm+nC1QzLg
 b9Tn00xV+iDyrC1K50ehYpeuGTZ1MWOL
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id
 adf61e73a8af0-2207f192b9fmr6464803637.13.1750877962262; 
 Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvmmyyyzB3Yjf1DpzF4jlr0xSFd/MY9FsPMtHRz/B0Yw+Ld6nyFDHhrmVvlIxCATF6VP5Sg==
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id
 adf61e73a8af0-2207f192b9fmr6464773637.13.1750877961841; 
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c889d219sm4961586b3a.180.2025.06.25.11.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 40/42] drm/msm: Bump UAPI version
Date: Wed, 25 Jun 2025 11:47:33 -0700
Message-ID: <20250625184918.124608-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX9ZTFO7DUeSBX
 e7dqqSUIZSp1T3BJrAzoxhwZxtDohOi+Fv3mEdl4Vepcy7N2/ZSiBKH1ggb9WpwEJHsOBwDz8dS
 F1bF2HNicYO4i97bC0rDDH9c5MBIpzrbsWUNnCZxkk/kpbgKecZoElrwULGW/hJnP/SOachP6U1
 r00MW4X2lcnyZVbk8Cy8TEvD0SJqR/tHBT3cwLszq2unYNTdgQD86OiICd5QLemcsVw8zboi0zx
 sdDtv1TOmVGIDpuSmcww1XDnN8b9+Ppee/3eRQsVlyNQkd9obRg9BNv4/eEYEOvOm+ZP4mz22ur
 0vKmM7+az9PEwdIGvH2G6N9X/liR4S8T3NFI42bQIezndanONwCDlDBjlusMEcygodc8Xk3o21P
 kydyYN+WNP9ddiPgu7yA3hgshnFX6NuZ5B77HO0L6do3RLzA3tlVYOCrmkos+pislM1gO2P4
X-Proofpoint-ORIG-GUID: sifU8pZnwKNxNOKUlB3uqBqHFlKjsPO8
X-Proofpoint-GUID: sifU8pZnwKNxNOKUlB3uqBqHFlKjsPO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

