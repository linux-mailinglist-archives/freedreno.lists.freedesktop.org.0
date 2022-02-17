Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA8B4B973F
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 04:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599D510E75E;
	Thu, 17 Feb 2022 03:54:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BDA10E75E
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j7so7559300lfu.6
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AdJ+qrckMHTJcRwxA8dkshi8PG6FFViBpmjAV8cCbI=;
 b=YdeBlsi7Cyzf4Eq7wBVPnTETdHlYz6euXzIFkcUr+cR2wdgIgI1YnhPQVMwj0VQQa4
 FZezexG9HiA/r7U7Wrbfo6UVTtfPfAh085oHq0rKVj0zyfhCZvbpGlE60CQccHo8tTNg
 GVvT0+k93R5zSgbiwBcte3drWUZwyPfCQMGiLYxXLwHX5W7kg0gfrPO3YllduuEmZNWJ
 Uyfvl4gPmNpii/3+gmD677VfDLTvosb/dxY03SWkMBEbjjrr27jutKebs0vCzpkMmoDl
 uFAjzc1S1IPfxOGfpAQEfx/1EwCRz/NphQB/n9xYAUMm4eimR5wddnZFGWvwzA7cFA7S
 Bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AdJ+qrckMHTJcRwxA8dkshi8PG6FFViBpmjAV8cCbI=;
 b=KOwGYPCRiqXpkj9PAku2A2kuGXrQTXt4musCCbpVVmLWuKw41WvOwylflOTtv87GKL
 GF0W0r0SiFCC9N4DKaQt7ZJdw+T1GaCaAaLnk5Mbgn3I+7MJmUY9sGKihydoueXujhUi
 Ewdu7MauDsYGgypmRdRQF7LqmsmqLZemqmaH+73LNHDcboxuPpLna+e+Ef8qZR1Jl3Q7
 KSgg2FwztXY0YedhuMKVgVBtICIRNwQOTyzMFbZsirKr9ciSLB5jD86gQRBMjhxK5D6k
 rAciOzAumAARfFYmGTziX5O6G6SmDk9Y+e0NcRiPNGunD5nRYuHXrRgwcpoAPiP9ECSL
 IAyw==
X-Gm-Message-State: AOAM5331PWxSZ70rCCTy2qtdi4riDvhEcliOhdmBZJtZmreC+CObOotO
 kuPW9tqfCazfSkf7zvs85vMluA==
X-Google-Smtp-Source: ABdhPJyFslGnM3IMNPCamQzXQZWO667qKtPpEi0zc/zicfSSW+fwFF20dF3cNkNm6OSOOBid7Ik3mQ==
X-Received: by 2002:a05:6512:481:b0:43d:f703:721e with SMTP id
 v1-20020a056512048100b0043df703721emr803431lfq.55.1645070041209; 
 Wed, 16 Feb 2022 19:54:01 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 06:53:52 +0300
Message-Id: <20220217035358.465904-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/7] drm/msm/dpu: fix dp audio condition
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DP audio enablement code which is comparing intf_type,
DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..02d0fae1c6dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-- 
2.34.1

