Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3BAECD3B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1853510E346;
	Sun, 29 Jun 2025 14:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bp7Axe3Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3810E221
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAvC9v021172
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Dn2IbO0/ubD
 WRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=; b=bp7Axe3ZmrHKHzgVNwp+Bq+ZX00
 asBodS0A5L3U1Lq7H4u4AoZq3IXvqdmFXWymOUD+oLWMV+6x4KbIJXzuQn7AT/zY
 dZv60Z3KBiAUZic1/bj9Kt9XMotRjY3ojrTbccgOrNgDFRsl1DumkVyMOtk0aBZg
 WCW1PetrErwCqd+uOnK0Ardmw7+QC4Kj7eFzLyKY9Odpm0BZosZbGtvOq0FVqPpR
 vXGlyUY1myNKgX/ZDIHo2nQov9FzLk3qlwVFn0SVGwZ3PTmWFOQiWCNPcgNYInNx
 DzBArd2riU/MDBYOuYHKl3/ZIGSHGlRknNVea5NTwpxh3PK86Fw2RXi+vYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2843-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso1748663a91.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206076; x=1751810876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dn2IbO0/ubDWRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=;
 b=gK5LOZ5X3IafMSoTgjddn44QWelM9Ott7JxATvXjqaWGJu4m7KftWjXzfwPJiDmP7T
 +LZ+uNo6w0IGbccUVTzOn8MQFg+qy8kQEzAnNSotNXibcrts44Id1Jija9O4Vmu5sHYr
 mNZ1i5IGgNivVLh4CsLCF9RbtxDbICoxcC4nOFn1mQ7IQwy9cAuJrP2hgNdVAFV8h9VS
 opYgXh4svTqxKIxvtdv43LNJR5fTwtjKtU+gfzP/UXf8p0vF3jn7sisW6eOI5haoVYFL
 s2dvt+vZg6NouVgWMHaZm49kCmTfel15HZLI4h4F1Uzdk5UHZXUBfs7pk23oGjiWu+Yh
 6Paw==
X-Gm-Message-State: AOJu0YzPvOVfUxwRhuykJzD1W8YpOPuEVAEyLjRDGno/L7KUfXEFN4xY
 0VOHKcUU/I6hUrqYS/5kHAkTIsO2Qs8X+ke+JuFZjFV81D6EtS0o3y5AHVdAfifXScIr+ETc78x
 8mRsFBXRPSQSpWdLBsmwOXQWzeVHSjOo5sKK3TqUbVMhYrbbR53GAVf9pRrbEkVGHaTwvqJM=
X-Gm-Gg: ASbGncucLXI2atcifmsFMTeA2EU4wTgtLskrgjdvK2PdWDlpj0dLXBEuGDV1L+xI0f5
 WX4MX8WCo3VcDY99ZJe/V1jt8+iiGOgHvzWBob+DtsqJeSd8/Lyhvjfd3t2LhvdWZttpcJeeDQ9
 qyO5mwbaHpcx54vUGtBcqospflsqPUuEwXfoYzMv/Ckb+TCBj1ExZYAOJW5VTbTb8N7QSUGDGn/
 8n+p8j7FN3TRRuByn9jvFbAyKOPfTJWgMampNUqWkGLNK59Eiis8lHJGjI4X+MvfX2O2gjzhwLX
 sEiUA9uKH5UtjUCjUrKOU6rmJZ25wR/t
X-Received: by 2002:a17:90b:1d4d:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-318c9264acamr14997374a91.24.1751206076280; 
 Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0YeMc3nI6ml5QBg86+QzQfLpwkSSpiUlWx9O/NZt33gUkqNoK+5koucvNw8/t+8WApQARww==
X-Received: by 2002:a17:90b:1d4d:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-318c9264acamr14997321a91.24.1751206075813; 
 Sun, 29 Jun 2025 07:07:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13a509asm6958046a91.20.2025.06.29.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
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
Subject: [PATCH v8 24/42] drm/msm: Add _NO_SHARE flag
Date: Sun, 29 Jun 2025 07:03:27 -0700
Message-ID: <20250629140537.30850-25-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JQXGbDnjf42Hc31ecQrMjk7k_UMF2lhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXz3g++4NhtDy0
 wsg4D7bUQQW6NHsrcayfGmzcbtK5YR5bysYrwKb+1P5xCkqKq4zQfBF87eo2V9gGBnyoS2kuLWI
 UhMFtVHumA7DPlnc5Zms601hakZdNFohadDkeWni48xALxzTfbhT89TbUYaofAdBDKWecwIhXCt
 K6zdx2WtHJ/0ZebqDcid1KNslkZ8Mu+8Y5kULq/x7OgXkyTqoJDyfNyL0zMoP+WV+pUpr4x/3OZ
 Qfe+Iw9OlCaF4dic+f+L11Kvxr0NMH/O5eBoO45CLMWHNgHzbkfE90uPdAGgEj7mihx/ulVTbX4
 jUH7XosslgKTI4xRS146/A0i+wlfnp4Cle2E/eMQN5yP0RjSmb0xIe1YrVJ70+4RevKN63UXt3L
 y59x2vJ0XbN+nAdFsoXQcWaJeGRD9yEn2OfFJj2OPSNoOOPJNbl+Df8Z9z+yVlbcMLkUWrhT
X-Proofpoint-GUID: JQXGbDnjf42Hc31ecQrMjk7k_UMF2lhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0fe3c9a24baa..9b1ccb2b18f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d16d3012434a..100d159d52e2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -546,6 +546,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1076,6 +1079,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
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
@@ -1108,6 +1119,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1140,6 +1160,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 2e37913d5a6a..4d93f2daeeaa 100644
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
 	if (drm_gem_is_imported(obj))
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
2.50.0

