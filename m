Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E108AE8D7D
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC4F10E7E5;
	Wed, 25 Jun 2025 18:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzcpaVVY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ACB10E7DF
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDKS4V022985
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
 eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=fzcpaVVYOQkPu+AqJEW5xxL+2Dr
 sJP3/k/nXVodPhaR9Z9hZrRWY4HMU8w72ygsq5YB1dpf13DKZvItcuz5f+wAi/VP
 hOkxdqxdmV04cGSmv0e4Ir5FV3NVrrAmO+78pQZnaYgFKyN/+tdvGxwTqxv1cVgy
 I8xv22yU/UiN2LtRjtwIVKf+E+4NpmGe+N/fm0xsD0hk2coNB8Ywp9hChf14zoPX
 LFp0IMswHz3huuewD0tzkhUC3dnTqqDRiqHA9/gc1wIEbt0YW65/VVjz/K/coDHz
 ULLt+3jqg5VHX70xrK6un1LsCfZSL0CPM8mxbFZv8n8PpoqyPCw8Q2jDsug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggy2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31df10dfadso108771a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877947; x=1751482747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
 b=c+jFgnhY+/LhOvga3Si5zKQWd0mAJOLeEU/D7sqJXKNg7dSwHRn2xbpf/+FnNBoeBK
 U35CeRlzEDdqujmZCJBEjrPAgndXd5C/I0nmfxkgsydOpiwBwFhZW1vcUwT0XQWxXmif
 UY9cygLgBUVKa6RKhB+/iFPO4RGfkRfLZnjUntaP/NyUPtgKbUFQik3UfGFbertqiR3k
 WQLaSQj/TrhdcGVq7+MrhRvj0uCccyAjARnKMup0mD9b2wWBBBF5OrwZ5MJxO23gyY3a
 jCIv3CiPEUklFQJ6+ZbPKd4REZqZfek/E14vEshJ8pkkGsprFlc6fRVNTzTD9T9ShBFq
 byNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVGBkCPqXfBftxtLArXemZA+TodSRkPACofmu6Vr7Pxdu/YpmzqzrY4INvsCDhBHzVAI2mrPJFdKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC2NzchW3fsXdTDeyQTgP+AgkJgYbp+IAng/zOgQbbbuyArfva
 vxeGb4ertNqkpFJK5sYEHSlr73L9mUfueyVndc9tRAcEdZdH1KvdDPVcb/rU1wqe8J0QfJw+8xu
 iWvvWM/po7ljl5LYWz1KajiCz2t9v7RJAE3yxABt/bMmyQgQOWHWcaiqz/VcKoWOpGb/vts0=
X-Gm-Gg: ASbGncv7PY7+N1FYTVpoO2IE4t16gPNZ+JlhMGdIciOJX9vi1bTt4fR80ZDI4WsVsVJ
 q8kg/Yj2kLJHJdR7s37kf4yPz1p2PztHKCSDjmf6XepQArLPMNnE4wTQTVEM52w0Eo+dHG7MVUW
 XDkSnIgKg7fr0T2ABjTeMbqrPqBZ23ZxFtE4rN2rXRyLBfdpQTJYtH+eMccXK/pD0VIGfv8Y1ta
 wNxVPrVgJBCWFkRWpe5pTIUYAmsDOMNvhpuU3iw/RwvW1SJen2YVuYftPBxdYzEEZSIB3kkhdnk
 e0xm/AngVqVsIJXF17eRWHQDfEnnrGBN
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id
 d9443c01a7336-238240f5674mr63435505ad.21.1750877947522; 
 Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWujkmyQJzCosZxG0/o9huVMzGmefy+6BjUnqrS3MSq6Cgpe4WC/Xv+9jKHpehtNVJ8NIU0w==
X-Received: by 2002:a17:903:2bcb:b0:234:8a4a:adb4 with SMTP id
 d9443c01a7336-238240f5674mr63435275ad.21.1750877947137; 
 Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d86628ffsm137223375ad.156.2025.06.25.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
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
Subject: [PATCH v7 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Wed, 25 Jun 2025 11:47:23 -0700
Message-ID: <20250625184918.124608-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E-28mXSO3OEYmUm4xSd_XF2nhtXWDAnk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxhT8bXp4/9wq
 IrRAiPz4CMp2hSqRESYAPL6ivkvGbNBBqxs8++d8HY2ftyJCRh47n/KAnvCDlqVRnj11dmyXNo5
 vPdvtnd+9Zy0ZgOv8UGIV69gT1d0i1BCYG2ERo+gszXDe2hXa/eOCXrShSrSPD7m0TIu0P07TQ7
 V79VO0w31pKbZLAnJmBBFe9/ZdbJPLA3Qe9OmckhsOYVy8sAH8MHJ409IgzqpV1hZU6Zn7Z8EJZ
 F54XFw1AodqzFKkEtY7KGg3dzaFyLOPaR6qH8LT5LAJU8s6ung4qI8z3Sz00PwT/OcSzLXCGmsU
 A+5JmLovk9FvgjjWIoFSb4efz01E/3pGgl727mLlJ3stjuzOXsb35hDg7eLEaYjGATOaorsALmV
 J+ZuitBczaln/12ecUfs659W8csdaqmkS+VUkqCPshdc7YYfCb9g90COVrQFMKKZvFNgXCc9
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c46fc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: E-28mXSO3OEYmUm4xSd_XF2nhtXWDAnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0

