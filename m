Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4AACF69A
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342910E2F9;
	Thu,  5 Jun 2025 18:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm/ofcbn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130B10E2EC
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558hv88007388
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tgiGXs8Fmtg
 Byi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=; b=Zm/ofcbnD1VZQDOavBBxUSU3b4o
 oRFCLbynsakKodEStLUnV11nCCPtyeTkcc5APS7EBlGjyGMQlCNokAEeD5ARkY12
 p7WTJDskcEqc6O/IhFn2e6JsW9tjbnQdFEmtBokpeTyCVjjGKP5PI9AqRP65tvyv
 ZE+GyND+rO+pj+uGD+UVK0lyNWAI2myLXv8/eD8kZclNsgrqnu3TWArZqWgcOGx2
 +jwJ9Sgb6KbXwY4hqrr5l/jWkA1mxX+tG2BK9yNJY5k8HZjK9gCzs2OUK4Hf4sgr
 a9I947nzzO3ZQvLwwJUttyUklgFCayV6aEU4tKWHX8/Ic84pbE5tTH0Gf8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso1084843b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148329; x=1749753129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgiGXs8FmtgByi6+4YZ4IRUEBBgzjqr+lD/A8pUTVaQ=;
 b=Y+X0kf3JcHeZ3ZhRcNTts/E1hQAKcSppzoEIQ3fKDiAjnU24Y+Wl+Vi+r/+M3S3J/z
 gVsau8w/CFaYqeqKHD7KjidR1nsuklmVgEpeCs3xUvkffAxvoHd6bq+arEB0HhL07rm1
 3kXTlsDK4gnezp50yc3+4kDxSMXFxtIRtQwauAzP8xQKC/7FPUf+qlnvRr/Ei/SLM7dq
 5+KYjQIKNesjxWeUCnAxnW1vCy1DA+2TzhS3r+wJN3zVTUoWcy7d1Li2xcFyMXqZU1ji
 WAR4bjUB48vwze5ZzmfxA3lZ/L/z8SuuxtPW3efXD+Rxn4pi+8y5kcrWSrz98TIqN+eH
 oxTA==
X-Gm-Message-State: AOJu0Yy+p86xaADFBTCM+SAycL8oAbJUuYkkN82tC2DTo/qFanN3L7dE
 QWKxFdKus39S5OdIj3Phv/RZ2QdtkL4vMYYX1/wTbOVS8UW8WWPGh+mZBvHi4RimlUP7Ekmw1Cm
 pIJJyL81P48CshhKJl+7vgFY57AGIisGGhWeBfoAhIuAHhvHeu8ZhKvTbTHjxdUJVtzJGmMA=
X-Gm-Gg: ASbGncsXAKGLHHc9pJlNHjzCispfiahW5+vSyvilhTH+dJUWzHoE7T+rVGcZgyRljMa
 QKRkZI1a2pTfS0HeUnWRa4Py+op9Tqp7Mb/QE/ljedg+IfN2hAbUj9WML+jPlKmExcQRW/7XxgS
 brZZSv8nUSxUK7gp1M/5nwGRKfYmTZ2bJNLFPVEBJgIVp/xj/8HbV/WRjySRxGJXFUVxTLIx2yC
 05QsDd2q3esq42R1qDjwuCIgiuG9pohCloI9Vx/vYrGkpB73L5fqHwuvdqqolCa9aoknzQ4PqsK
 HxhojDtnLf7BJzuT+6lLMg==
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id
 adf61e73a8af0-21ee257726cmr346318637.24.1749148329213; 
 Thu, 05 Jun 2025 11:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6yEyRAo6qHQu3LjusRo5WiuixIyyerG+CXnhIKpPAvFwR7mK8AVmwqDRnbddTUCiGjf/KQA==
X-Received: by 2002:a05:6a20:1585:b0:21c:f5eb:ede1 with SMTP id
 adf61e73a8af0-21ee257726cmr346258637.24.1749148328731; 
 Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f6683a5sm4687a12.37.2025.06.05.11.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 01/40] drm/gem: Add ww_acquire_ctx support to
 drm_gem_lru_scan()
Date: Thu,  5 Jun 2025 11:28:46 -0700
Message-ID: <20250605183111.163594-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2aa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xs8HUT0FnXyYc1zbtowA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX1B9Wm3Lej9GU
 WW7FYSuynlq+rOmT3TO1hPV6Av0fJSX1NPF2pUM+oZeP9X4dV6mZc2jkLMYZei7+BxHc3HxCfPG
 ap7AyG3BxhVmb/C36CkOh60+amax35HHD860960Hr9wue0doB5BL4esnH/UeVy5qsC+jcA74qSs
 r7+SRNxwKmJUxLkW2H4e9J2ZKb2kTNjYjbQWu65lgiwP3aDHoCvfNV0rx6ixdQUsXLA/XbP/1Vf
 0chAqCGWLdmZATZC8iij3OXqx3mmMYqJLW3TzUYbfDMnc4eJZaqEQSg68tSgkM7oxjg0VaPGnTB
 99+2CP+o6z6pc5Fo1qWaguKM3L3KBPjYW0LemrCAHZchJTPNyFOVCCtMAGqofLBsLB80zmqGvuD
 +NmDR2bSCxZRMQbcy1ZoYe9NxfsZ+G9tz/fe6kDYXAwbiesL68A8ZQU2nrnagUxUjmwoaGMI
X-Proofpoint-GUID: _K2Hu2UuMmwFARsKTTXAw139eH7AjmSX
X-Proofpoint-ORIG-GUID: _K2Hu2UuMmwFARsKTTXAw139eH7AjmSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164
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
---
 drivers/gpu/drm/drm_gem.c              | 14 +++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 24 +++++++++++++-----------
 include/drm/drm_gem.h                  | 10 ++++++----
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..c8f983571c70 100644
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
index bcd54020d6ba..b611a9482abf 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -556,10 +556,12 @@ void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
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
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
-- 
2.49.0

