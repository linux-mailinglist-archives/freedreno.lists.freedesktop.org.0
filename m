Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CAABAF82
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 12:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BEE10E2A2;
	Sun, 18 May 2025 10:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIE9sUb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8FD10E2A2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAlPRB014049
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=GwIE9sUbD6PCS+UP
 WvZNYcKd+uxUaPQsBsvy9qSGyyUjx4jdlF2UFfO0y5hT3jaUmHSFJWLmanF8rJ85
 6fDw+wG1z3aObMkR6k93rF/t/swJcGcdZnPCm20gEuX76ho9ajGThVRWHOvNR7rY
 e2aPmRikdXGzdwIzHK+gTnSGcey14VcmrWc3hNWZink/98c+fcEGf0qrp7b15zog
 Rygz4NxZSajiD+bgZfJ7XwlnYDhfHqUra63TanTUU1u9pc/HEla/uPLyyNGheJ/f
 nf1JrbfRUfPmaLdOOzMlEKJbtkEjH6qBxZUXO2hULhy/GkHGE+Y20d8OgeEsSzkT
 GA4u1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31vd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 10:55:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6e5d2f612so81229636d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 03:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747565741; x=1748170541;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
 b=EkF+4alsJvYHsvEaAy8Nr+qSUcKGupD8xW4uxnH7E8evgS1S+Tg3RSKlpLn+4qUXC4
 up8YKoEulUSPRCZ0g9ff5EBmgSJCAO9Nd4iD2qZ4plbjQcz5R1HCyi4Z+fs5WUl1g9hN
 +yfp1O2E0EF8XElACTSsm62+QS9SSUOlse5bkVLmOWTNQsOJjma5UmUXT268+6Jdbefu
 l0jxBvahPhpEZud6flRImQ52OsrMH3u9LBFnwB3X2a6VeOtZtcynZp5yNJMXukrNGGY1
 IUyxpJLBYm+Uy6jF63qQvxqeby585ZGn88mDI3JCkvuCIQt2CX7j+AKqSujQIvaEPTnL
 VeEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmbIT7OTnP44DIPWF6o0KPxfIUEEbN6bGeMA96lzpVQXNkM8oxPeOIN2OF2TEAVuLiXQNs7yLFb8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5toBOzr85F3arlgU88eaDxEPFjTYUBpOI+REYsZ17GWDskXpz
 GSCjrWwy5lVPQHISSvh9hHsW2zQPVBCUrTyiFZRwK77P3oJk6CiVW9grL02vQzFF1uLWLpDOwyU
 vGRAWBU9UkhxFVvUvM8vs0oYDniLfhg3Rmmsxh9EERRXfb2MQMPeKWRnPp0632U2OqyKHsdw=
X-Gm-Gg: ASbGnct6lMjFtEkSMbVUh93BbteeMxMAWLSnvC7J3pq0VKpBZP9rX+F/yEKVuAMGkBr
 qC07TfytLiZYqX/kRAdWeAlr3OPrWhGV+o/GDml+91CefHFmABuY41SYPRqrc8WG3P1fO9sZQnY
 Gdia2KbePkhGmnJvogVFsaVifs4HyjLSNHt9Myj9o4OdBWJXtzG3CbVPlEIHuA09RLoE29AjtNQ
 TvzR/huVwxoNsmXSZ4nCAZUzXj2nwC8+UtjJes6wSzi6UAwfkTFNKykO5kYq/QSGsRLR5MQ1+u4
 hlEphEHgnikc6GtYSdzdEuwhRTP8u/4rep37yXDSE/s5+qXp5g2OlI+0q0AaL0veS9L5iP63YOY
 rI8ec/AfwxejU4K7WYKvUDZ6r
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id
 6a1803df08f44-6f8b0870f8dmr165088086d6.19.1747565741043; 
 Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPRsgkQ5tj9rTK0IrAjGcywRW1fhh0muvVsDDNPPD2vIhT22UIKWmH4LZ5iw0W13ESp3Geg==
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id
 6a1803df08f44-6f8b0870f8dmr165087866d6.19.1747565740747; 
 Sun, 18 May 2025 03:55:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:26 +0300
Subject: [PATCH v3 08/11] drm/msm: rearrange symbol selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-8-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyay+Pq88fpo0dRqmFzoV26PlTC9TQnpNLYR
 5PDNYGJeNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1c58CACfs88NPVsFXzwZNkPLlFX15tdciASdOlLfSQwLHX1zdi9ZhkvLBdU+c7rG27ZPuO9lECA
 WT6uVv5MwGc5jWMOzItU+Irm3L1GXyUuq/XQnE9LV8StycXsG4rbeAlo8K1vJeIHXUOW/XQ7LGs
 +oQr0E6l4R+YERDUKKVjG4s0Q2lDg0syUEyFtFy2Bn+EB/w9KbGRde5v4byWRQRMWtwCwNuZ+dv
 Ahg8Wp9DDrpAkKOnd6yiNp+REb8OAVr8PJOx4bD4cIEIIyqg4FoGhfq9S8J0j/zCfHqkLoZKSqQ
 mFKlUDz3sQLIphcnyldS5gEUvOcQ9eSaKVidN1XfYcOwig5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829bcae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: BA2x4bc86PVROqjYx3Ivn3EJVry9F2Ug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX6LeQV5i4eBX7
 YxioZp2GDSKhMyUieLcDa9JIzHvexf9r40sMEzk0xDBkAfMLrm2zqpR1Q+a7Tc/5s8J4bB3JqSa
 dKBc4Iu6xtIfk2IENJJUePsWT/NnEzhNs+DVi1p2Yri4HCcCm0bpq2Eh2Djd6pXJhVBVBA8JlX3
 4R/aN3LdyPD5f9Pxyx/5fQkaCBSdrbDOYC06rSKKEQzutXUscNm0Gia6IxeQ7cPJ6pbbDz+G0Sg
 146X69C6ssAyhCqZh2GmIBKd5Eo0hkE00ayBhfCYKFT0w8IMa/um8ax8aYmB8MoR5l5+UJEiUpi
 P2iCGFtKUjGm1bNjbhv38aH2iTpB239etBch+SCS4ez5DPuhNY5nH5KhsaJsvN5e+VRU2luetVU
 2jfYxjtnyd+YxtlxCH+JBN4wVbekENvx+3B8yEqMOe7omdO4/8jH5ZONRsIEakSM0L5mJHBJ
X-Proofpoint-GUID: BA2x4bc86PVROqjYx3Ivn3EJVry9F2Ug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104
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

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -118,6 +116,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

