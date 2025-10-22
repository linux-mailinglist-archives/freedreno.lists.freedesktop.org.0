Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA3BFE653
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 00:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0710E85D;
	Wed, 22 Oct 2025 22:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEkMV+VT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26B10E85D
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeq6d030315
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnh
 T/pYk/5k=; b=XEkMV+VT0Vncnb4O8C33110XM73b8qxAXFOmWykCvCJVcT1/Qg9
 XAHAez+tRla3HOj7g7zHbK6LyZV1P76src9J0CqU3pa5hUg9yf/uQzARdqNi2qjU
 sgnPKIucpFNLncrNNnR0Un2Wyj794wd52GTHb15SI9T0DdFj3eMtrAhCp5vEq94l
 UQAbQBuY6td+QZscz4cRMufFjBuDIVPAIC65vErFx0EVnLAmsxyAjka9ro/1Gunb
 LVdiEVcIQkWSjP3p164VQA7n0srzvHy6FhOwFe2bqv2emGj26oqZ9Y7M2mwHGHfq
 /Ze6q8qtTYrHuYhE27eg/7g7OBIjoPsPKLA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge66sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-78117fbda6eso95800b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761171643; x=1761776443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnhT/pYk/5k=;
 b=ShuYu5+4U79OIeRkZRHsjM3RS/THdghbz/FdbUCL9aWMSnO1WJQTxYhaPONk1nMc29
 j1SByH21ZN7KLga9vVmiJ5SFO8oRSFJXbNBY7d1ZeQfIuM9Sr5YLPPMO+cXpzEQmjQwQ
 LYPThMMmJzxlxd0RQO11gf5J3JvaeP6TvBHlwymzjvbR4DCV4AL9nM57jdRaYAAk4JwV
 P8kV4fJ60DoZcWG0nKbDDEQWZ1NAS1dd6KaMwLcZCOI0fboI/vrS5ABcppK92wWJCDgn
 QEZfs7grh28IcdG0NRxegQL2TWC3a1rf39hvqw7kEKFwnAZOztYnnhXdzM1n8formG2k
 lq2Q==
X-Gm-Message-State: AOJu0Yx6YNcYd7iO7CqruK+8J+p/mPk2NXnTC4yeJ8eTu8ZeuszxOaLF
 8vrxsxrM2TzOCS33BSVk5S2PYuulxOdtG4n2tDeggjEWfs/vWg5cZDs/VnwI4DEJX56Jl+93UG6
 CrJ6pUD3y7gQzVuQg26N7bcf0xmUoPn6PPHCKF0k2F6Z3uQMDQKI334FrmGUuP54BXc1yhJg=
X-Gm-Gg: ASbGncufgVbIWzO6QIzeQ47amb/XGX1lK8dEVCh24uWb2vVxIBbjKLmtMdc7c18fdxX
 Y72/urZGKdGTU5hR8KJPmSRhJjgqmn8izedWiZ8samfgpLz731L75/6HEr908o6QyBN9GFhoJ6s
 mWzEYpJQI28aKfG/0Eon7l8WOAdnI6HOgRdYI9oTT69hG1Ju7ulF+p9OlZQ6lYblgBoGnsIWQT8
 vdrE7+E88Z+Rv/oVbj9osp4H3YaJXqIZ/E+DLi43Rr50A34Py4oSrA3FeFdHbfaqn6Rq8ryjzVj
 DZ0+JUNtgwTD1RwowECxH71uLraBawP+1oOxJxU5UeAhC+pdjzYiWFkdpNhaWJpHF2CK39mLOne
 7XKxH5ns5SQ==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id
 d2e1a72fcca58-7a220a99177mr31804775b3a.17.1761171642679; 
 Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP3Xt+fiS6/lvXldmXrI/Xmz9rKgUz8Br5D+seLdPQbhnS8ioRXSjubRta++0jtoklDejZTA==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id
 d2e1a72fcca58-7a220a99177mr31804731b3a.17.1761171642157; 
 Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274bb0c93sm284889b3a.59.2025.10.22.15.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 15:20:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Ensure vm is created in VM_BIND ioctl
Date: Wed, 22 Oct 2025 15:20:38 -0700
Message-ID: <20251022222039.9937-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX7dFlgWcgcQK3
 50Q8Exqhsq8PZKYeKFB9ApSO7bwD9q/6MhJ88/Qkflfh7JvW/ofx5KybScurXoCMCD6L7ve1IqO
 /fRxVnIyDNqeUz4yH1QUjp2+ArgXvzGPMVnbMZf/arA4n+eGE4sJACFMrsNCvR2IiiGcqKl70d4
 tswwIRcW1LU88z8ynoSBkOOQrYbkQMIXmP+7Vp+5/L2VFfFTk5DOJtFgelEiWc0Mksb8KLhThhq
 6qL31VKmDxj9/z4Jw9+Upm4Z4pRUbkiap/bUxe3v9PUB+EzW5xGoIbSVTzUnGWyAbbedPsXIJp3
 jPbs8A6Gs4L/i9myHNf5VnJnb+5YRIH6o/qGrPKUF1voAAeX/5+lpU/O98cNGuVdtaKRHJVO47r
 LqnlSYrilQFnortTblnTPkNBprZp7A==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f958bb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3QSsbYrYwaFkjnnp2pkA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: GhWxp6vS_0VwgmKU_NBVMaT0nGfRLbVA
X-Proofpoint-ORIG-GUID: GhWxp6vS_0VwgmKU_NBVMaT0nGfRLbVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

Since the vm is lazily created, to allow userspace to opt-in to a
VM_BIND context, we can't assume it is already created.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..90712586faac 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1382,7 +1382,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
 	 * immediately close the device file and all will be torn down.
 	 */
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (to_msm_vm(msm_context_vm(dev, ctx))->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/*
-- 
2.51.0

