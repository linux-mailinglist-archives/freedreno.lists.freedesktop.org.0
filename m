Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DDD801802
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 00:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C910E9AB;
	Fri,  1 Dec 2023 23:44:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF9089954
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bc22c836bso3900513e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474163; x=1702078963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWcZZZAaGrmzvhIYGr1F8oij9MQJmBLTfcfgS98wZVo=;
 b=BEhwBhzgKf6MJaaT4WgjencI8Ah4fprVmAybUSuSoLHKfC37zJ82BvS8VsI8K6Jt4q
 UvXkEsWL3YnSsZV2MYFYOWvrRPf+NDTfszwKAzzuPOti5QtJujUDKoUJDQkZyoHWbYep
 FWvg9/nS2j5qpkiZftMhyH9ENDPVmYubIg8KGtvVoEG3bYYS8wX47H2XIORSLcHWI5EZ
 p6EXMtD4bnikVL44mW7cpjRVSDm5SDBt7iS7fuGZ6CgGQN5Wifh/6gla+eI8WdcVz99B
 uz3+VfWjQaBqINEHtoKiYU7OV8wVkJUpRz+x89qFIIgesPeTVQro9N5G69eFnVK50oS+
 RmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474163; x=1702078963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fWcZZZAaGrmzvhIYGr1F8oij9MQJmBLTfcfgS98wZVo=;
 b=nsUI5U5KrEotKwyCg3X0Xc/pA8yxxe9iyDLwmod69pGXFQ4Ek8Gqzv8ZswwcRstuO5
 q6hwi7MKpgBrvm12OfsTxNdAyXpKkJIpwHtWHDa33pB69q1SESoVok3yVsycsp8AKh/n
 f+0fs3TJDlV5ai7kN6bfSCgbxLfQkhpiziRSgx9HCYucD8uJnZsr/KkMQnI8UnAgPCcc
 +DTEoWSgI95Tcw0Nm786bySBOI8mIWGRdRsSPFtdgIid29OzoaSDXGFbeuoKuggx4UXv
 uxZuheC65s0e8OXRIhY1Vu0FNMeMx3qyTpZmHmNxhuZyxMbCx2Qxkg9ugh4B/OTMo91e
 R4Cg==
X-Gm-Message-State: AOJu0YzEfb6LIFGEF42sNaMt6EG+KkdIuGrfVzIyBU2Eh5Z8gnQuQ5t/
 YnNOphZFWsSi4eRmCRy2Lcllsw==
X-Google-Smtp-Source: AGHT+IGuHbWtcV6h3RLPBYHPz4BTUGiDv4nga2VRf9sWBh7RwhqggfpSd38x4ifjJPXxidUuvtacAA==
X-Received: by 2002:ac2:4f05:0:b0:50b:d764:6ec4 with SMTP id
 k5-20020ac24f05000000b0050bd7646ec4mr1940437lfr.116.1701474163526; 
 Fri, 01 Dec 2023 15:42:43 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  2 Dec 2023 01:40:32 +0200
Message-ID: <20231201234234.2065610-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 08/10] drm/msm/dpu: rewrite scaler and CSC
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b094ea23ad32..28e7d53bd191 100644
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
index 3eef5e025e12..121cb0d290ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -774,8 +774,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
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
2.42.0

