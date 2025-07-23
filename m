Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C919B0FB8D
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 22:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0BD10E1A0;
	Wed, 23 Jul 2025 20:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOIBXAyu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009B810E1A0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHXtL0024755
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=go4w6pisezM
 +fmrLJT459t96/m/WbzFkmudzTaE8Fpo=; b=TOIBXAyunTGCoyU9O0+JrziAopK
 PRYLvkqmUc4pYsmtcy8e9DIZzT2sFMbuODU/dH6qrA8bArv2OaLkBwrp6CbT2s4O
 ZDF1kSUtaKWmpXXPANSLKjJ4aBWWuE+1z0y2ChxaawQa0D+Q8a+4o7Mfjz+j4oHo
 VGI7CJ2BFfEyMbhoecKf4EyFA2xx8yocvBB9H7GdUKNuT81cTfKkeqbeJd5G5lKA
 KSdGYL8eFSSbTX5Vua7p05Btr8nXas9/aoCseiWKxpY0IVCILrx/a4lMpQRiv3j7
 H6DFxFoKfCN193E8Istnf5Tun0tSFeKGc3P8HGFiVfRiKiI3ajsKjywRFVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dp9en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:35:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab684d3b55so5902121cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753302918; x=1753907718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go4w6pisezM+fmrLJT459t96/m/WbzFkmudzTaE8Fpo=;
 b=CcyizoOfQ1HHLookrQ9XSKSD/XAguc8PnTyLW4yfWz+5xibBdPX5bdCKGe091z2Mmu
 rLH6TGv8j1w2rdzAoU4Ze0yMI+UyPu03ylYbWC4s93w6/K2j/wl0+a/t8viJ7FJ5r1no
 eOuDqcwEBAwnkJUKB/uCfqQmob3ZK6rxNJJoo3f1kM1FGnpA9Bok73oa37kPzWp1rP7V
 w1EqjT47ktBgKuRpFnWrFerO5MwJTk/uHB4FBGiK27RMhgOsHCe/tXvWTwx/gS9IcdAg
 hiXG5b5cBB9/j4DNbO0Ox2nssZ/GjMvjn9BFVU9+Kj5WE5WtAlO2E+eO1kPdX7pnNK40
 L3ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNtyqsrT7/PiMmIW9YBZ7gcr8XXj7G72SAzfLyj0zNNUcoHJbCMXaYmpMdo3d0bLIIRqOJ07Q4Q8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDbh/bVTtiZWrIh/yd/G11nMTJeJiklGpzQyFbmHHZmOx3YNAv
 HSQ5UtURogujJuW1SMrrP3uNe0t/lApWjJDsBIKRmBWFYsAGfj0AhfC1qcj6Y0z29Q95RmpmB4S
 2Rm+iWg8Z0M90YukW0was4nMkmQmDaV47fQMONXdBKDPgUMwcXS5o6VyWaNpoNu6UocX9fi20WY
 uzBpc=
X-Gm-Gg: ASbGnctT/HFaR0aTTljkMq9z6Hiza0K5sgfbv1XRUtlTBNZZBC4toXACVD3C2phXU62
 bdEGAFTbFIKUpCtdsQOYQagCCgUJ4pAaN1QM5CpE/oJeylVfpLQQk1d2g4bVrbyfH/P+LegniAZ
 lqi4oto2jC9PXDU49e+HHAKgV85gb2YuNkKvWSmsE+SltSivzp8L0Z+HgsiPLL4oEK9YdxLwUiB
 otXy7OsKGkI/vpAYlL9UmgHSDNHymO0x9xEK7mC+3kaBHu1tEKcdBNnvyNhKietpl5qu9yWB0hw
 OFRqCWWyGlpGtrX1FfTP2qEC0h/N039gWCJxOI2kf3/EXmPENy0=
X-Received: by 2002:a05:6a21:6d99:b0:23d:34f2:3a22 with SMTP id
 adf61e73a8af0-23d48db2762mr6286127637.7.1753302511948; 
 Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8VTSyv68wujrKZl+LBtm1rzipjAkQC2pZQlbR1Bf3Ipp3TNep0+rs/9z89WCJhtGvp+l5RQ==
X-Received: by 2002:a05:6a21:6d99:b0:23d:34f2:3a22 with SMTP id
 adf61e73a8af0-23d48db2762mr6286089637.7.1753302511486; 
 Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761b05e4029sm21283b3a.97.2025.07.23.13.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Defer fd_install in SUBMIT ioctl
Date: Wed, 23 Jul 2025 13:28:22 -0700
Message-ID: <20250723202825.18902-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
References: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68814787 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PlmIq3VlCZcILIrZII0eGxZQr--HiY9Y
X-Proofpoint-ORIG-GUID: PlmIq3VlCZcILIrZII0eGxZQr--HiY9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfX/Shlki4HN2ND
 2pLOsjVAoBmoY3qHVUR4sf5HBV9jnVygXjnUUojTd1lcyImV+vgTk8haaew4eEJULJz0m+ec/x2
 w/RIwYccYJSDp9HDWyjK+UuA4gU4d1DCgOhGCEzTmzZ3HICS7hUewQEUIeejYtUFcn31/3D7iti
 +KqSu1jLR2egXp9qqmphAZd1pvH0zmyDcziPdMaXLmcAmSvlVuLnJJWf3egoZYYutcY7WkWUM2M
 AJJzEPvSID4Jw1UmY3BPgx8BjbfmcsplD3lwOaSYBzzR+jOmdnsEXlMFrpLebcm/HAX/YJkI24Q
 XmC/Zmfi76IFj43j9NtXNm78uKvhNCDP0ylauVnomlaBlqqFGb3QiVXWqd9w2D2v5bwMkDf5p9l
 uxd6Zad2X8T8SeBF8bO5DwlBZAk/WG7FC41GwWAkyfnFLEfMlOhdpZr6faP1rb6aSV4fqN1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230175
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

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 68dc6c2d5eec ("drm/msm: Fix submit error-path leaks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 0ac4c199ec93..bfea19baf6d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -770,12 +770,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		sync_file = sync_file_create(submit->user_fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -813,10 +809,14 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0)) {
-		put_unused_fd(out_fence_fd);
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
 		if (sync_file)
 			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.50.1

