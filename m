Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529CF7474DF
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 17:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB99810E2EF;
	Tue,  4 Jul 2023 15:04:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0D10E2E7
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:08 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b5c2433134so71909511fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483046; x=1691075046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xZk5vPk29uIzS1RfjK4BQWFnQ4bvdjXpPHBXHvz4II=;
 b=NYmiUxpvSBe4mTOK8eLkgFsavb3DP2IC2R4Qi1euCOF3BQjEU+n02DzCTCerxqyiKc
 axiNoOfGlOwEwEh7j4LoM0FEl8qRwQj9E1ngesL1BlJAqVpG3Zfo9cEHyhYpgDBx6nEk
 Er6HTxocnXgjch+Fx8VeT6mBmxjveQ9m0ST7bEq/bvLaAzx+EwJaZbSgbgLVbXJoLn+Z
 NQru2E4W+9Xi2j9e4AVhZnsOqJZ3oi0oas11lMWTXItbQlxf8z2rTdGtGLHT7kUwtXc9
 FCO/fx7dsyKoZH2AtdevK9UuLLt5PophfiFO10Styur0sAl8JvpqLSmah3K8cyZAarnT
 aIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483046; x=1691075046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xZk5vPk29uIzS1RfjK4BQWFnQ4bvdjXpPHBXHvz4II=;
 b=Egkzd82PV/11wZwuTQ1zLn9xhHlsqkbtD0Pxpvf9y3q16e7oPRqHxHn/A7VJDWhkrD
 xN7Ruq6w8EvFi/TgP8y3oVdoiyOUi/xOkB5F/9gf2BhNeUZNBeSsNzw80lGRwP1dr7h2
 6XhSGjDY+zzvUzKDZlOIh8vGu7jan5V1KTKfSPSBOOCe6MGEysNKbjtdHKMtQhz6+pUk
 vRJORgUWAXwvDAclUwWa+vaEvk4vy69udiWx4VXz5FDROQfSA03yEmH5NKlp+q3xfg07
 4uM9yMdlIlJjpQJXzeuJ93f2GYRciu0gtSzCXaWH+40C0lZiJlGx3v3fUW51hNCoeWtb
 M9ug==
X-Gm-Message-State: ABy/qLbSe2f44i2mYxdISmwK6zd/e/bIVUB9LsQ8tFHwTmxhfxuwD5t6
 W9n3IgMs1Eo/fswwtqYnC/vxvA==
X-Google-Smtp-Source: APBJJlGlVAmws/zMk7QPQqjvFWIeZD/9Vb6AMtK23TVaTRNSUSWpkJJOJAyRpJOGtp+pssjCwgW/Pg==
X-Received: by 2002:a2e:8951:0:b0:2b5:8b02:1000 with SMTP id
 b17-20020a2e8951000000b002b58b021000mr5575166ljk.8.1688483046494; 
 Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  4 Jul 2023 18:03:54 +0300
Message-Id: <20230704150354.159882-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 14/14] drm/msm/dpu: drop
 dpu_core_perf_destroy()
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This function does nothing, just clears several data pointers. Drop it
now.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 608c915a2cab..4b8127932e13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -408,16 +408,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 }
 #endif
 
-void dpu_core_perf_destroy(struct dpu_core_perf *perf)
-{
-	if (!perf) {
-		DPU_ERROR("invalid parameters\n");
-		return;
-	}
-
-	perf->max_core_clk_rate = 0;
-}
-
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index df1fcf28f2a9..a5a9c3389718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -66,12 +66,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
  */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
 
-/**
- * dpu_core_perf_destroy - destroy the given core performance context
- * @perf: Pointer to core performance context
- */
-void dpu_core_perf_destroy(struct dpu_core_perf *perf);
-
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f01b2278c01a..44b0daf70c4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1171,7 +1171,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return 0;
 
 drm_obj_init_err:
-	dpu_core_perf_destroy(&dpu_kms->perf);
 hw_intr_init_err:
 perf_err:
 power_error:
-- 
2.39.2

