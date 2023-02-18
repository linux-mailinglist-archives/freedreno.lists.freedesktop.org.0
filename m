Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B321F69B779
	for <lists+freedreno@lfdr.de>; Sat, 18 Feb 2023 02:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8707610E1FD;
	Sat, 18 Feb 2023 01:25:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3B10F0F5
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 01:25:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t8so3463504lft.11
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 17:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Q97BznUv1mfKjh1AZZa0Dw1OPMlC5jT+voBjRu9BfA=;
 b=w390DS6GdepMHP3EzknAMidgDadaDSNKI4SvFVZbxt8Rx3aEYnPzEE+vNrtfKCGdg9
 okwKQY741PRsxAkqG3pMOp1SFqB29L2vpuX8L/PEjNCSlby+fQKhQEY8tMpMUu9ML7s+
 frWD6yg3laPUPr4mYHtNFHviABEyqNs3YdwyZv1n32Qqa8ZSFISWjWQ8FrX7AyY/1n3S
 sj9ichIBUocvw2H9BwnVOuw2Ufd76wNPYyk+0IEsGMic7K2t9DEy9an+T84BZDtmYoxK
 hUKvybxaReh8eqxlfO6vjsClzYR5N6NwFU7gBSAf7mbHRWCQYL9nCNDzsPQdR+N+8C9j
 MFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Q97BznUv1mfKjh1AZZa0Dw1OPMlC5jT+voBjRu9BfA=;
 b=KBvaklB1/aKusKzhoLbNZP5Gdg9opryC83S1AYZXdZjCWDdBfEIVNSVsmDcOneP006
 f9eVtfyosf+owSm1/Tr2njerRIB6B9l6YpTo7kNegVoaSMPwgWToCwKi1rJVbbhAGfZ7
 3KOcLwHEkVC1/t5Nr6T5CKnxUN3hmhJMCHw0rh4kNBz15m0PfQ8Dztq/XZoLclgalmud
 leeDsB7iRQF30G/uPFKFZkbMQMGRJjud+/8jMAHUY2IPM6pueRPrmINVMfxyhSkxB167
 zwcizrNSV0WKqzU2SzVIPMohKBVWV8oLfTcx02E0PunMTW14xOy2/19TtHBI92Gpl9Ap
 CAgQ==
X-Gm-Message-State: AO0yUKWcl8MsfQJLFeBke31pmN5YmazD4Tx/M6nnx7e3JmpPmz/0y+fm
 J82d0GzVksI8PD55tdOljCxPoQ==
X-Google-Smtp-Source: AK7set+U259Fv3cOjrzdzrO1dq6I6qhFUBuTueybdPfOd9TPfviaxg9n6zW4a1vE7/GdvbxYXnyHNw==
X-Received: by 2002:ac2:50d5:0:b0:4b5:5ddc:da32 with SMTP id
 h21-20020ac250d5000000b004b55ddcda32mr163141lfm.56.1676683549715; 
 Fri, 17 Feb 2023 17:25:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j11-20020a19f50b000000b004d85f2acd8esm826414lfb.295.2023.02.17.17.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 17:25:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Feb 2023 03:25:46 +0200
Message-Id: <20230218012546.3655999-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
References: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm: simplify msm_parse_deps() and
 msm_parse_post_deps()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Simplify two functions msm_parse_deps() and msm_parse_post_deps():
extract single item parsing function and clean up error path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 196 +++++++++++++++------------
 1 file changed, 106 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a539eb31042f..c64907f0f249 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -546,6 +546,46 @@ struct msm_submit_post_dep {
 	struct dma_fence_chain *chain;
 };
 
+static struct drm_syncobj *msm_parse_dep_one(struct msm_gem_submit *submit,
+					     struct drm_file *file,
+					     uint64_t address,
+					     size_t syncobj_stride)
+{
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+	struct dma_fence *fence;
+	struct drm_syncobj *syncobj = NULL;
+	int ret;
+
+	if (copy_from_user(&syncobj_desc,
+			   u64_to_user_ptr(address),
+			   min(syncobj_stride, sizeof(syncobj_desc))))
+		return ERR_PTR(-EFAULT);
+
+	if (syncobj_desc.point &&
+	    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS)
+		return ERR_PTR(-EINVAL);
+
+	ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
+				     syncobj_desc.point, 0, &fence);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_sched_job_add_dependency(&submit->base, fence);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
+		syncobj = drm_syncobj_find(file, syncobj_desc.handle);
+		if (!syncobj)
+			return ERR_PTR(-EINVAL);
+	}
+
+	return syncobj;
+}
+
 static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
