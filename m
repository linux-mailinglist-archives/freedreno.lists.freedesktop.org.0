Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F664A805E
	for <lists+freedreno@lfdr.de>; Thu,  3 Feb 2022 09:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601F910EBF1;
	Thu,  3 Feb 2022 08:26:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEEA10EBF1
 for <freedreno@lists.freedesktop.org>; Thu,  3 Feb 2022 08:26:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k13so4328792lfg.9
 for <freedreno@lists.freedesktop.org>; Thu, 03 Feb 2022 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
 b=tN0CX3/x7KyOve+6YH7O2t+7rzfSwiG1JieGaG3cot3ESYYaTQPzOiBTSJcddDGrGu
 6XXmb0J2mgAZP0KUWm0gmibjzp2sQtYdn56B5nzOVLlD0JawY9XHDp3+Tu1NVo7Qiwc7
 g1Yt/9LvRaXH6LVUABbpiVhwWy8CVDf8hfYw7RQXmFJrzEQOX9ODxgIEIonVvZJeiZwN
 jbDXGHwCeyW31ec1X/fr43svDoj4/UweZP4f9ot3pWxNyMAcEnc19LPxC7l3q8h6k926
 B20Zb1t4UzxgGFItkm5VtE5tDMvcAYTKHtR9KFrh8Q/Wsj8q3LyTLwXZ2hB7/YptARIK
 nDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
 b=7ybE4guSE9DTvCtjS1pbUApgM+cHcqxdGO616fduYf4xMCd3bKO/Z242m10Nx0T9lS
 QlfnyoLz/c1gxip/2ZSX5ZiZjNylZwy7K6rjMD3tNtMDRSIRLv0jLDDLvSGQBBgCJfII
 mtnQzhGXGQqrbFWQvgflzKS6xHK1JZUZMC1QMBRolLka6Lk8DqXAPXNv67XIZ0l1kmMw
 O4HMrjdE4OSV/o4BLhxwkYf9YrB1gl0fjoJSA3EeNnvoIR3ZO+QTmJhdSrc5ntUMjs5T
 L9Fx5CXSt6uokTo+41VOR8FqsJmHd9QqPgKuOPFxVcUZ5OWXTQuOMAvjVkKxPRsXc1cK
 UDjA==
X-Gm-Message-State: AOAM530lYW8fm+YDfq9J/ijA9kyscA4quQy8nQtJ9O10zaG81DrSmId5
 zPetGTMXkjVlOD1kWjhUaLjrXQ==
X-Google-Smtp-Source: ABdhPJwuwmzDXKRStTl6JDYpRGB0zgxUC0uB1/DK/DFZh/CLhIJD8ZlQjWrCzxvWGGVl3nx+hjosVA==
X-Received: by 2002:a05:6512:1292:: with SMTP id
 u18mr25527911lfs.360.1643876776338; 
 Thu, 03 Feb 2022 00:26:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 00:26:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  3 Feb 2022 11:26:08 +0300
Message-Id: <20220203082611.2654810-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/7] drm/msm/dpu: drop bus_scaling_client field
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

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6c1a19ffae38..4530549850f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

