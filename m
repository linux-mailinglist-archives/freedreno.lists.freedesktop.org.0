Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77278D7862
	for <lists+freedreno@lfdr.de>; Sun,  2 Jun 2024 23:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2410E168;
	Sun,  2 Jun 2024 21:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YBN8Ntsn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7F110E094
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so2737203e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364396; x=1717969196; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JUUdtGcMBRz5mB58GbECTLRyDS/sCIhf8D+cG1hOc6E=;
 b=YBN8NtsnbQi8qVXp2TPWYKcrbWDO8YNrieaB412A74nD1HpNRXnb+bCeEQb5zMBgsG
 fZWp55Jld1L8ZgwsrLK9ldXWJHgBPgd2Oc750/Yp152TDw/LVPAHC0mCkQ3+VDyPh8vu
 igKKpguJ2fsuI5Qqd+HrAeGVWO9Gq39yFUk85XcSORKchwzV0xfzmWs9y2Ax8hBCI2vD
 YGKGSq0I2YssuPkvX3gsALsUKjJ/VWA+Qj2aOrD3h9oauCI/hq0wlyk4hb1vKBGWsJ4Y
 GFsz5eKgUi+lvRYP4HYhNpkV/yzRn3mUy4G+GMt0KCee8gFIowsyWIriQEqo9oVj2JzO
 ip4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364396; x=1717969196;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUUdtGcMBRz5mB58GbECTLRyDS/sCIhf8D+cG1hOc6E=;
 b=YB16/rPhcSWBjruedngQLro+SD7RklPMwsN+8LsSCi0Fx9RUxCCHAObcHYeMxXImEX
 i8x9EGEiPS47zWvmBKI1fpDIjJza2grSOftfhoB/ptHf1uHalArBStiJaWljglHZq06z
 g33oZAFNNkCbya/tMmsPxGo8CjFp1vINuHotGuMwA5NQBFu7ApypXvcD52cUwVNSGnVH
 Nolo/v2SUq8Na8/QoMBAZlLrlsORBnIqDvonH8T+v6YDJIuBGRdR+wM1a4zdIJEfRczk
 ygyxs0tTCL1sNNbbvbSbdO82BYl6af4ghGPwLCCK3h7Ua6cEt+8DFHHpJGs2db1dJya7
 x3QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV83H2aDe6hts9kYr7cyi59IYt4n/fpQwUgnP/Jp5rzCljZixrDWffFKqRYa7SYxAjTG8IMEQZ2nFlKOBBZpdPrtuTl6m70AeVfdi7W3pKw
X-Gm-Message-State: AOJu0YzC3Q26mlvZNNkhI7Ry5f4CobpsRXDDadLplJ8Odbft0RYFrnyl
 mLG8ZuYECBwRILUmBHoh8PAkJc7OYdpGZ+FPSo2Z+7r27V3K3/dvTtBHXP5uzJE=
X-Google-Smtp-Source: AGHT+IERKRhebLd0DtZWfojK8IucTmKmWzvBp99C1cHcHY5sB2GB/oyBCAAz99JJzRgoGrv0DkVShw==
X-Received: by 2002:a19:7508:0:b0:523:48f2:e3fd with SMTP id
 2adb3069b0e04-52b8956b5f5mr4551111e87.16.1717364396401; 
 Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:53 +0300
Subject: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fxq7vANQU/H+21S6fq9RrLi0S38AJrmn17I2cOqu7a0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalNHFtJfQwnpk7w7QKXCOSLvuRdnL1hc3VK
 9mBYppZ23aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1VUwB/48+an/TqOGKy4wHXt7deIegErq3Uk6r3EcdLqx4Yeh0/2cEv+vkhdfgAAzHwyoFl9srKh
 fnDk04zzpLg6mCwOqHn+KNkq33EbVjt8QgE5WV3/c1kfoflAqswrtPYTHGsy8bBv513jKaXC+K/
 ZlPXB5qLHpOzAIA9YL9ASp2OPZf8xxexoiPgMzu/YYq9qGssUaOyBG+uggIeiOwLROsrANKHx9z
 S0LqqVkB2tfhlB45gqEztPnzw57zWSRPCGAK0ST2vAwW3pf6r0P+t/70Gss95q1LK1hMdSVFmHD
 nqAsXsCMpVbYoipvspdq9WTgw2gRJ7iQLF3cC0rMgPRJ+GoE
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

Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
LM requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e3b1e5f55a92..c5e874a3656a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		r->y2 = adj_mode->vdisplay;
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
+
+		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+			return -E2BIG;
 	}
+
+	return 0;
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
@@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2

