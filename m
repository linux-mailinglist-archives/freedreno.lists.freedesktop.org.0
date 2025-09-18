Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B21B82CEB
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 05:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC310E02E;
	Thu, 18 Sep 2025 03:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH3TuDoW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A867210E02E
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3GaoC010782
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q8pEieLnnU1CR6YLMZOp6lmhyubXHH1VH3gcTO5X+f4=; b=dH3TuDoWiSXVbSFM
 T2tmZhn9MqujfdqFPPpztJu+baP3/ewxsSB3T1GMYNMV30AxM49s9fFwvBca1aBq
 IaK5z+G9aZywNRtX0bdDUCNOOxJ5JR2v8W77L7eqWBcfX9MBSQrjBJfbebcav+eA
 xNcEwFAjwzp2czMh4yku6BJWpqg4ZoReOwnMVUcxHx0ppqvFChQ9DP9KN594E/Yi
 G2zckEko+atY3lHzXS9GM9891M9yYiV0Ut8yQn2cuJtoaMEZhM34tcU5xC5vIX4d
 NdI0lFgVwRZ4rHKtsHmx4cHpajKkAnOKxNp5RTYNEw0D+jquDGNmmYJeigt4z9bf
 9YGF5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxvswt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-78e831e5a42so10991256d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167488; x=1758772288;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8pEieLnnU1CR6YLMZOp6lmhyubXHH1VH3gcTO5X+f4=;
 b=CHYkfbLfZLod3aPsgm+jeIh9Z/ujThNJ7SnhFbwC41eqC7m0ia7VqqVamzVWjilH+e
 RA3uQAg9uYe55RToAuU5IhtMNdJ/ISfCHXLgMZNWn5GsecxuDqYeA9PKrxt/IbWjWLm8
 XyqABwEm7609vE9ddSOMaWA3yN0dbqeQOQ7TuyNuWGcLizYl2fn8FZc9kFyM/J9yn/9W
 x+2+bwTINCgYnC386fDTstVB5COskOWVRA3W7he1Um2qQlyQ7EQ1AtJ00vNxToZW2a5n
 s2jBTTTansSV5hiskI6sgkN/xzOTy1kan2jhvd0XnvZxS7YwHZpkcwhScvzVt/aXsE9r
 6UFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW36eV6B9mLCgpWe+XZ8OnyDHxJRiSLI9waAt7vNcnK/4V8lbmj4JQWA0dJiwz9EeaUioyaG4cAk+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX96PjjUap5s1OEdY01LBHTOeLfSvKt6iGoiSPdpZpop88UOxE
 WSnPBa6QPbuk0lPkbQ+4L5GvrFOalur6Q1gFcutuEyC5BAF+KCQHVpQa1unyz3y8XQZiLiZ36c0
 /sRvDKz87Ay2i5w9zkVCC9UL8jo4B3YOjNPX785dZ4QOFcY8CXMDJWYYeVmh2lu2zPiv4y0E=
X-Gm-Gg: ASbGnctiU+Zuv2TK19/luQa4hPe6vNKggzuO1b4DKH06TwA4NvWb+bLC88UnepPC7V5
 eraNMAZ8FAB8XqKQ+tI2iCDJcwQJRbIPyf+kHSCjNmP4HG2ETLdpU8NUAjJaqrljUGgKDlKZR67
 ou9LPXqfXv9TK8KKhxvxhxaesOTcjJdBSojGM3k8YYUiTV03e5yPIxYjb58QcTeRvDzCNvEZXnu
 Z6K3RfnLBTkjIWRZcOqZw5wFh0PC1EUzud5asDNWoaefeKHIbs1i9t//9GWNpZk0GbdOSSxYHhM
 1RvZCKKqjIEo4XNqdQ6dmIccEDpRnSMKykcSkQZC4TNj4uxWKIyBA/vi7yS4Sc0UIDxf0hU1IL1
 ycvx0B9laUknPRzH6/xHdrlvtnlnSs+0SvJRZcaO2zuNdA1/L624z
