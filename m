Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF7B2CFED
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E9310E234;
	Tue, 19 Aug 2025 23:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrRQ4pbQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C410E229
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL178K020085
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eorQnuKwFmy
 2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=; b=PrRQ4pbQgGU3zIbwI6WUS/i+lbb
 QwgBCdLHKiuGmdVJhDU70Kzzp1XfZraBmqmhhuYi6zCCV8p1KjAyWLGclhjWB/NR
 49KOhpakQ1bvvAAUukhZBfOjZNt9pI+k9qjqiWuVu3GnPxCp7+5/Vioha3slOf0h
 GlyrLJyPTiSlG8ekygsd1yierTJ5YcC5KVA3X9lGADoFh++EbH9lAQHNea+GI6us
 HW/TtS8ePp56MxRIUYSF5obBvHOoW6DzXUhH3jZqnRgxTr+q9ByMpj7HR5ms32h/
 7MsxoC5x6smZzogi+ola7robDSTkdSki1Tsg6TvaF1LLqBinpE8iKJ8wuCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tfg8wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24457f4f3ecso70036325ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646154; x=1756250954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eorQnuKwFmy2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=;
 b=JfMmWOzCj26ooxvPtxJsm1/pVlXnqD0oPByLoYBbIRSkYFL6Ew7k52J+IKusISrlsj
 9bVdGfeI+IWj3sWtpF0J3foB4E5dedjoR62MUwlPAM8fVC+RRH1Uc9iI3kob5JTs9ff3
 ihnqzl2cGRyF4AslN7j3RHM+7a63NmE/+ju9Ql1tvFDAwBSbo2tqvq025Ijk99tHMt91
 cgD1TRSHD2pRyuAICTvKoKxOcd4DDnpDGvvXB4te09+XM/JXc+YRgf2QjHgT4q6B42NX
 71IRdttwCrCWpX2HFnxypcbuaMCpBOH4eAR3xnsFpnmQODYp10kdUbS6I5cBEXJync78
 ptMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/FrKZJsfuGV1+WwI39CMAFMw+lVbqXjKQqNybVvRikzWBKX+O5dEs1eLzZB516HOwhRLLz8W4MDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQEi8ZUH0vkmPy+ZnyLu6x+nyS/vC3GXJBtOkMJRjUAKe0+gID
 adAxZ/kCTs4vPevcPdgfjCPGx8mfTRw0Bwm9m2hHgd47OpJ/BWyMIy7NVhFbgpSAh6cRPYBaLRZ
 2eZfakbTCADZfOABBrGc0A09qL0+l2gpjCJD6zzAP0EK11K/SqNik9RLqCBZtlXoI+Iii/ps=
X-Gm-Gg: ASbGncvXfIPv1FPiQkXMYgVo5uNOT8MVxwfTUoeZW4nFHDidOhMEdgKLoQRLdDFl7s7
 +4Jv/PrDC0kzoqhbObguN7Ykf1Dopmde3gUESfnj7uodrS7B4OuZJYHm+TROQxim0v6fQfNzRFA
 uOwSP6WrwlYcC8JbUTIIbYi5XHiNerF3CrGuRqkGh+nb1LQOmx8DyRakYKv0uHDGEveflvZQYCD
 bmb5Mf1BQvTPk8I2xwEHdbv6Mhc2yvw1edAgtwtg1MMt0AwJyJqh1C3rwvJGgd0+vRsFo4RhMyo
 RdVtn8QWRASUrKLBJPsAY/QKBEfF9plskHJAYF2Gc16FQQWAGRU=
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id
 d9443c01a7336-245ef156358mr8027625ad.25.1755646154007; 
 Tue, 19 Aug 2025 16:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlmpOombDfq8VbEjWHWMgGH5Q1/mKcc7dH8Jm6GIHXrGX0qRiaR2T3uKoERFwvEKAF5ww/Bg==
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id
 d9443c01a7336-245ef156358mr8027425ad.25.1755646153561; 
 Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ebc4esm8040925ad.115.2025.08.19.16.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm/msm: Fix 32b size truncation
Date: Tue, 19 Aug 2025 16:29:03 -0700
Message-ID: <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuuLbScA c=1 sm=1 tr=0 ts=68a508cb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=Zku5-IFyaxskcEPfeVAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: r0gnzW1EuX17vG8dG_qNSwRcou5zCTAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXx3kJoN9r9PkQ
 +VS9rW7BUCGi7PRZJG9aSB5jcwI4zmXS1mA+j2fe7L9qB4WjUMP5k1Plphp+VHTHq1TzXTSt8VR
 puPDLbn0zcBZ0HXIJ2lukMn5haU6S4XgNK3zgCMPOK4zxbtTcehJIp0H6nM0UKYvh5/VJdEIby/
 +ghkXEi/D+Usz+UR0F1MSk+FMsmyl6eRkjLZ5FwYBPFSLzoRL/dKTP/z8nWLLQSUPt+lQphbtTg
 xSP81QwyjjrWSVBR7hZogu3t8ssBjjYLiRHeNNQqMoGNkfSPUks02boHgfhkHO4jCOcS/EHxpz+
 kctyxaswIL2TWsAtSZA80sgPZrdjSVMouMlj1atxb+FuIz143lKyvpsID25TxmH7kXFKeFWH/fw
 TyL9AUFUKzA6xFB+cGNm7Ty2jYMgOw==
X-Proofpoint-ORIG-GUID: r0gnzW1EuX17vG8dG_qNSwRcou5zCTAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
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

Somehow we never noticed this when arm64 became a thing, many years ago.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h |  6 +++---
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 958bac4e2768..9a935650e5e3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle,
+		size_t size, uint32_t flags, uint32_t *handle,
 		char *name)
 {
 	struct drm_gem_object *obj;
@@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int msm_gem_new_impl(struct drm_device *dev,
-		uint32_t size, uint32_t flags,
-		struct drm_gem_object **obj)
+static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
+			    struct drm_gem_object **obj)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	return 0;
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32_t flags)
+struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, &obj);
+	ret = msm_gem_new_impl(dev, flags, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
-	uint32_t size;
+	size_t size;
 	int ret, npages;
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
+	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 751c3b4965bc..a4cf31853c50 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+		size_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+		size_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
-- 
2.50.1

