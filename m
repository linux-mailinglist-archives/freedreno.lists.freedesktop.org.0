Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E577AECD08
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619BE10E230;
	Sun, 29 Jun 2025 14:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8p4peux";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E520E10E221
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBfOWv026498
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=UaLuKm/3fKy
 TMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=; b=G8p4peux7N+5tDdYCe9rJ2y5b/z
 dL+Fg7E1BREfn752e39SMxTzRfXBNnBTmNR/qoow9UgpnI07Y7YrfO7l/S/lwSyb
 GCDw1ZV4ofDxgCnuvlbPgOyLOHhB5VkEehkMsCnDjQqG8MNVMlay9idBjxGUZy+M
 QlG2ss3q6JBECXDzrcydv6yqx7QnVjvgJq0xf4FbeCfX4al6wYtfp7tZTwT2TCHb
 LmCxT+7+nDi+TRdBYfWvgMykNiPtKT1y19Ey4PkjDF+Zk8+xF1Ba7ZrfT6XQske0
 pZ/FYMYEyLTUPImbKJAVb1FntQe/lQviX2agE6HH39dxnNmk72iFZ6NwCuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpt4f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74890390d17so3144767b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206023; x=1751810823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaLuKm/3fKyTMFvsdO3Mo5+i/aFeJ7ZuYdAPUo3GE+o=;
 b=RewAZJdTAo5sqLjwfe1lFND2Te2uPnvyzQDB457EnRVyXAetR/fCojSnPozxfqDG5T
 tDIqRii6JJ/dRYc4mc96o+W5i/dKvm2vAp2elcNE665GIiC4bR2nHeJVFU0yWXgFiAbV
 UOu38SPgEbHlXGPAq5J32sWODDLXvkFDQSd6267HOLvycbRITMphrHPgn3xHLIucoT3g
 e17XjeW0EwOIAH3r8lswi8hE028jkv0arCvoSI3FwqaDIFC52Qa7l0fh/3qEux56aH0p
 dRpAgkg70eQNBWuomwgM1mZitSfJ+lh0vv2wqxTjZpk5Ih34tbLFUp6msOSSAJCNJQs9
 bjmg==
X-Gm-Message-State: AOJu0YyI+BFISxmrBH4y1dav47oncjZE517e8rcZPY48zqkotnyv+NBp
 cNWsDtpywPz6fBcis0eU0OdnRvEndZAXGimF1WEO5w72xOp6/NuZfT7skSha5CBvAqpSdnQGc21
 nqOXGfuSfee1A7EcARPdSJAmhEwPezIHvPzx5dG+IZHWO1DP5A+o9VWTnecSXRT91g0nTbRo=
X-Gm-Gg: ASbGncu5CmLe2uKz1QnsU1cYFf1CTSm0iTNcSSqGzY/1jqUgROriz6+4O9ySdbTe+5G
 4iU8VA9muz/dJG2/UHYCuH7oFLcWeDJKgE37qX8mnk14GNVrYXSMqX8lFAGealoCpQ0iD7bQHEv
 4rYaUVVWYY40FicZm8e4nSx5jMdPLidr/Zv0lxj4pNNCZ3bwsK2S8AkyYW7+aEwyJur9O/jwJ4d
 zN/DOEtAQhj8YhNGVMCarQdUiD5o6SQ8amHVHdJHncSFZGcbv0RnkIZSTBvkrQIttXNhid9Ifcj
 Xpf8kUJtdKBPZKIGQQLIaG2r6uTskQM+
X-Received: by 2002:a05:6a00:92a6:b0:748:323f:ba21 with SMTP id
 d2e1a72fcca58-74af6e27ba7mr12454243b3a.1.1751206023407; 
 Sun, 29 Jun 2025 07:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF64qcH/Dvu1RsA66gxeamabybbwejYBsbv5pTYh18PMePejoeduNagkrBZeEp0IvcikwbAuw==
X-Received: by 2002:a05:6a00:92a6:b0:748:323f:ba21 with SMTP id
 d2e1a72fcca58-74af6e27ba7mr12454211b3a.1.1751206022909; 
 Sun, 29 Jun 2025 07:07:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da8f7sm5914737a12.62.2025.06.29.07.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 03/42] drm/gem: Add ww_acquire_ctx support to
 drm_gem_lru_scan()
Date: Sun, 29 Jun 2025 07:03:06 -0700
Message-ID: <20250629140537.30850-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX6Ep1TOWzJlnf
 p89yyGCmMFKIuGE2TnroV/TCdxd6ZNlCjrILSkpB7n6Fwpw7Wc/7Agts06bPaMF6Kjo0uXIcXV+
 jJs4EMQ0ZJGJOHk7dxgcT3R5ZZXwV9+nwJjhWvETRXCU5c6fMWiMkCR4RkY3Odgm4FGj9Hq0a+k
 kN7mCNkMuO3TgXYuWji8OywUZNMZoghiEpA41FBkKsd2gOoKjeMo7YGYK0tmMCu4yo66FsQYpat
 n2QAfoqYCbUs553IudaDbieiXExBC/X6q64jHYnfMVs9cwEbPdeydwVWbYUZs2g+OXMzQc5LU4T
 YiEYrAQ0XZpQzXW/uwc4lnep4wOVNH+dTWKmVu0IvKkIv5F8sJl2XS9ElBleZvQXTaN51IgPHAe
 k0BMKrBEP/5Ji44MY7nDZYyL2G2bOWfyqKfcYeS1CvWurB6bEvXNmm2qkIKU5ctsbcs0vCpb