X-Received: by 2002:ad4:5dc9:0:b0:786:dc95:7b4a with SMTP id
 6a1803df08f44-78eced25f39mr65169826d6.54.1758167487131; 
 Wed, 17 Sep 2025 20:51:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk/rb/tJOsKEcrAB5A+o45s/d3UOtqhZMhqpsdkKnv6gTG6h9rL4DnyqnG624CqyYFXl5Yzw==
X-Received: by 2002:ad4:5dc9:0:b0:786:dc95:7b4a with SMTP id
 6a1803df08f44-78eced25f39mr65169496d6.54.1758167486526; 
 Wed, 17 Sep 2025 20:51:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:25 +0300
Subject: [PATCH v5 4/5] drm/msm: split debugfs implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-4-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27511;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cmVxIwbHXyzCxztNllALNU3duros/7BQgMvQkbzx8bQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GuGcdpmEy/pGL9w9rvSE5CHL+zimvCyKBB+
 DLVnwrgkiCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrgAKCRCLPIo+Aiko
 1cFsB/4yA56bEtwMPsMlFx0csJkuDGK0c3DUaO4jNIDcL0iXAc8xh85z6TOJHbFqMLWDan0gO8c
 7N1o8xgkK0fW1meKT40pWpvvt67trgDpjq8f+tUa1zf1XuUUfYDsmI1/hvZ5/YsGBdOaGLm/vkV
 dLl9M+MLVXCWwWpwKppEKlip+F3fmgTdrdbIphBByoIT8ZvDgUWxKP6zRAu2mxLr8QlMalEQuCE
 SsDcZBj0iXvddyI6e5J/ph303EcyS0DwyoT1eQ+qXlFLaOa0C2niRY0kEmuQVdvj7NSvsODx5Qe
 q1anV5s27c14hrGRMEVUxHVmM32G619ZAgpHc8FN4/FeYizI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9WQS9IrEl1h6
 6ynG1nL69qyeKGdIqCZeJRzoCIHoz93oGNqS4iNXlHZfu3IF0af3yXFTOpgjEfOcGBis8zod8uI
 gnJMJdC6HJLH05ieiXCjEDWG6p5jTeIy+XsMIkSzxCrTKB6FXTuTy40FlXYOpIv4GvFJ3U3I9ET
 186PTck/2SFIJG+LWLd6/VM5BYVJ8cfn2fxWflqEOraR/vR5QROnTZmD88N6NHYYWI740k7Ucxh
 KS34YmMqMXUT85BLF01vqYWvMp6T0dcyUtrrRVGEd2YwHo3AM3o4Ao5w06POhXN5cA1c0o2AEt8
 MAXKLAqVcx50HG7EcCb1YG0SkQ5CfhmdK2BE9CldPPqMDnXw/FAfuZv+PaFN2MyyqGhN1fXyQL4
 ZOCAu058
X-Proofpoint-ORIG-GUID: MysBaMd84TCoAVya5B35MUkekeSA63d-
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cb81c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tnbKlc_mvaWQH_wKN8AA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: MysBaMd84TCoAVya5B35MUkekeSA63d-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

In preparation for making the GPU supporting code optional split the
debugfs code into three main pieces: GEM (always enabled), KMS (only
enabled if KMS driver parts are enabled) and GPU (currently always
enabled, will become optional later).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |   4 +-
 drivers/gpu/drm/msm/msm_debugfs.c     | 420 ----------------------------------
 drivers/gpu/drm/msm/msm_debugfs.h     |  14 --
 drivers/gpu/drm/msm/msm_drv.c         |  21 +-
 drivers/gpu/drm/msm/msm_drv.h         |   4 +-
 drivers/gpu/drm/msm/msm_gem.h         |   8 +
 drivers/gpu/drm/msm/msm_gem_debugfs.c |  96 ++++++++
 drivers/gpu/drm/msm/msm_gpu_debugfs.c | 213 +++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h         |   8 +
 drivers/gpu/drm/msm/msm_kms_debugfs.c | 129 +++++++++++
 10 files changed, 476 insertions(+), 441 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0ac977a6ed01d91111d706995f341ced29f5ca8d..a475479fe201cb03937d30ee913c2e178675384e 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -107,10 +107,10 @@ msm-display-$(CONFIG_DRM_MSM_KMS) += \
 	disp/msm_disp_snapshot_util.o \
 
 msm-y += \
