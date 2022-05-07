Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC851E2DE
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 03:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69BF10F058;
	Sat,  7 May 2022 01:00:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D215810F006
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 01:00:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w1so15149531lfa.4
 for <freedreno@lists.freedesktop.org>; Fri, 06 May 2022 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
 b=S4fWE6cToix3IrUwEdSdjlJMpkGe3zBnnhDbfNhBHfUc8NVYF1LCaE88zKEbaoTWBM
 6CCuMw5YY8m1o1WcBSAAfwqoLuFQo+VjhVAnVX/Wo/WAaFqw4siH1EZCjs6TKOGOCtPH
 IcoIEg+uQ02a0+OReTK2ewLOEbqj3eCkA0qgtCbKGhCI8h8zyvEAq3txhFE5zgOZA9t8
 06kbuCEnsyNCadgvKVgBrNS1MUD3i5UH/+uD8OtWmlB1iREu0KWsJI/PXrerd93SGEsW
 KR4hHcRbfi36fXFQkAKf0mRoWt8ehPkylUFeUuR/jIxcUvMyVCVIvJTY/Hy/uvnwd/mr
 IYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
 b=MKSL26fxB10IJ1N6Ds7ecmPtupFA15rCekpLBRdCZlLhROpMELvOz0zA3sHSxwx5xz
 t83N/LdCaeZJg6Ya1HZgijnCYHNAqdmyK/knc/jDs+ymc5BPrqDzRKLc/g27/dM9pgVj
 dVfhdfrKM5bXg/qQDGk00VSZm8ZrS6FQybjrh4/e2Aun2Obe+FmvrtsmyHIPEhCEO1UF
 0JCmAiUheMmOONKXvvzAft9vAI74r5o+CWF7k3SqzK0pMIQ66kpbmYGGaM3IZVtfU2Ga
 nMup6dT3VfZZfhb9IW+D6j6wZBLHA0nbSTBkzG74+R9Q7rbP7e9V2VPQjfIphqg2ORK/
 FXEQ==
X-Gm-Message-State: AOAM532lXuWQ2tpVTVgnmtvCY7mJnquEGhQWPXEBb21BYnd0UyOfs708
 pD2fj7AOR6UHiznW8CF2mK8VwA==
X-Google-Smtp-Source: ABdhPJw4hX89GyYjec7dVISjZoAnB97kSOaFNSp9tHTSGNmwmxKLBjswpYqXoEiXK6CJvYmo+/JX9A==
X-Received: by 2002:a05:6512:3405:b0:473:a5e5:1659 with SMTP id
 i5-20020a056512340500b00473a5e51659mr4208479lfr.379.1651885247159; 
 Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:00:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 04:00:44 +0300
Message-Id: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] drm/msm/mdp4: convert to
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
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 87675c162eea..62cc566756e8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -72,8 +72,7 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -84,9 +83,9 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp4_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

