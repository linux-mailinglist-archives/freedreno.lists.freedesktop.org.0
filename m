Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0FACF6D9
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92C910E9D5;
	Thu,  5 Jun 2025 18:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDgP4tdd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79910E9C6
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AUscv031915
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
 eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=nDgP4tdd+Ws7bev+GhOhAZpuA2f
 M/5EBWVxMI9QxUQaxxy1c7EQj+40WKPc35VOwdybVzQVPvSLi/uNj5CVH7u0jtzH
 g34lyK9urU3eUUuTdkyfQwdmfZJwhkmTpsvodQBhbXN4pgDi6EcYO2ogcrXEzRvQ
 pt3uVuNQShO5jBWVOW8DYplSU8gcl/t6+18vrDdHeXgHEZeIpHYpFUuway26NujA
 9MbRlhmnyMWkka6pk/wuCxmJFr2MZrFGUPiXe/p90wq3HSuilqJKIDaFrive0Wb9
 OWcw7fHa6h0llk8l5P5ChrLd+NPdTD0hMz9NVSWqClEnrl6LQ3V9RWvnJHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be861aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2ede156ec4so1479859a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148388; x=1749753188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
 b=tOEF0ByUKYWsjdaTUShzyAA6wmwrnTBNNk9bVsyidRtSkIvPFuiiJB1nPNjw36vjD5
 dp5a3D04Rlj2tX55yS7LUwRrWgM77bcY5XIM/SrbY7IuuMMikM0GhL6hAEUeqnymNjjM
 CVxQ9XEo4eYt6/ZDOsDPAs7NbR8ULoTkCoRtNG/MvevPa/2Lj3HpEyZli8dGkQIg2Ao9
 TPNECfw1JZ8HY+iQdMFM5K0k5iaOkRW7BnBxpG/8R8WfIXlb6ShTgyo0mLpxLnlp1Gcj
 m7K20PchK/n9ASg+dQa1lQfLq3QERLq9iZvwvanbtykF8uA+71K6fKdGprpTZz2pjAa7
 /afg==
X-Gm-Message-State: AOJu0YxrLhX0ROieyWnhUG/Ia027NI8TFJVt6CARSYoMFSdQ8mHNx0B0
 NZnt786F/bqikDcIkigjntrXkiQzTJnejgsr8covU7eeNcw5+dMkuMwYxEzutsF5KrkueWG8Aiu
 OodgMuyhqaCS94sCJNeCrobDGDO8wUq3XlKlWY1PJHStQ+9ZZfAEa2pmLKYgRqU6NVajNWD4=
X-Gm-Gg: ASbGncuZMkjHSSmik0Aq409qJKjIV1KllnWTUn18NcVEf1mm372Aswrd4Ru5yOx+EO9
 nxRkm3QV8Tnwm6/lMzjl7QLh3TALEY8V0s5FZbk3MEmrPBzqoVskbZoh27PGTz11GY93kHPko0j
 lWy8YyuPGgDy+vVfLzM+8KuN6rOTerS9MfbmKRSCTBVddwEqop5+vorW6QT6dweiLzkrDttXW3S
 3lqs5rQDl3C1YzZsvqHeQpWoNaqY/D47vtMOczj7QuGnLCXSa/7EVngLkY0ngGMXS59TFIko+lj
 iHoFodWvfB4qiP0eduxCg1EtfuidNAZU
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id
 adf61e73a8af0-21ee685066bmr387132637.3.1749148387734; 
 Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZy4+h7p31V7pW53fals1CsboObn2Z1U4IfzK+Rx2MlP/oVXrylzGSxEK+JWTBZYf23+Ce6g==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id
 adf61e73a8af0-21ee685066bmr387097637.3.1749148387380; 
 Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affadf70sm13643103b3a.91.2025.06.05.11.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 28/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Thu,  5 Jun 2025 11:29:13 -0700
Message-ID: <20250605183111.163594-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: mq5a5zYt-3BWkTJIz2steSWgLvsU88Us
X-Proofpoint-ORIG-GUID: mq5a5zYt-3BWkTJIz2steSWgLvsU88Us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXzMD/sezNElR3
 k8lBlW2HYZAV972IfxK2Ky7tPWxgR5TbFPy5io/3E/95U12MnCJZwDQz8ezkvtRa3LRuKwcfZey
 a+lu7R86BSsxbGWYhSM1Pt/JlbTwh3rxKb+ldtpDjhQYFn2U+Q5KuOLrPs7fOiXtQx2AT1jO6/Z
 V5pEcNj51zBYUQXnVhFbakosbrtg7IXe8cW0KmyT8sn5HlFtaNMOSSj4MDjUDSko0p/C22cUBBL
 zjb14/fTbbvxtsGksNJBq7NqkpWyZCof/b/9x1x7iYb0Lswt8a8BbgPTC1P+75wqbs+C3nImarE
 kW7Jd/9OdS2bqvH/Xq1bX+NQ30j5l3Q0OIH517fkZ6z9jyXOsvSsFW/jwEghftN+RgJUcO3Kljx
 tRfdZs8mP5vojqNfYLvLdSwtQ9hRizKW+/f5Uv3Uf1gBAMyC8X389NFB3XdNBTBJzLSWqEeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165
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