-	msm_debugfs.o \
 	msm_drv.o \
 	msm_fence.o \
 	msm_gem.o \
+	msm_gem_debugfs.o \
 	msm_gem_prime.o \
 	msm_gem_shrinker.o \
 	msm_gem_submit.o \
@@ -118,6 +118,7 @@ msm-y += \
 	msm_gem_vm_bind.o \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
+	msm_gpu_debugfs.o \
 	msm_io_utils.o \
 	msm_ioctl.o \
 	msm_iommu.o \
@@ -133,6 +134,7 @@ msm-$(CONFIG_DRM_MSM_KMS) += \
 	msm_atomic_tracepoints.o \
 	msm_fb.o \
 	msm_kms.o \
+	msm_kms_debugfs.o \
 
 msm-$(CONFIG_DRM_MSM_KMS_FBDEV) += msm_fbdev.o
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
deleted file mode 100644
index 97dc70876442f9aa932677edbed5d26f6095e7ee..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ /dev/null
@@ -1,420 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013-2016 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#ifdef CONFIG_DEBUG_FS
-
-#include <linux/debugfs.h>
-#include <linux/fault-inject.h>
-
-#include <drm/drm_debugfs.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_file.h>
-#include <drm/drm_framebuffer.h>
-
-#include "msm_drv.h"
-#include "msm_gpu.h"
-#include "msm_kms.h"
-#include "msm_debugfs.h"
-#include "disp/msm_disp_snapshot.h"
-
-/*
- * GPU Snapshot:
- */
-
-struct msm_gpu_show_priv {
-	struct msm_gpu_state *state;
-	struct drm_device *dev;
-};
-
-static int msm_gpu_show(struct seq_file *m, void *arg)
-{
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct msm_gpu_show_priv *show_priv = m->private;
-	struct msm_drm_private *priv = show_priv->dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
-	int ret;
-
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		return ret;
-
-	drm_printf(&p, "%s Status:\n", gpu->name);
-	gpu->funcs->show(gpu, show_priv->state, &p);
-
-	mutex_unlock(&gpu->lock);
-
-	return 0;
-}
-
-static int msm_gpu_release(struct inode *inode, struct file *file)
-{
-	struct seq_file *m = file->private_data;
-	struct msm_gpu_show_priv *show_priv = m->private;
-	struct msm_drm_private *priv = show_priv->dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
-
-	mutex_lock(&gpu->lock);
-	gpu->funcs->gpu_state_put(show_priv->state);
-	mutex_unlock(&gpu->lock);
-
-	kfree(show_priv);
-
-	return single_release(inode, file);
-}
-
-static int msm_gpu_open(struct inode *inode, struct file *file)
-{
-	struct drm_device *dev = inode->i_private;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
-	int ret;
-
-	if (!gpu || !gpu->funcs->gpu_state_get)
-		return -ENODEV;
-
-	show_priv = kmalloc(sizeof(*show_priv), GFP_KERNEL);
-	if (!show_priv)
-		return -ENOMEM;
-
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
-
-	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
-	}
-
-	show_priv->dev = dev;
-
-	ret = single_open(file, msm_gpu_show, show_priv);
-	if (ret)
-		goto free_priv;
-
-	return 0;
-
-free_priv:
-	kfree(show_priv);
-	return ret;
-}
-
-static const struct file_operations msm_gpu_fops = {
-	.owner = THIS_MODULE,
-	.open = msm_gpu_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = msm_gpu_release,
-};
-
-#ifdef CONFIG_DRM_MSM_KMS
-static int msm_fb_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_framebuffer *fb, *fbdev_fb = NULL;
-
-	if (dev->fb_helper && dev->fb_helper->fb) {
-		seq_puts(m, "fbcon ");
-		fbdev_fb = dev->fb_helper->fb;
-		msm_framebuffer_describe(fbdev_fb, m);
-	}
-
-	mutex_lock(&dev->mode_config.fb_lock);
-	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
-		if (fb == fbdev_fb)
-			continue;
-
-		seq_puts(m, "user ");
-		msm_framebuffer_describe(fb, m);
-	}
-	mutex_unlock(&dev->mode_config.fb_lock);
-
-	return 0;
-}
-
-static struct drm_info_list msm_kms_debugfs_list[] = {
-		{ "fb", msm_fb_show },
-};
-
-/*
- * Display Snapshot:
- */
-
-static int msm_kms_show(struct seq_file *m, void *arg)
-{
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct msm_disp_state *state = m->private;
-
-	msm_disp_state_print(state, &p);
-
-	return 0;
-}
-
-static int msm_kms_release(struct inode *inode, struct file *file)
-{
-	struct seq_file *m = file->private_data;
-	struct msm_disp_state *state = m->private;
-
-	msm_disp_state_free(state);
-
-	return single_release(inode, file);
-}
-
-static int msm_kms_open(struct inode *inode, struct file *file)
-{
-	struct drm_device *dev = inode->i_private;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_disp_state *state;
-	int ret;
-
-	if (!priv->kms)
-		return -ENODEV;
-
-	ret = mutex_lock_interruptible(&priv->kms->dump_mutex);
-	if (ret)
-		return ret;
-
-	state = msm_disp_snapshot_state_sync(priv->kms);
-
-	mutex_unlock(&priv->kms->dump_mutex);
-
-	if (IS_ERR(state)) {
-		return PTR_ERR(state);
-	}
-
-	ret = single_open(file, msm_kms_show, state);
-	if (ret) {
-		msm_disp_state_free(state);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct file_operations msm_kms_fops = {
-	.owner = THIS_MODULE,
-	.open = msm_kms_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = msm_kms_release,
-};
-
-static void msm_debugfs_kms_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-
-	drm_debugfs_create_files(msm_kms_debugfs_list,
-				 ARRAY_SIZE(msm_kms_debugfs_list),
-				 minor->debugfs_root, minor);
-	debugfs_create_file("kms", 0400, minor->debugfs_root,
-			    dev, &msm_kms_fops);
-
-	if (priv->kms->funcs->debugfs_init)
-		priv->kms->funcs->debugfs_init(priv->kms, minor);
-
-}
-#else /* ! CONFIG_DRM_MSM_KMS */
-static void msm_debugfs_kms_init(struct drm_minor *minor)
-{
-}
-#endif
-
-/*
- * Other debugfs:
- */
-
-static unsigned long last_shrink_freed;
-
-static int
-shrink_get(void *data, u64 *val)
-{
-	*val = last_shrink_freed;
-
-	return 0;
-}
-
-static int
-shrink_set(void *data, u64 val)
-{
-	struct drm_device *dev = data;
-
-	last_shrink_freed = msm_gem_shrinker_shrink(dev, val);
-
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
-			 shrink_get, shrink_set,
-			 "0x%08llx\n");
-
-/*
- * Return the number of microseconds to wait until stall-on-fault is
- * re-enabled. If 0 then it is already enabled or will be re-enabled on the
- * next submit (unless there's a leftover devcoredump). This is useful for
- * kernel tests that intentionally produce a fault and check the devcoredump to
- * wait until the cooldown period is over.
- */
-
-static int
-stall_reenable_time_get(void *data, u64 *val)
-{
-	struct msm_drm_private *priv = data;
-	unsigned long irq_flags;
-
-	spin_lock_irqsave(&priv->fault_stall_lock, irq_flags);
-
-	if (priv->stall_enabled)
-		*val = 0;
-	else
-		*val = max(ktime_us_delta(priv->stall_reenable_time, ktime_get()), 0);
-
-	spin_unlock_irqrestore(&priv->fault_stall_lock, irq_flags);
-
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(stall_reenable_time_fops,
-			 stall_reenable_time_get, NULL,
-			 "%lld\n");
-
-static int msm_gem_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
-
-	ret = mutex_lock_interruptible(&priv->obj_lock);
-	if (ret)
-		return ret;
-
-	msm_gem_describe_objects(&priv->objects, m);
-
-	mutex_unlock(&priv->obj_lock);
-
-	return 0;
-}
-
-static int msm_mm_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
-
-	return 0;
-}
-
-static struct drm_info_list msm_debugfs_list[] = {
-		{"gem", msm_gem_show},
-		{ "mm", msm_mm_show },
-};
-
-static int late_init_minor(struct drm_minor *minor)
-{
-	struct drm_device *dev;
-	struct msm_drm_private *priv;
-	int ret;
-
-	if (!minor)
-		return 0;
-
-	dev = minor->dev;
-	priv = dev->dev_private;
-
-	if (!priv->gpu_pdev)
-		return 0;
-
-	ret = msm_rd_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install rd debugfs\n");
-		return ret;
-	}
-
-	ret = msm_perf_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not install perf debugfs\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-int msm_debugfs_late_init(struct drm_device *dev)
-{
-	int ret;
-	ret = late_init_minor(dev->primary);
-	if (ret)
-		return ret;
-	ret = late_init_minor(dev->render);
-	return ret;
-}
-
-static void msm_debugfs_gpu_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct dentry *gpu_devfreq;
-
-	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
-		dev, &msm_gpu_fops);
-
-	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
-		&priv->hangcheck_period);
-
-	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
-		&priv->disable_err_irq);
-
-	debugfs_create_file("stall_reenable_time_us", 0400, minor->debugfs_root,
-		priv, &stall_reenable_time_fops);
-
-	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
-
-	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
-			    &priv->gpu_clamp_to_idle);
-
-	debugfs_create_u32("upthreshold",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.upthreshold);
-
-	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.downdifferential);
-}
-
-void msm_debugfs_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-
-	drm_debugfs_create_files(msm_debugfs_list,
-				 ARRAY_SIZE(msm_debugfs_list),
-				 minor->debugfs_root, minor);
-
-	if (priv->gpu_pdev)
-		msm_debugfs_gpu_init(minor);
-
-	if (priv->kms)
-		msm_debugfs_kms_init(minor);
-
-	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
-		dev, &shrink_fops);
-
-	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
-				  &fail_gem_alloc);
-	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
-				  &fail_gem_iova);
-}
-#endif
-
diff --git a/drivers/gpu/drm/msm/msm_debugfs.h b/drivers/gpu/drm/msm/msm_debugfs.h
deleted file mode 100644
index ef58f66abbb341eccfbfeff9d759141e30ccc937..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/msm_debugfs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 Red Hat
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#ifndef __MSM_DEBUGFS_H__
-#define __MSM_DEBUGFS_H__
-
-#ifdef CONFIG_DEBUG_FS
-void msm_debugfs_init(struct drm_minor *minor);
-#endif
-
-#endif /* __MSM_DEBUGFS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ba984cc71d1d3aa341e0f4532b7093adcd25d3b0..28a5da1d1391f6c3cb2bfd175154016f8987b752 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -15,7 +15,6 @@
 #include <drm/drm_of.h>
 
 #include "msm_drv.h"
