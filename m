Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213098D451A
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 07:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10F11B3FE;
	Thu, 30 May 2024 05:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pXFuiBWh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4711B400
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:57:16 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-681919f89f2so435545a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2024 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048636; x=1717653436; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ZVQGdY4+q40BBHTXc3s5HupCWp6jK3VzSQUVWruj6o=;
 b=pXFuiBWhFDFCHGQOxiwC9Ln4z5luWHol9AoZ3B4v/WJVkBuJGBgCfdIxrU+b0VUvWy
 tK94yA0l7BitBphFSzj94jjv0hl557tdO8jyykPsgyDwPZar5Ul/JqA9OmjoSx/FaJw2
 UW1wQAQ8k5qblyvj6pScGHNxeCUswnzVtq9Do+a72P2ixpHZfTzR9cDP6SsTc+2Dm4lO
 hDMaqELyqp2Y8e1sW3z/naHbHfSPN6mm4fVoDMILOcMcEaSa+nGcW5hoxA9hM4F+Pv4v
 5LASh/CMD5dm/Cma2bzL+/Da9UNrEBa0u4Fn5bxKh9LlrUmfhZch9sGIHl2BiXJ/A62p
 5KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048636; x=1717653436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZVQGdY4+q40BBHTXc3s5HupCWp6jK3VzSQUVWruj6o=;
 b=lIWtVvIgdGvfkminUzWuBSD3s37j6R1Pp/rTgqJuCfXUc171hszKuLppD1/2W81sf8
 dGYaTZKI74a7gvaNLrR7dU2WJPTaNAW1Wtio9ulYKM6NgYxY3rIwSMJ13t08D3NWVAsY
 qi8uwVmrbANECZNVD+EVspcvcbhlhIggHONjV8z2SH14DnDFUmBKSkSI9KVAD3ws4AZB
 50I7YhJiF1H3bn+8MRXFvThF4Y0E8xj2YfwwvuNv3C/bAl8ZUog1d4ZJSQwlSXURr9ds
 +/qTLpC2Cm2meeA8sXuvc+phpjqcsd9+jlD9xF61z7YwMUbM/whB2DvSY85Cv4PxfHEl
 /uCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURffORI1Pz4arzgfetrm1/6ZtUhZ6zERSXJmBjZnHTfp9a9lQid0z566aY/gmV71omSci1s8ZmWgfmdzTo172N9o3cyzQsuI9DQOh9GsGp
X-Gm-Message-State: AOJu0YxgSfddqTKHlxuOjuXMNUgkLZ3Dzia5ZUyHCYo+e5R2WY8TfAvY
 EI98XmwThvOocj73ApIJpndBXhFGbIpZmuKzzynGUW7Ya1sOixXep5tCnAOpNJL35csnmsLq5oW
 IcKED3A==
X-Google-Smtp-Source: AGHT+IFHRP9s7YeWMgwa/qHgOh7ZuyYspfdyiSHN574IBlMbLTNgrknvsbTKG9nAZB6npdJw2Bhocw==
X-Received: by 2002:a17:902:c943:b0:1f4:9474:e44d with SMTP id
 d9443c01a7336-1f61961bcd0mr17228055ad.21.1717048636303; 
 Wed, 29 May 2024 22:57:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:57:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:47 +0800
Subject: [PATCH v6 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-3-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=3076;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=I5nifQlkHyD4/nu30HBNiwamnt4h+/HLfZyqBAnBjJ0=;
 b=MO5qo1g+m64QToCTWzXicApGgsbmx4Q2ZX7kcjbFlrP6hhXCCjr7gXsK4YTLxnUMTs74++HgG
 Z9csO391xNrAP60PnuNV2HEvXA8D4nXJuaGEm1XTm8QiZa+v8y12b1i
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Enable compression bit in cfg2 register for DSC in the DSI case
per hardware version.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 925ec6ada0e1..f2aab3e7c783 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,7 +307,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt);
+			&timing_params, fmt,
+			phys_enc->dpu_kms->catalog->mdss_ver);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index f97221423249..fa6debda0774 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,7 +98,8 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt)
+		const struct msm_format *fmt,
+		const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -177,6 +178,11 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	if (p->wide_bus_en && !dp_intf)
 		data_width = p->width >> 1;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf &&
+	    mdss_ver->core_major_ver >= 7)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f9015c67a574..ef947bf77693 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,7 +81,8 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt);
+			const struct msm_format *fmt,
+			const struct dpu_mdss_version *mdss_ver);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);

-- 
2.34.1

