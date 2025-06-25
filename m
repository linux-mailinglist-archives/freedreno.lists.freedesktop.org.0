Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D0AE8D72
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8B110E7E6;
	Wed, 25 Jun 2025 18:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIGvpvDe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8475910E7D8
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PF5kqe017387
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nqziWkTpKn7
 +Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=; b=eIGvpvDehYgqN9sXz+0//R1otJG
 hEi0O7yl1x1v1GTQp+D6tnG2oKP2eWY9Ue9tHjF7Z8UXtulyyxmTNu82jVWKIAO6
 qDQgycWIW4j147uo37iaUrFzr5iUAXBfKxlPsbzsA5tsFov2NQE4ivfzPab3uPW8
 MnJLE/JWZ7Tc0EKD5xyMXJPzWa+2PRDxgLGZmbfqeD0AXrC6RYlGmUYx5EGCcuLJ
 jyIVG+ilm3kA6fSMEeLJm/oVoszYDqXmKyUJ4Ye7zZWeBuBQItHinXJvqB1Yr/hg
 q/rN7s2qgVKbQan+kMEutmXFV5SGqOghmE+veOxLZIVu4vSPWb3r61YmjBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bggy1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31814efd1cso86071a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877939; x=1751482739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqziWkTpKn7+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=;
 b=rpBhpQcEBDbUPWl6kztmB9YTNMqzLSrYoIL6XT5RwI5BoVL55tkYXpETXfT8Yx4K1S
 VnaPC700VKAya/J45RW6PL2R2ILNF5gqTPNxMSrhQmqwxet1elmvPE23He4JFZZQHQnn
 yb0mW90LghPHDsb7waEhdOZ6PXdOLOe1CL6FCPm+hBTdMo5H1NkdCp3yxNxcU06Zum16
 eCGalMf1hFQPjlme5CG8c5m2Z+x7ak7nF1xGy/5yWWpB+kg8dbbpuV8LsPYIeEadcdxB
 OL+/7kcFrZL2YdbUkrmw9B5l7JSW3hdg4lTt8uuXFJ18OREfwmI/0ANSIg7Tvc5+bJK6
 PQDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdGv1YvJ0DcBjTL0spbhgGjGOVD1Rpro/YkvUASR1FzintXcdmCLR+LEM+sw8g0ZPpePnhMaBWyJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkEsSyTCEreoFoxHvrE08lXKX8vs+QUovntBXWsouybvGMNoAE
 q4YID51ue+YF1M3Q3fY6pEWBPeZIHp1qISYu5omcaDmsB8uHDPfnysmpMCdneCFIkwxJagXhwnN
 rR2ZZSHp/ikm7PkSCWdxhPxXgUJV3MA0l+h9YYpp7PphhIZURcc6vcRCkq7AEZqJdgYiqxAE=
X-Gm-Gg: ASbGncvDfX+Ycg+FDbEmL1ZiwDuPJtXyH5ib4jFHOV3kcBdaSWWE5DGghrTPhZ5uMG0
 mhW1Zph1/2nHOG2qNdExuNgbKwQjJ4hRXRW7FFiyQnbBOjd0a3gqchIxONEZr08B8MuDHuWrbWI
 0Djv59PChd9Zfe9koPWKFMobK7ma3iT4mcfmG2Ahc/ynkUSystqffAQZlvvPo+RPHoas92m1Rhj
 StXiDK89UBDg2tkj8GZEUzjg47odVIzhp3KbPyUlnleZrH/GeaHgC8kX0+a2AtpDNGEGZBDpRzd
 jvK5sqTB2+5kbQbVNEiEQlRVkHxH75vY
X-Received: by 2002:a17:903:2f4c:b0:234:b41e:37a2 with SMTP id
 d9443c01a7336-238c86ee132mr9721355ad.11.1750877939031; 
 Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQyQ5uDlaknabIX1fOYhjGPTFIufwUdkrN+G7wbVg/TJZF7xfMrXlccspbcvQ7vz/RHivcvg==
X-Received: by 2002:a17:903:2f4c:b0:234:b41e:37a2 with SMTP id
 d9443c01a7336-238c86ee132mr9721035ad.11.1750877938619; 
 Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83efb71sm139513385ad.75.2025.06.25.11.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 24/42] drm/msm: Add _NO_SHARE flag
Date: Wed, 25 Jun 2025 11:47:17 -0700
Message-ID: <20250625184918.124608-25-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EuDfVcYuLQ6o7dM_IQsifbIv4xE5OTaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX//u5JuocO/Kh
 7/vW8GYcb6Ba+0dWOyLWd5SvpVhh6FHN86aoljY/FBHInDKOeHtivfRQBYjvD4sPCO7vkN4rwuR
 IyWWlPq11DYIGBfekI4nIWpSFuQoIBa0dBmfCzTOt8PXqbhOwpwEBdBQyjUoVtPAdfrx82tEXzC
 ON3nH2bBEjBKrFgOJG0V1xgs03ivUJeH9x2+KEUzQKfbgH0R5RMijM78kkE9+y+NJFZ3JV4/aFM
 WKCJNNFMrEIZ8ZShAfdIMHyYXDxtuCBv+ur+3Aqgdu2y0+Lj5I8LKKSsUPSy/tD+l7gGSpDl5Lg
 kUZeQm696+vLwaV3ovO2gVF28TR+0QhertNfbdSEACv4hGZ79hBB/qHGVM9UAu1w/bimC7e47aI
 oDW6p15lyAixqN48pfhacTDkra3PveuBXI5kBDqw6+mwvR2aWuUNBqy1fSO/R4JMOf6lVed1
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c46f4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: EuDfVcYuLQ6o7dM_IQsifbIv4xE5OTaf
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

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 136dd928135a..2f42d075f13a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 142845378deb..ec349719b49a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1084,6 +1087,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1116,6 +1127,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1148,6 +1168,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index ee267490c935..1a6d8099196a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.49.0