-#include "msm_debugfs.h"
 #include "msm_gpu.h"
 #include "msm_ioctl.h"
 #include "msm_kms.h"
@@ -64,6 +63,22 @@ bool msm_gpu_no_components(void)
 	return separate_gpu_kms;
 }
 
+#ifdef CONFIG_DEBUG_FS
+static void msm_debugfs_late_init(struct drm_device *dev)
+{
+	msm_gpu_debugfs_late_init(dev);
+}
+
+static void msm_debugfs_init(struct drm_minor *minor)
+{
+	msm_gpu_debugfs_init(minor);
+
+	msm_kms_debugfs_init(minor);
+
+	msm_gem_debugfs_init(minor);
+}
+#endif
+
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -171,9 +186,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	if (ret)
 		goto err_msm_uninit;
 
-	ret = msm_debugfs_late_init(ddev);
-	if (ret)
-		goto err_msm_uninit;
+	msm_debugfs_late_init(ddev);
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1aebdf90e4389ef7ecdf5721d910a5..646ddf2c320ac94ff7b0f5c21dab60fe777a10bf 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -436,7 +436,8 @@ static inline void msm_mdss_unregister(void) {}
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
-int msm_debugfs_late_init(struct drm_device *dev);
+void msm_gpu_debugfs_init(struct drm_minor *minor);
+void msm_gpu_debugfs_late_init(struct drm_device *dev);
 int msm_rd_debugfs_init(struct drm_minor *minor);
 void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
 __printf(3, 4)
