Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4987BB8CC
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 15:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EE210E4F6;
	Fri,  6 Oct 2023 13:15:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0C10E4E9
 for <freedreno@lists.freedesktop.org>; Fri,  6 Oct 2023 13:15:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5033918c09eso2691328e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Oct 2023 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696598098; x=1697202898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
 b=oQAWUHqgSR4qkasSmc6yBOvNWytY6jSUhgswtP4qJzLSSlWQklax/gQq6hgOnt2ntj
 wrLpo6nX9GXe8+ppyg2S5SY8V6s4vU3ZDj3YDrC3rWSbA9cKFx9k0KpsqFd2kkFqITNH
 sYxo+F4H2LvP8DucI4bYdNKOpK9+lYkmwK3ZgH2inu/RhNVO8Yy5TOHyldBMTTIWVviH
 hRZx/WGrWJLNfwhhZzPXxpAAgJz4saR5j1lAo50ajtDQz4w4bfZ6viUPsM4b8ToAXrIw
 X0y90K/6oOvYPaMTxLhqFCoizfOXtK4AFlqOkt0+5XylHUOirCOh1LGlVD4cykGuOC/+
 13VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598098; x=1697202898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
 b=EwNXSCIPhRid+rA2aNxQZqS1Ei9xUePXWxI/1f60XvIILJOPtP1FKa011XEr+wEC3M
 vSqxiBuBsYSlSezm307yGegkHEBH54B7kBSO48JeqAFxHwF2YadJ4PWgXFBdV7JIC2oM
 fpfzQDPNwYfcKhVIglIWPlcJcqzrNVzz9BdHgCN4KrqUktRs23YOB8B6P3KT79v1ESix
 m3tKMmty5ssw7ko8PAfi1KLklJQn2ze6MHAEJR5zzJEhmJfsAWtoCfXwDgf579smXJ8v
 4sQZdVhSj4EyjaZ9wOy+J/HZInWOzfeTWAUNBGol+bsV6YU1BBAI9yGc0l9b+EUtedRw
 OabQ==
X-Gm-Message-State: AOJu0YwYeTAqdmD0PHjyxPWwlq/4/l4k7S0rFNAvUag7J8o/qDbB9zzS
 mnirOo1QulmtStYwo8S2YaB5Pg==
X-Google-Smtp-Source: AGHT+IHE2FyzNcrKHkVaynk0WbV6tf0To7tYw1CaUf9mbDynfP5XagW+DdMNn9k6qlOmzZlebP2R+g==
X-Received: by 2002:a05:6512:3450:b0:501:c3ee:62ec with SMTP id
 j16-20020a056512345000b00501c3ee62ecmr5851622lfr.12.1696598098430; 
 Fri, 06 Oct 2023 06:14:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:14:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 16:14:48 +0300
Message-Id: <20231006131450.2436688-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 08/10] drm/msm/dpu: rewrite scaler and CSC
 presense checks
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

In order to check whether the SSPP block has scaler and CSC subblocks
the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
all possible scaler and CSC features. Replace those checks with the
scaler and CSC subblock length checks in order to be able to drop those
two macros.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ca02f86c94ed..d1480ff2574a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -21,21 +21,6 @@ struct dpu_hw_sspp;
 #define DPU_SSPP_ROT_90			BIT(3)
 #define DPU_SSPP_SOLID_FILL		BIT(4)
 
-/**
- * Define all scaler feature bits in catalog
- */
-#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
-			 BIT(DPU_SSPP_SCALER_QSEED2) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
-			 BIT(DPU_SSPP_SCALER_QSEED4))
-
-/*
- * Define all CSC feature bits in catalog
- */
-#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
-			  BIT(DPU_SSPP_CSC_10BIT))
-
 /**
  * Component indices
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..43135894263c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -740,8 +740,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-	    (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
-	     !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
+	     !pipe->sspp->cap->sblk->csc_blk.len)) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.39.2