X-Proofpoint-ORIG-GUID: oo07naHtdds7xMP9aLLfDxn5DbbK2WXz
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68614888 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: oo07naHtdds7xMP9aLLfDxn5DbbK2WXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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

If the callback is going to have to attempt to grab more locks, it is
useful to have an ww_acquire_ctx to avoid locking order problems.

Why not use the drm_exec helper instead?  Mainly because (a) where
ww_acquire_init() is called is awkward, and (b) we don't really
need to retry after backoff, we can just move on to the next object.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..95158cd7145e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1460,12 +1460,14 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  * @nr_to_scan: The number of pages to try to reclaim
  * @remaining: The number of pages left to reclaim, should be initialized by caller
  * @shrink: Callback to try to shrink/reclaim the object.
+ * @ticket: Optional ww_acquire_ctx context to use for locking
  */
 unsigned long
 drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 unsigned int nr_to_scan,
 		 unsigned long *remaining,
-		 bool (*shrink)(struct drm_gem_object *obj))
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket)
 {
 	struct drm_gem_lru still_in_lru;
 	struct drm_gem_object *obj;
@@ -1498,17 +1500,20 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		 */
 		mutex_unlock(lru->lock);
 
+		if (ticket)
+			ww_acquire_init(ticket, &reservation_ww_class);
+
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!dma_resv_trylock(obj->resv)) {
+		if (!ww_mutex_trylock(&obj->resv->lock, ticket)) {
 			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
 		}
 
-		if (shrink(obj)) {
+		if (shrink(obj, ticket)) {
 			freed += obj->size >> PAGE_SHIFT;
 
 			/*
@@ -1522,6 +1527,9 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 		dma_resv_unlock(obj->resv);
 
+		if (ticket)
+			ww_acquire_fini(ticket);
+
 tail:
 		drm_gem_object_put(obj);
 		mutex_lock(lru->lock);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 07ca4ddfe4e3..de185fc34084 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -44,7 +44,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 }
 
 static bool
-purge(struct drm_gem_object *obj)
+purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_purgeable(to_msm_bo(obj)))
 		return false;
@@ -58,7 +58,7 @@ purge(struct drm_gem_object *obj)
 }
 
 static bool
-evict(struct drm_gem_object *obj)
+evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (is_unevictable(to_msm_bo(obj)))
 		return false;
@@ -79,21 +79,21 @@ wait_for_idle(struct drm_gem_object *obj)
 }
 
 static bool
-active_purge(struct drm_gem_object *obj)
+active_purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return purge(obj);
+	return purge(obj, ticket);
 }
 
 static bool
-active_evict(struct drm_gem_object *obj)
+active_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!wait_for_idle(obj))
 		return false;
 
-	return evict(obj);
+	return evict(obj, ticket);
 }
 
 static unsigned long
@@ -102,7 +102,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
-		bool (*shrink)(struct drm_gem_object *obj);
+		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
 		bool cond;
 		unsigned long freed;
 		unsigned long remaining;
@@ -122,8 +122,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 			continue;
 		stages[i].freed =
 			drm_gem_lru_scan(stages[i].lru, nr,
-					&stages[i].remaining,
-					 stages[i].shrink);
+					 &stages[i].remaining,
+					 stages[i].shrink,
+					 NULL);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
@@ -164,7 +165,7 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 static const int vmap_shrink_limit = 15;
 
 static bool
-vmap_shrink(struct drm_gem_object *obj)
+vmap_shrink(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
 	if (!is_vunmapable(to_msm_bo(obj)))
 		return false;
@@ -192,7 +193,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		unmapped += drm_gem_lru_scan(lrus[idx],
 					     vmap_shrink_limit - unmapped,
 					     &remaining,
-					     vmap_shrink);
+					     vmap_shrink,
+					     NULL);
 	}
 
 	*(unsigned long *)ptr += unmapped;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index a3133a08267c..02b5e9402e32 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -559,10 +559,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
-unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
-			       unsigned int nr_to_scan,
-			       unsigned long *remaining,
-			       bool (*shrink)(struct drm_gem_object *obj));
+unsigned long
+drm_gem_lru_scan(struct drm_gem_lru *lru,
+		 unsigned int nr_to_scan,
+		 unsigned long *remaining,
+		 bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket),
+		 struct ww_acquire_ctx *ticket);
 
 int drm_gem_evict_locked(struct drm_gem_object *obj);
 
-- 
2.50.0

