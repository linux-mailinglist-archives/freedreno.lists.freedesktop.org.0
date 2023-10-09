Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704807BE688
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 18:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546DF10E131;
	Mon,  9 Oct 2023 16:36:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67310E131
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 16:36:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32167a4adaaso4308168f8f.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869386; x=1697474186; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5PCLKpDplxEi6g+GHgYMxjppZKKeUtHeWR9UsKPnFr0=;
 b=CDxSrH6tPkCKi0x1S3l6Q0T4XcNDqNkOPIVb2kszW82zxEDGyajQCLXxnGUnuY8B9E
 1kkdKFT1T6gH9QSbVuUkKd1TkknNGYaIqQCg80ivaI0bS4xiyIOB3NtnIdUcWAWeka6m
 z1dixWHC0M6/bLB8jzLrlk6S/Ux8eBod0efrqjqTqb7weVoL0IOCk6vxlEiCaIlDM90e
 gyzHVipK3VlMW8Idh02OwFIb2U055kdKfGvFXQDdgfJ/AEC4k5I0qAhXAOACfDXt5o4e
 6IkjBhrTlfMWdKU9R7wnKer4r5SNNns7MMy/sCnTVa/NY6/vRV8bLCzJl+KP/BdYfO/4
 tLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869386; x=1697474186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PCLKpDplxEi6g+GHgYMxjppZKKeUtHeWR9UsKPnFr0=;
 b=iXwqlAVW0tSNrUK/z0mLFcGAVwi4EJv2+x5WW2arpzRlILS5SnmPlmO+BZtUwiMMly
 OOdTXkOvUQZv8wBfoH4lUTJJORUGF+a13KWcfYQULaG4sAXct2QklKacuoO5ysUwcn7V
 9lTNbQJk0wlATbLxcXRUKfz+5GXZGnEPcujtcckQukfn3p8RyYc0bjzFaRHtnrbuU9SY
 b5JLUutFTZk57cDLoN7oMUi6A8sN+om8gZGDxiEc3Zo51xuQ4ECJEvYguFm+QE6KbzHj
 v3U504RsclvsBxr0dFQsDpFbTRWiL+VutOExd4M0U9bQBZbK2PSr3yBfv4YuCnVqwCJf
 4wKQ==
X-Gm-Message-State: AOJu0Yza20NuWJz64aqyJfbNQvdRXVtVuGTb26uykkILt3osWtLKwMdS
 maPGCq7sUgzDVervS3XO5vUmJQ==
X-Google-Smtp-Source: AGHT+IEzbTMAE5w16hwu+51q9w39EXdZmjD15W3quhSWcZGUvRZuHo6gtNEIO7U9AW7rzLim8rJ0jw==
X-Received: by 2002:adf:e606:0:b0:317:6314:96e2 with SMTP id
 p6-20020adfe606000000b00317631496e2mr13142379wrm.14.1696869385860; 
 Mon, 09 Oct 2023 09:36:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b00325c7295450sm10141046wrt.3.2023.10.09.09.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:36:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Oct 2023 18:36:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-3-806c0dee4e43@linaro.org>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GDPgpk2/mayRlWQFJdU3lhxk3/qUCU3a1fQFXnOYaXM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJCwD7DTIAti95TB7gGnRUdufNBcLE7Oe7bz9Ds5N
 2qIjpH+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSQsAwAKCRB33NvayMhJ0XWrD/
 9GJDeVqlUCf+IWQm556T1txr5P26ZJ3XsF2gHrhlARuBcI0Pmv6kO6kOhZsET5Vz7GqkdZetlINGqi
 7bTaYkj3GnFXOuFcegAhSqX2D8jmuFaUyXCcuKzzfo2WM+O/Hv1ZCW2BmbgixO5i+3SvQbAJzpRL2x
 4LKcy5nvNemvrjBFN9Fo4RQ+27iSvyTulBeFPKw/yWB2H9mnLr3UZ16wQ9pYjXSOAOwzFFxFISlF7j
 G4QGFDhPiM4W08CoVCnpQjw0ImDbJGFRUkMl1q7xrd/ajfezQEW6NVxgYLMC9n1XC5BrnYht2lLcU/
 QBg2Yp7Awza9WtVN4b/NDZ48ywrgFH5NUdUoQdDUKYsabAA+zDceaeqvITse/GDzXec5bJPkdvaiZ7
 POYNw6V6rwWaUbkLi4MLO4oUhit+ZeBC0JCMVep5/cMQZ2AKKS8oogRsAgYaPDf2gHoQLk5m0Uh8MB
 a9u6rIPC+SI3X2t2IjDeJgTP2pD0zLN/5rDt5SK0FVWcNdHjetgyJVgHUGOsdflccx1AjqjtLM3L4H
 3WMCDRoHJ4UcMEs4JvWRYQnatK8R5NXuhE82C+bdFHFuhQ8QOkHIyOP531D7xbjlEficlyRAo76SIV
 2i0Mv2rc1e2WpjpHfpcYdGWmhkggqjxQZxtsnH76xD+MGgM9rluyM1rvla7Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH RFC 3/5] drm/msm: dpu1: vbif: add
 dpu_vbif_setup_clk_force_ctrl() helper
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move the actual call to the MDP setup_clk_force_ctrl() op to
an helper which will call the correct op depending on the caps.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 1305e250b71e..2ae5cba1848b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -158,6 +158,13 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	return ot_lim;
 }
 
+static bool dpu_vbif_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
+					  unsigned int clk_ctrl,
+					  bool enable)
+{
+	return mdp->ops.setup_clk_force_ctrl(mdp, clk_ctrl, enable);
+}
+
 /**
  * dpu_vbif_set_ot_limit - set OT based on usecase & configuration parameters
  * @dpu_kms:	DPU handler
@@ -200,7 +207,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
 		params->vbif_idx);
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
+	forced_on = dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
@@ -213,7 +220,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
 
 	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
+		dpu_vbif_setup_clk_force_ctrl(mdp,  params->clk_ctrl, false);
 }
 
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
@@ -251,7 +258,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
+	forced_on = dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
 		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
@@ -262,7 +269,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 
 	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
+		dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)

-- 
2.34.1

