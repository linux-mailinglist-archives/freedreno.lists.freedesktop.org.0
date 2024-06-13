Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251A907966
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 19:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B10210EB4A;
	Thu, 13 Jun 2024 17:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D5dWDCKp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7E10EB48
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52961b77655so1360415e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298313; x=1718903113; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
 b=D5dWDCKpNGvPQQNim5GetEPujDltCmdyPlI/WX+j8fP4VyfE8OeF/E7ac5Gp5dnU/u
 k0Kime65lQylIvzKfYGYpYoqvlIx9QcW5aDRSeRJ6DAa2kRrsQ08tnhiG8dxZC/OF8jM
 X6Gwy3J5fTDPuX++FvN3LNrQyNwidgFyedW+hV9+4rkydooLCjG3rVCl/KWKc920rXFV
 T6jTpIWg1FjBYqMMDE7gZNfsvjujcOuobCIqTTxYKDjYX0gjhCGvaMUazswxP81w4lDD
 4rKHqAHOCPyoOg68EAIl4tg5NaVxwzXT/OXAUzljwrd7xcFGGTUWrEhFUeOU/26fKfUE
 QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298313; x=1718903113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jFIftxDedqw0XeujJ+yqXgGm8FkPdhMhPZNtKoZN16g=;
 b=EEIMa8mwb3nAMz/bqy9Isn52kS1b1CjlvIOF+gba0CwNXHvC2HJbb0uHZKPcoRVrgP
 B9ZkcRbcTjey34DKtllSLL9nGxNCZKpwO/CW0Eej8rAoqhYs+zhp7fZ3aGG7Xvp2wwVf
 YxZpIROBCXs1DmfSN/xJBlbIbl6S4gp/pD2Qcw0Wz40iUQS6TnsrAxiH3U71oxXt8Jn0
 rIEHAiFB5KkIO48RVYiU+eQehde25aO7+HIeaq86Qae7m5Qsi803qhTUvH89iuaAyLWD
 HEFZPOOdw/HrqxCDpC17D+eAUlEUrtanTSiF32jVLtSruzsWSy1ZARq5k+G7TLkvfup9
 t+cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn5CPvxs9BN/+6zKdnOho8fjcGHwWZRtAEt63Y+H4rB5zDGgrfreDsG7Oepb3Ut7+f7c1BBr+QVqwMW3GqLx0K4rcl+2KwUkbc+9ysRh+p
X-Gm-Message-State: AOJu0YwVK+NT/8ZBpwLeNAHlEM8MRMJjgGLcMLPpa2aXdOhQGFhg6P/e
 aipWXXTuEFGE4JlH0KXlrl8AQwMpMwZP7XMBjXpV/pk7q1hfuNf/Sqgp5ZFz8Oc=
X-Google-Smtp-Source: AGHT+IE2l88kV8KRfmueofaMiGT9jOC6bDnGDLEFAidZGySARjBWwc6bw1tMCn2EDrlw3Y+pvm3faQ==
X-Received: by 2002:a05:6512:3c96:b0:52b:c0b1:ab9e with SMTP id
 2adb3069b0e04-52ca6e564d2mr272152e87.5.1718298312739; 
 Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:11 +0300
Subject: [PATCH v2 8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ueS1wf8UISai/dHWZNsJmGTXzlQKS5D7cMZLTp/g7pM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q22qFk9TX8rEHKdSeV7vy9tNmzxVbbNr3lv/3a3qeZI
 q84j1/qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEgmU5GBoePXzIn1bMMMlk
 5afCiHcR50/Z2f5WMD306KHEZLaOs282zjA4njA7OSDF8O3SQJmHb9k39v5VuCkV0WekwZ3Cp7L
 8OM/GHwv9JG2VLwXuPMXUf9anmE9BMNXto0gjV9WCVWq1B0I3bM9Kdsk4u/O/QHh2OS+P2BaGxt
 l6YZoXprO6Htl28YWLihbD+dwl37okXVQ2t3isSJWOO9L6ZrvHl1v+q04u/qv5csP2K/Ir2W+uW
 v2vPau/X6k9bJJMxJ7IMAf9c33KvZt0XI10Q3t3svW3rXp+cPuNOI03e0878N14KBqZEZyy8bGW
 8mahwszwnFyTnPYA8S8qzemSN62+a270fzjxXIxEgf0fAA==
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

Rename dpu_hw_setup_vsync_source functions to make the names match the
implementation: on DPU 5.x the TOP only contains timer setup, while 3.x
and 4.x used MDP_VSYNC_SEL register to select TE source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 05e48cf4ec1d..6e2ac50b94a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -107,8 +107,8 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
 }
 
-static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_wd_timer(struct dpu_hw_mdp *mdp,
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
@@ -163,8 +163,8 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 	}
 }
 
-static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
-		struct dpu_vsync_source_cfg *cfg)
+static void dpu_hw_setup_vsync_sel(struct dpu_hw_mdp *mdp,
+				   struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg, i;
@@ -187,7 +187,7 @@ static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
 	}
 	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
 
-	dpu_hw_setup_vsync_source(mdp, cfg);
+	dpu_hw_setup_wd_timer(mdp, cfg);
 }
 
 static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
@@ -239,9 +239,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
 	if (cap & BIT(DPU_MDP_VSYNC_SEL))
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source_and_vsync_sel;
+		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else
-		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
+		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 

-- 
2.39.2

