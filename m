Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248D9F1873
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9BF10F0FE;
	Fri, 13 Dec 2024 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WG8KWmuS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C05410F0FE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:08 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30033e07ef3so23889821fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128106; x=1734732906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
 b=WG8KWmuSQjdckvx5BOCSgMeMuJfDEF9Ue/A4IQYY1RVwAuVAMlK+IyH5BISTPJQ/xs
 Et25h90V667Nf2olSZ2CXTAuVscwUYllKuVpU0mHTBSJBo1E7QO1k0zrxT59RiLKiQgj
 gxiGcwamQ+nVC7eZxoZzWcHcsZpuueONfUH+N6PmHupRhXakspy/DguE5DzD3nJVKuIg
 /DJBsWIXqkyVY67umpcgLHPRie7t5fSD7cmvLKZrJ/y21gA5+D4bGTgp0ORYUtyJceBi
 KUmCkDZtr18tZG/YrYIt1qX4P0Z7i+ziEqzVC0F2XD3aZgZu3WPWI/UM/WFJHJB/6q7L
 CQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128106; x=1734732906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72LEVu4zv5GnCl7a/DOzppLgP9PEkC9JVzSKxkGRJcM=;
 b=dwkxgbZS4UG5qanYkHDK5yUEdS5RzHE9hfV8LOYM8Rk/A1QnpsYV4cudZ+VKuhiNRX
 RUHdtlZVRrwGm6aQFp4BmLDoocYg96rCLVdK0Hefg7bJoHamc2hJ4zLI6fYS1lpBx9e2
 SKvkj+GnuUhT8kNFqZqqF9+fvP5NYeV0LIMRuaYwBud/8cM3STDhPurSbI9aTfG6Tt/w
 Vyglsg9gtXZCJKwXuZfgcfs9HTispnCURKQ0j/nFCoOAOpbBpLkyPiHz8kYWzF1Hu6RU
 dCI7c+7Wn8Dalxy/21kUK2bX87mc32W161mTLOBrHvtO1Ocv3jzuZ7euMCAdQ+0IcowN
 +GJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bzttojClMyQtjxm+PVoM2Mk4GCiNG6+O9lV6Yy64qWV/ugHK59spRcY88yBl1uKYD4zO+DuYZso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMXNsetSLmZYILTM/z9C8d0tBI3RonV+/7p5x5hpAr8bV5vVGH
 pSifv1d7bPs7XNe1z5wQGuHeKxySXq7M7HLlo69ge3V8LOVs/p4WtMNEJGzj8zUW5rNm5eteZR3
 H1E+gPA==
X-Gm-Gg: ASbGnct0IURVSZ53P73axh55GtSecR44D5XmrLAuW8s6EeqHRWXv36VlE+dHcrLlGzg
 iCn/HSS0czPJhAzgVNKaz1KdMGZAP/Z199miLut/RDQSIm13cueM6KngrqgkybxA6IkMzz/qkSE
 Sr79x/26Tzf6cNVwHMnmhBjVeosL4lAQl7teSaTYTF+AEjs4xIf7niRTnSyEvbHTDDHZcIWZfDB
 W5kZ47NfhDgqmDjYCM02esEItX1yFSwHKTTzhPziLBZlo0mhJCbaLJncg6nRB1e
X-Google-Smtp-Source: AGHT+IFnTWBphArn+3nEEQZAb7l6bmtWQ8xRj98QypbmoOZGU0ruXSDAvaWrK58SXtuDlMbXHNeRCw==
X-Received: by 2002:a2e:8095:0:b0:2ff:5d45:883d with SMTP id
 38308e7fff4ca-302a4d2182bmr10620311fa.13.1734128106486; 
 Fri, 13 Dec 2024 14:15:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:29 +0200
Subject: [PATCH 13/35] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-13-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pQCOp1S6V/JRH6JOV3082YMk98ZUP3XYs5wxxF1uZAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFa7D/ZOU6IWO40FuM1ZI07Ay9Uc/VNqqwo
 oX+EXBeavqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1QFAB/4vfqU0CQkPt3pS20P8KsDEBmonJiPX1mt3JX0VCdEdcJrcC1udYFMOdgcnMq03qC+YfQI
 3Sr6VpcdPUX4MiqjZVctNlVdNzE5dEZ36InR79hGK4yey7xZ9D5QAWKDe18h5Vi7Uw614vgi5Oc
 ndUA26f9HBfBW9+O01C73SjpM4746nj8kLYvcV3zBuMJv84ymli6thWH5qzUYP6nZHQJkve6dos
 5h9RsGGSzHUVD3kIdQApOO38PUOj+akVpikaL1ltqzeWQQt2EN1dFA9Ko3ZVyzeE2ln5m7QLbu/
 66O8zNnAj1XJn+OTSidkY0+KixCF5/Q//ZPfD8q6BcGR16XQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4b44e4d8d13631b6b1a8824b12cd8d5bd4ae7e3f..188d73b56190c2719a012889d6b7993f38a28906 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1acc1a7d0a365e511d5b6d7cc236e1c28062c76e..12b0faa9e9380034c20142e6c7077192ca097985 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -135,13 +135,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f0dbb00737df2b4ade540eb440cb3ae0baf7c153..4427a97ad52237b4ad64d63e4e02428c76f8616e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -753,7 +753,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