@@ -445,7 +446,6 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 int msm_perf_debugfs_init(struct drm_minor *minor);
 void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
 #else
-static inline int msm_debugfs_late_init(struct drm_device *dev) { return 0; }
 __printf(3, 4)
 static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
 			struct msm_gem_submit *submit,
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c5008e171c3ad72cde1004c60fe5212..3a0086a883a2c2e57b01a5add17be852f2877865 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -498,4 +498,12 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
+#ifdef CONFIG_DEBUG_FS
+void msm_gem_debugfs_init(struct drm_minor *minor);
+#else
+static inline void msm_gem_debugfs_init(struct drm_minor *minor)
+{
+}
+#endif
+
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gem_debugfs.c b/drivers/gpu/drm/msm/msm_gem_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..1e7fccb17479d80cb6fae90490f53148190a4417
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_gem_debugfs.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2016 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+#include <linux/fault-inject.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+
+#include "msm_gem.h"
+
+/*
+ * Other debugfs:
+ */
+
+static unsigned long last_shrink_freed;
+
+static int
+shrink_get(void *data, u64 *val)
+{
+	*val = last_shrink_freed;
+
+	return 0;
+}
+
+static int
+shrink_set(void *data, u64 val)
+{
+	struct drm_device *dev = data;
+
+	last_shrink_freed = msm_gem_shrinker_shrink(dev, val);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
+			 shrink_get, shrink_set,
+			 "0x%08llx\n");
+
+static int msm_gem_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	int ret;
+
+	ret = mutex_lock_interruptible(&priv->obj_lock);
+	if (ret)
+		return ret;
+
+	msm_gem_describe_objects(&priv->objects, m);
+
+	mutex_unlock(&priv->obj_lock);
+
+	return 0;
+}
+
+static int msm_mm_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
+
+	return 0;
+}
+
+static struct drm_info_list msm_debugfs_list[] = {
+		{"gem", msm_gem_show},
+		{ "mm", msm_mm_show },
+};
+
+void msm_gem_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+
+	drm_debugfs_create_files(msm_debugfs_list,
+				 ARRAY_SIZE(msm_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	debugfs_create_file("shrink", 0700, minor->debugfs_root,
+		dev, &shrink_fops);
+
+	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
+				  &fail_gem_alloc);
+	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
+				  &fail_gem_iova);
+}
+#endif
+
diff --git a/drivers/gpu/drm/msm/msm_gpu_debugfs.c b/drivers/gpu/drm/msm/msm_gpu_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..7a070160ddac711a1c731a4fb7fb099b8dfcdc01
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_gpu_debugfs.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2016 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+#include <linux/fault-inject.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_framebuffer.h>
+
+#include "msm_drv.h"
+#include "msm_gpu.h"
+#include "msm_kms.h"
+#include "disp/msm_disp_snapshot.h"
+
+/*
+ * GPU Snapshot:
+ */
+
+struct msm_gpu_show_priv {
+	struct msm_gpu_state *state;
+	struct drm_device *dev;
+};
+
+static int msm_gpu_show(struct seq_file *m, void *arg)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct msm_gpu_show_priv *show_priv = m->private;
+	struct msm_drm_private *priv = show_priv->dev->dev_private;
+	struct msm_gpu *gpu = priv->gpu;
+	int ret;
+
+	ret = mutex_lock_interruptible(&gpu->lock);
+	if (ret)
+		return ret;
+
+	drm_printf(&p, "%s Status:\n", gpu->name);
+	gpu->funcs->show(gpu, show_priv->state, &p);
+
+	mutex_unlock(&gpu->lock);
+
+	return 0;
+}
+
+static int msm_gpu_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct msm_gpu_show_priv *show_priv = m->private;
+	struct msm_drm_private *priv = show_priv->dev->dev_private;
+	struct msm_gpu *gpu = priv->gpu;
+
+	mutex_lock(&gpu->lock);
+	gpu->funcs->gpu_state_put(show_priv->state);
+	mutex_unlock(&gpu->lock);
+
+	kfree(show_priv);
+
+	return single_release(inode, file);
+}
+
+static int msm_gpu_open(struct inode *inode, struct file *file)
+{
+	struct drm_device *dev = inode->i_private;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_gpu *gpu = priv->gpu;
+	struct msm_gpu_show_priv *show_priv;
+	int ret;
+
+	if (!gpu || !gpu->funcs->gpu_state_get)
+		return -ENODEV;
+
+	show_priv = kmalloc(sizeof(*show_priv), GFP_KERNEL);
+	if (!show_priv)
+		return -ENOMEM;
+
+	ret = mutex_lock_interruptible(&gpu->lock);
+	if (ret)
+		goto free_priv;
+
+	pm_runtime_get_sync(&gpu->pdev->dev);
+	msm_gpu_hw_init(gpu);
+	show_priv->state = gpu->funcs->gpu_state_get(gpu);
+	pm_runtime_put_sync(&gpu->pdev->dev);
+
+	mutex_unlock(&gpu->lock);
+
+	if (IS_ERR(show_priv->state)) {
+		ret = PTR_ERR(show_priv->state);
+		goto free_priv;
+	}
+
+	show_priv->dev = dev;
+
+	ret = single_open(file, msm_gpu_show, show_priv);
+	if (ret)
+		goto free_priv;
+
+	return 0;
+
+free_priv:
+	kfree(show_priv);
+	return ret;
+}
+
+static const struct file_operations msm_gpu_fops = {
+	.owner = THIS_MODULE,
+	.open = msm_gpu_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = msm_gpu_release,
+};
+
+/*
+ * Return the number of microseconds to wait until stall-on-fault is
+ * re-enabled. If 0 then it is already enabled or will be re-enabled on the
+ * next submit (unless there's a leftover devcoredump). This is useful for
+ * kernel tests that intentionally produce a fault and check the devcoredump to
+ * wait until the cooldown period is over.
+ */
+
+static int
+stall_reenable_time_get(void *data, u64 *val)
+{
+	struct msm_drm_private *priv = data;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&priv->fault_stall_lock, irq_flags);
+
+	if (priv->stall_enabled)
+		*val = 0;
+	else
+		*val = max(ktime_us_delta(priv->stall_reenable_time, ktime_get()), 0);
+
+	spin_unlock_irqrestore(&priv->fault_stall_lock, irq_flags);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(stall_reenable_time_fops,
+			 stall_reenable_time_get, NULL,
+			 "%lld\n");
+
+void msm_gpu_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dentry *gpu_devfreq;
+
+	if (!priv->gpu_pdev)
+		return;
+
+	debugfs_create_file("gpu", 0400, minor->debugfs_root,
+			    dev, &msm_gpu_fops);
+
+	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
+			   &priv->hangcheck_period);
+
+	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+			    &priv->disable_err_irq);
+
+	debugfs_create_file("stall_reenable_time_us", 0400, minor->debugfs_root,
+			    priv, &stall_reenable_time_fops);
+
+	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
+
+	debugfs_create_bool("idle_clamp", 0600, gpu_devfreq,
+			    &priv->gpu_clamp_to_idle);
+
+	debugfs_create_u32("upthreshold", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.upthreshold);
+
+	debugfs_create_u32("downdifferential", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.downdifferential);
+}
+
+static void late_init_minor(struct drm_minor *minor)
+{
+	int ret;
+
+	if (!minor)
+		return;
+
+	ret = msm_rd_debugfs_init(minor);
+	if (ret) {
+		drm_err(minor->dev, "could not install rd debugfs\n");
+		return;
+	}
+
+	ret = msm_perf_debugfs_init(minor);
+	if (ret) {
+		drm_err(minor->dev, "could not install perf debugfs\n");
+		return;
+	}
+}
+
+void msm_gpu_debugfs_late_init(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+
+	if (!priv->gpu_pdev)
+		return;
+
+	late_init_minor(dev->primary);
+
+	late_init_minor(dev->render);
+}
+#endif
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 8a7be7b854deea9b763ec45df275fab77d806e44..ce7d73e57ee7e23272ef23a06ae5bc3d35b5bf98 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -240,4 +240,12 @@ static inline void msm_drm_kms_uninit(struct device *dev)
 
 #endif
 
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_KMS)
+void msm_kms_debugfs_init(struct drm_minor *minor);
+#else
+static inline void msm_kms_debugfs_init(struct drm_minor *minor)
+{
+}
+#endif
+
 #endif /* __MSM_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_kms_debugfs.c b/drivers/gpu/drm/msm/msm_kms_debugfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..58975ee220b6f2b2dc581b864b2f22e6c12e7583
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_kms_debugfs.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2016 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifdef CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_framebuffer.h>
+
+#include "msm_drv.h"
+#include "msm_kms.h"
+#include "disp/msm_disp_snapshot.h"
+
+static int msm_fb_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_framebuffer *fb, *fbdev_fb = NULL;
+
+	if (dev->fb_helper && dev->fb_helper->fb) {
+		seq_puts(m, "fbcon ");
+		fbdev_fb = dev->fb_helper->fb;
+		msm_framebuffer_describe(fbdev_fb, m);
+	}
+
+	mutex_lock(&dev->mode_config.fb_lock);
+	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
+		if (fb == fbdev_fb)
+			continue;
+
+		seq_puts(m, "user ");
+		msm_framebuffer_describe(fb, m);
+	}
+	mutex_unlock(&dev->mode_config.fb_lock);
+
+	return 0;
+}
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
+		{ "fb", msm_fb_show },
+};
+
+/*
+ * Display Snapshot:
+ */
+
+static int msm_kms_show(struct seq_file *m, void *arg)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct msm_disp_state *state = m->private;
+
+	msm_disp_state_print(state, &p);
+
+	return 0;
+}
+
+static int msm_kms_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct msm_disp_state *state = m->private;
+
+	msm_disp_state_free(state);
+
+	return single_release(inode, file);
+}
+
+static int msm_kms_open(struct inode *inode, struct file *file)
+{
+	struct drm_device *dev = inode->i_private;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_disp_state *state;
+	int ret;
+
+	if (!priv->kms)
+		return -ENODEV;
+
+	ret = mutex_lock_interruptible(&priv->kms->dump_mutex);
+	if (ret)
+		return ret;
+
+	state = msm_disp_snapshot_state_sync(priv->kms);
+
+	mutex_unlock(&priv->kms->dump_mutex);
+
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	ret = single_open(file, msm_kms_show, state);
+	if (ret) {
+		msm_disp_state_free(state);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct file_operations msm_kms_fops = {
+	.owner = THIS_MODULE,
+	.open = msm_kms_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = msm_kms_release,
+};
+
+void msm_kms_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	if (!priv->kms)
+		return;
+
+	drm_debugfs_create_files(msm_kms_debugfs_list,
+				 ARRAY_SIZE(msm_kms_debugfs_list),
+				 minor->debugfs_root, minor);
+	debugfs_create_file("kms", 0400, minor->debugfs_root,
+			    dev, &msm_kms_fops);
+
+	if (priv->kms->funcs->debugfs_init)
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
+
+}
+#endif

-- 
2.47.3