@@ -553,9 +593,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
+	int ret;
+	int i;
 
 	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
 	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
@@ -564,54 +603,26 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 	for (i = 0; i < nr_in_syncobjs; ++i) {
 		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-		struct dma_fence *fence;
+		struct drm_syncobj *syncobj;
 
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = -EOPNOTSUPP;
-			break;
+		syncobj = msm_parse_dep_one(submit, file, address, syncobj_stride);
+		if (IS_ERR(syncobj)) {
+			ret = PTR_ERR(syncobj);
+			goto err;
 		}
 
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -EINVAL;
-			break;
-		}
-
-		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
-		                             syncobj_desc.point, 0, &fence);
-		if (ret)
-			break;
-
-		ret = drm_sched_job_add_dependency(&submit->base, fence);
-		if (ret)
-			break;
-
-		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
-			syncobjs[i] =
-				drm_syncobj_find(file, syncobj_desc.handle);
-			if (!syncobjs[i]) {
-				ret = -EINVAL;
-				break;
-			}
-		}
+		syncobjs[i] = syncobj;
 	}
 
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			if (syncobjs[j])
-				drm_syncobj_put(syncobjs[j]);
-		}
-		kfree(syncobjs);
-		return ERR_PTR(ret);
-	}
 	return syncobjs;
+
+err:
+	while (--i >= 0)
+		if (syncobjs[i])
+			drm_syncobj_put(syncobjs[i]);
+	kfree(syncobjs);
+
+	return ERR_PTR(ret);
 }
 
 static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
@@ -625,6 +636,43 @@ static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
 	}
 }
 
+static int msm_parse_post_dep_one(struct drm_device *dev,
+				  struct drm_file *file,
+				  uint64_t address,
+				  size_t syncobj_stride,
+				  struct msm_submit_post_dep *post_dep)
+{
+	struct msm_submit_post_dep *post_deps;
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+
+	if (copy_from_user(&syncobj_desc,
+			   u64_to_user_ptr(address),
+			   min(syncobj_stride, sizeof(syncobj_desc))))
+		return -EFAULT;
+
+	post_dep->point = syncobj_desc.point;
+
+	if (syncobj_desc.flags)
+		return -EINVAL;
+
+	if (syncobj_desc.point) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+
+		post_dep->chain = dma_fence_chain_alloc();
+		if (!post_dep->chain)
+			return -ENOMEM;
+	}
+
+	post_dep->syncobj = drm_syncobj_find(file, syncobj_desc.handle);
+	if (!post_dep->syncobj) {
+		dma_fence_chain_free(post_deps->chain);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
                                                        struct drm_file *file,
                                                        uint64_t syncobjs_addr,
@@ -632,9 +680,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
                                                        size_t syncobj_stride)
 {
 	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
 	int ret = 0;
-	uint32_t i, j;
+	int i;
 
 	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
 			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
@@ -644,54 +691,23 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 	for (i = 0; i < nr_syncobjs; ++i) {
 		uint64_t address = syncobjs_addr + i * syncobj_stride;
 
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		post_deps[i].point = syncobj_desc.point;
-
-		if (syncobj_desc.flags) {
-			ret = -EINVAL;
-			break;
-		}
-
-		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = -EOPNOTSUPP;
-				break;
-			}
-
-			post_deps[i].chain = dma_fence_chain_alloc();
-			if (!post_deps[i].chain) {
-				ret = -ENOMEM;
-				break;
-			}
-		}
-
-		post_deps[i].syncobj =
-			drm_syncobj_find(file, syncobj_desc.handle);
-		if (!post_deps[i].syncobj) {
-			ret = -EINVAL;
-			break;
-		}
+		ret = msm_parse_post_dep_one(dev, file, address, syncobj_stride, &post_deps[i]);
+		if (ret)
+			goto err;
 	}
 
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			dma_fence_chain_free(post_deps[j].chain);
-			if (post_deps[j].syncobj)
-				drm_syncobj_put(post_deps[j].syncobj);
-		}
+	return post_deps;
 
-		kfree(post_deps);
-		return ERR_PTR(ret);
+err:
+	while (--i >= 0) {
+		dma_fence_chain_free(post_deps[i].chain);
+		if (post_deps[i].syncobj)
+			drm_syncobj_put(post_deps[i].syncobj);
 	}
 
-	return post_deps;
+	kfree(post_deps);
+
+	return ERR_PTR(ret);
 }
 
 static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
-- 
2.39.1

