Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104C51E2E3
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 03:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DB910F06F;
	Sat,  7 May 2022 01:00:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CFE10F038
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 01:00:49 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b32so2806129ljf.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 May 2022 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
 b=WAdHJaX982/fR1DGH3s8YtXLo96nhQCg98G0gDgIU1fZstmx5WubyFH8Yc8lKr6PyD
 sAuirokaBXI9YZ3GlCsAGotxOP9w7gyc4IbQXIkvLYQMf+nXF16Lku3G9wRoKf1d96H8
 IMSOnL3iN9DGaiK+ABvkIF2Dc4zBe6cl1ms/Bi1BbZ8PyC2kWqfcp/1/xzM3a+u1cwLO
 SxT9NIfjSIIHWFu76CwtLpbJ+j6yAWnHiQrZhk0HxXNbOirvB5ntWuIamPHDzdKXLcuR
 cv60RMMfH3lVSfqb1iI/qNHFp5v+UpxZlXG4oOBhngcpd3mYC9AbV9phBzNpVOAUH4ok
 +ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
 b=urWRNsSZOPHFK4r1q+q8Q0PArW/fKFMk1VrKXcfpLNsnLyIg3HJHYRaYzQCZouZG9x
 OFoYty4+HBuVhHlR13zKsYrSpqnnZA4U/Oi9raG58YsAbnNxrUTWmRN99TKrlty5UO+I
 7Xe/6bsYfFuGsuDBhgSgNzU6hej9YhK+Y+LNflHXj+wEYdtQ1B6PD9wL1uwYQljemRe+
 RVAOu7XA7W2rh898/TCnMTMolLPbbTVzIgmiXQ19Fj2MWJ2sMzVK0IdL/gXDhkao8o9L
 9q1gieD4JKaRZCmg1HIn4cxZ/pCIfNhaq3ejIJTmXZ3yMt+L3AQDgfU2pUeQQmhVVSDU
 EkOg==
X-Gm-Message-State: AOAM5321y7ul0rr0PRNh98jPymmcgPx4l1uf/51szvTJ8Ym7b1XXRG0O
 diVMbk1O8weRYw4x6tr7GHBP1w==
X-Google-Smtp-Source: ABdhPJypb/gJ6z2lXz/aRu6eSZL+QrLD7NYp78yWw0SrcxAm8OzLPDD40inSRGuwO9m05QLRoNniSg==
X-Received: by 2002:a2e:9e03:0:b0:24f:153c:c479 with SMTP id
 e3-20020a2e9e03000000b0024f153cc479mr3740299ljk.13.1651885247869; 
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 04:00:45 +0300
Message-Id: <20220507010046.1667809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
References: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm/mdp5: convert to
 drm_crtc_handle_vblank()
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index d573ff29d5a4..18cc62f1e7ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -85,8 +85,7 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -97,9 +96,9 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

