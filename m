Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6833901DB
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 15:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8F36EA1E;
	Tue, 25 May 2021 13:13:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07A89EBD
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 13:13:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i22so45786053lfl.10
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HxICzGGN4fuXTc0Zj3Y27W3FaudSqWT627W4/GXnsjo=;
 b=fKXCubLdDGDtY81Iade17LUJ6X87IalYN5PCyrn0cItiZkBSJnsDTMBMjf0Sl1hOnK
 GCDSx4LJB/wW3G69RR8XBj3jqCg7Csq8tm5zhD1ysOI2Qy1c4BBwTd5I/fK5esofodE9
 BoAeBu4HIxuvtdvS4px6oisjq1snVv+iAYMplvBlMsUYUDQpAASavr+Cdol5Ia5pMkPM
 nQdrwQrMHWzf27t+8tJEfXyyxvRr1tmc+X58pEHCVEcjrlDI3pdaau+OKZMMzzBUlXW6
 q51AWz0MSIiKHlUE21I29ouvaH6sEwJAkwCpOuKRSOO1X1XIx/+WB3k6gytx+YD87Aek
 RYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxICzGGN4fuXTc0Zj3Y27W3FaudSqWT627W4/GXnsjo=;
 b=hJqSQz1HYQg4FXmakLoPYDGGI3N86K0setF39tIVJcZ8QPp2VMwfHif7GQy+nMFWW0
 da/piGwtES6kSLrrph3m2viF0VMoRGwpp/D0EogttnxGk4USfhxJtuWq/d6qFGJFVU5e
 SU71fZkUo56E3Se/OCYVAz0zDpSdYW0PsNzCE7PXWWG8TAtJtZA00wtgxHKjyvYPPYPU
 gbQ05X3NXh8mzo8PQHTNAryTaprmZDiFd8f7SDj8mlTnSGg2Z7sVjDBTHah4Nvjg2LNQ
 7xpEzLUNoFZGY3DdNQYqzudwkRr619f+OvLg5YAnsd55EWBSxq0bqDpqffmP0C37bN6V
 UWPA==
X-Gm-Message-State: AOAM531OwgOVZNtESjU0LnlShVKc3PD7K6PqTtqPFFoTktRawj9yiy+A
 J6eZ8TbLWwcKWyOA4uCX4WkpfQ==
X-Google-Smtp-Source: ABdhPJxxNGJI+xDegeeXxQC9tCKUVa/Epay1ErC+mkYWXHqe25FEoCKZ28JgkhLFFWtgfJixa2MdUQ==
X-Received: by 2002:ac2:4211:: with SMTP id y17mr13176558lfh.607.1621948399749; 
 Tue, 25 May 2021 06:13:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 25 May 2021 16:13:11 +0300
Message-Id: <20210525131316.3117809-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/7] drm/msm/mdp5: use drm_plane_state for
 storing alpha value
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use drm_plane_state's 'alpha' field rather than adding extra 'alpha'
field to mdp5_plane_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index f5d71b274079..b98d5abafd1f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -291,8 +291,8 @@ static void blend_setup(struct drm_crtc *crtc)
 		plane = pstates[i]->base.plane;
 		blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 			MDP5_LM_BLEND_OP_MODE_BG_ALPHA(BG_CONST);
-		fg_alpha = pstates[i]->alpha;
-		bg_alpha = 0xFF - pstates[i]->alpha;
+		fg_alpha = pstates[i]->base.alpha >> 8;
+		bg_alpha = 0xFF - fg_alpha;
 
 		if (!format->alpha_enable && bg_alpha_enabled)
 			mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 128866742593..d7e04e99fb4e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -101,7 +101,6 @@ struct mdp5_plane_state {
 	/* aligned with property */
 	uint8_t premultiplied;
 	uint8_t zpos;
-	uint8_t alpha;
 
 	/* assigned by crtc blender */
 	enum mdp_mixer_stage_id stage;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 8c29026d770d..0fd1d10352aa 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -168,7 +168,7 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 					      "(null)");
 	drm_printf(p, "\tpremultiplied=%u\n", pstate->premultiplied);
 	drm_printf(p, "\tzpos=%u\n", pstate->zpos);
-	drm_printf(p, "\talpha=%u\n", pstate->alpha);
+	drm_printf(p, "\talpha=%u\n", pstate->base.alpha);
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
 }
 
@@ -183,7 +183,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
 	/* assign default blend parameters */
-	mdp5_state->alpha = 255;
 	mdp5_state->premultiplied = 0;
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
