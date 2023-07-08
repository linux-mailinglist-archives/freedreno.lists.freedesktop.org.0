Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128D74BABE
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3BA10E062;
	Sat,  8 Jul 2023 01:04:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF96A10E064
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6ff1ad155so45255211fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhZxoa6vuDbilJsKkx3e64dlv9EEmCnJ4NShTCH1woQ=;
 b=WR2v2wjRNClqpLniua2drXqwsSn/u6s094y3iOx4FDSbPOJDzvFYcvSuuS7oQbQ0uT
 X41/1Sd4YLwvjYWux8RPuopUyimF6etV63QOHf1Q29Ehbr5JEFNsmlVBHOMacyP1swDb
 vUTDTKTZ2+gqFw1FIjJfEqzS5X7Z3J9Ly0zWwratIppJ90QO7l0VQdHX0UxlURhC7GTp
 10070CTQDC8F50RkRmhqF9WtZG0xJGJG0uja6hq8DJKotKcX6a5i0FKr/OW7rjqNvitB
 dhJTirrxGWmdm/h1epSePP3FXCkItkE3hjqAGCaY8ilItsvIOwAMNJ1bTBgyK3JGGFCZ
 kS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778251; x=1691370251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhZxoa6vuDbilJsKkx3e64dlv9EEmCnJ4NShTCH1woQ=;
 b=O22cJn1DwPNVo8LRTA1utzydjKPUzzx2VcHy2Qn09o18Hu17GAkEl+/ooBJgKGRBN4
 W12I4bIZd7gkm77FuF2Ux1e/D1KGdj+D9mN/t6MkSOI1bCTIzd6h/cHmLPEQnoGXjC0/
 km1AUqmNxVlaIy6G9gVzAdCfB2cD+dVonZV9mi5kPDsg91tJQ5a7OGtLqXYiNkj8OnoV
 i1jsOAEIfwavNYJ7OR/MPtjwNdLpDjgOM85WJDClAa4/SSP4mTkzcRg7mdptjx0SbF18
 A9ObeMDi+CTx4mVdnLe+qQJvT1pCNVaxtb4icwwh4ImARd9i7rsReTBFh9U6Oz+UEfuK
 wINw==
X-Gm-Message-State: ABy/qLYJGnjiMjvzsh4TQqCvpH4Gf7RVrfegOMAZaWOgUrWQBmvJppox
 Qhi0VycdRRZJjsogYghGvaC4CA==
X-Google-Smtp-Source: APBJJlGvn73jNS+QweO+UmzyrjUSBb1BZwNN5wkpgMNIosKfJKqTYRz4PxGLqAWCoaTWyDbCONrS8g==
X-Received: by 2002:a05:651c:107b:b0:2b6:d7d2:1a65 with SMTP id
 y27-20020a05651c107b00b002b6d7d21a65mr3852447ljm.18.1688778250909; 
 Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:03:53 +0300
Message-Id: <20230708010407.3871346-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 03/17] drm/msm/mdp5: use devres-managed
 allocation for CTL manager data
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

Use devm_kzalloc to create CTL manager data structure. This allows us
to remove corresponding kfree and drop mdp5_ctlm_destroy() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 21 ++++-----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 1220f2b20e05..666de99a46a5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -681,11 +681,6 @@ void mdp5_ctlm_hw_reset(struct mdp5_ctl_manager *ctl_mgr)
 	}
 }
 
-void mdp5_ctlm_destroy(struct mdp5_ctl_manager *ctl_mgr)
-{
-	kfree(ctl_mgr);
-}
-
 struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		void __iomem *mmio_base, struct mdp5_cfg_handler *cfg_hnd)
 {
@@ -697,18 +692,16 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 	unsigned long flags;
 	int c, ret;
 
-	ctl_mgr = kzalloc(sizeof(*ctl_mgr), GFP_KERNEL);
+	ctl_mgr = devm_kzalloc(dev->dev, sizeof(*ctl_mgr), GFP_KERNEL);
 	if (!ctl_mgr) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate CTL manager\n");
-		ret = -ENOMEM;
-		goto fail;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	if (WARN_ON(ctl_cfg->count > MAX_CTL)) {
 		DRM_DEV_ERROR(dev->dev, "Increase static pool size to at least %d\n",
 				ctl_cfg->count);
-		ret = -ENOSPC;
-		goto fail;
+		return ERR_PTR(-ENOSPC);
 	}
 
 	/* initialize the CTL manager: */
@@ -727,7 +720,7 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 			DRM_DEV_ERROR(dev->dev, "CTL_%d: base is null!\n", c);
 			ret = -EINVAL;
 			spin_unlock_irqrestore(&ctl_mgr->pool_lock, flags);
-			goto fail;
+			return ERR_PTR(ret);
 		}
 		ctl->ctlm = ctl_mgr;
 		ctl->id = c;
@@ -755,10 +748,4 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 	DBG("Pool of %d CTLs created.", ctl_mgr->nctl);
 
 	return ctl_mgr;
-
-fail:
-	if (ctl_mgr)
-		mdp5_ctlm_destroy(ctl_mgr);
-
-	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
index c2af68aa77ae..9020e8efc4e4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
@@ -17,7 +17,6 @@ struct mdp5_ctl_manager;
 struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 		void __iomem *mmio_base, struct mdp5_cfg_handler *cfg_hnd);
 void mdp5_ctlm_hw_reset(struct mdp5_ctl_manager *ctlm);
-void mdp5_ctlm_destroy(struct mdp5_ctl_manager *ctlm);
 
 /*
  * CTL prototypes:
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 828634206185..e20ead138602 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -625,8 +625,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
 	int i;
 
-	if (mdp5_kms->ctlm)
-		mdp5_ctlm_destroy(mdp5_kms->ctlm);
 	if (mdp5_kms->smp)
 		mdp5_smp_destroy(mdp5_kms->smp);
 
-- 
2.39.2

