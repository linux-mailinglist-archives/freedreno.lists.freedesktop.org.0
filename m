Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E38CE5FA
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2024 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542B10EA69;
	Fri, 24 May 2024 13:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dZZTyRFe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B0D10EEFD
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 13:20:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f8e98784b3so740570b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2024 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716556805; x=1717161605; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=dZZTyRFefHm2VrSGdc/a8xQZvH5RzVMGECRRX9GUCVimeMaoHTR3Jzw0heZslagL0X
 X0yZSBxcHQXzV/sZVtTWPEzY6H7N1VMNm7i1Lg1RhnXNFnhmR2mPdeEtnDkcUHtLOzRl
 nMvVH8sONpsARWv+fIlfTjZ3Z6qNQNZ+AdofUBX9v+0x8BI9owPSRnd2mfFxhhYh0LvJ
 5heMxvzgjmouf/0N2yxrLPp52LFi2hB3FlqlZWqnYHw2+CwKtiYW10hU6vXSijRlDFf+
 Hl3w8O876K75WxwVrXp5YDgVg8EIJYXSplJQ2c8cBaN45w58HAcSBmV0i9IduP9Bp8wO
 M5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716556805; x=1717161605;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7X6X7Xg0a7P3rLwok0YLujXGrmUyMxWDQ/9AezaVG8=;
 b=XEh4k1YNF00LOVn8zMOWTC2Pe1NVrweL4ygi7lvHsDRnM5crX5szvyWPOmsN08kU3v
 56iiC3qdRQZyFfIomDGJKq+6CbMrWzlyrlXUoBenc5Ne9E7U2j2O0FtH04IFBZEfZ7Ji
 PQC/xBm2exYiYpKArr2BFiolLxu9UmDYTfMgzbaxaF82vrQ9APl//KcK6BNWR+pJ8k/s
 NeLRivJGci/gXvXz22zENDs1n6eWo50AwffeEfDxnzoCFCdQT1WaJW8gx5KM1we3V2ht
 7ZPHMTjBFv16KiOWZjCYMjSJ8f5tISohnU10XV4IyMNOhbRv1uc3xf4tcg3yzryg/N/T
 kBug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZOncBPl3NlLqBiqrTjS7r/Rl8k/NNQv1eaHx6uDEptl+92J+ymZ6vvpo4S6UM9m3zHgYXV/tQWJ5Ryd8rcW81U151wB29l8SNbEasCPdu
X-Gm-Message-State: AOJu0Yx0VZCSvZmP5CfWwoQA2xiauEUDdFzbrw2lILnYC9zJsvS5LBbe
 nnozhTEfrQw/i2raqEfoKmBrOvLQ6CnL0V839WDM0PWVPm8fYok4gwZ3nrqsQ5U=
X-Google-Smtp-Source: AGHT+IEaF2Y5Q7PpzxWxDlSpCPw29IB00sbmr5EJBez/e+fhZLJRTYl/6p9AjxbjhfA7ASd7c8riaw==
X-Received: by 2002:a05:6a00:1c83:b0:6ea:f392:bce9 with SMTP id
 d2e1a72fcca58-6f8f3185033mr2206294b3a.15.1716556805523; 
 Fri, 24 May 2024 06:20:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fd2d492csm1117852b3a.179.2024.05.24.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 06:20:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 May 2024 21:18:23 +0800
Subject: [PATCH v4 3/5] drm/msm/dsi: set video mode widebus enable bit when
 widebus is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-3-e61c05b403df@linaro.org>
References: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
In-Reply-To: <20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716556778; l=1644;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=myYBVxgRS2I/E3QUdyhnLOjWSeM7jzrWqz2ABozlocE=;
 b=acTSUbISIJX/UiCq8kqoDO4+D8/1oY7QOyQNkEU/pl4GyuyGinhAF/uix6W7YgXHJteo4QthI
 m0ghV/Ena4ODZ7iitRZjSs3qclPIVQxtybpusCBTC4rAOs/QHAWOOs5
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

From: Jonathan Marek <jonathan@marek.ca>

The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
driver is doing in video mode. Fix that by actually enabling widebus for
video mode.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..47f5858334f6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
 		data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
 		data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
+		if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
+			data |= DSI_VID_CFG0_DATABUS_WIDEN;
 		dsi_write(msm_host, REG_DSI_VID_CFG0, data);
 
 		/* Do not swap RGB colors */
@@ -778,7 +780,6 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
 				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
 
-			/* TODO: Allow for video-mode support once tested/fixed */
 			if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
 				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
 

-- 
2.34.1

