Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC90954FD5B
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 21:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1402A10E437;
	Fri, 17 Jun 2022 19:14:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC0D10E066
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 19:14:33 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b7so5682700ljr.6
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=xbTp4LwIyALPE6VlO2jKeqx0nEcZqEAaTIvwaWRYmxrkoKsvTdw7tRFMenONFGr7lR
 Ufsj5aML5qWHeHSUBIVlf4jFXjfRreOw1kWbAyPXwKAWLn+QXp6CSAMmOmX96JTImmZz
 cuauD7A1K36gKMJOVW+unaIInlBuQGSQwbHaeEIQRuvD+IIfEqu/l55HyeBlHqbHck2+
 uLQzTDVJS8W8TzsSnyWLY9jsL62F2gv0aI70+pT9AHEqeUl+Rer2mGUcD5EKl4HaijSH
 NCME341RbCDNJT33fxlZzfYRpidwakurjMAjfP0rC4amT4ABlmZgF6xcw/jW5oXrRu6u
 pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
 b=JuPfZOUZV/EY0+bBBO0i9g6oTiTwMGWhVzG3yzdQ/usIuntuDwrTOZ7VxedBE+L+hR
 5hHA9gLr7rpD5jRWQLJfNh5WlbdOcIXxyToZIbtcSwk7Bd7uoe8lnKrmTC90YkkC5AnV
 d0WiZc0shfPsK5p479xpPQLTEhQdcWLaTURxi4q2I0s3A/ql9VdwjIOCIRQAdGx8lIEa
 mOsF9gcSjDxmUf+iadXh4CgEkBV+W//9N973O2+kgs8Rsfv5dgPDZZEITTawJzOFESzk
 1I+B4s7Pr3Ko0FhAqYfYG5Gn7R0J1fejEL4yn063tb+hkkW4g6NAfcBqXknRbizNH7TF
 txVA==
X-Gm-Message-State: AJIora8O/4IvOE6BXGrEE15KER3aZAP9RIpPU65xRH8GrvzxDNxWLrvN
 7Gp/y1dveV9OPelqs0HbuS9TSg==
X-Google-Smtp-Source: AGRyM1vEMaivlVmp1GevVPnOlaohjbQDhVNfZ7qhfExjbK4LLttMx7ZLMSW4usvknVC++JyrNMot2g==
X-Received: by 2002:a2e:9893:0:b0:255:951f:9694 with SMTP id
 b19-20020a2e9893000000b00255951f9694mr5767186ljj.283.1655493271802; 
 Fri, 17 Jun 2022 12:14:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:14:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 22:14:27 +0300
Message-Id: <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 1/3] drm/msm/mdp4: convert to
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..ddcdd5e87853 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 
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

