Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB72A3D600
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7931A10E90D;
	Thu, 20 Feb 2025 10:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x1q+8DZC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A8210E90C
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso1305672a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046097; x=1740650897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K2bbvpaMxnQ9ItTta/5Hoc0GpndlEEH7ZCqt3McNEd4=;
 b=x1q+8DZCE99VZv3UPdOJ0SuKzvAVC6ZJXBKTINE7S8bgeEClUhMKhjDA2Q3ZV4m7NO
 q9E5mQ1M+/cvFGNKbzLjZSaPMJW9kOfb5CtAuwlPDnjwpzg4THz4xioMvVgodX/Qx8gd
 YbRI5fhYXI2NXQcByuyoqAvQEo021FRTbKr7+y/m/FHexqhsrmxHub4QJbEI+8/Agp/m
 b+Wo+78mmmvWgAbOZO6GcEbrRoEwsMwE2ibz0l6jezeAwdBsQmy+WIPJkVn7Buu5w+hh
 DAKsms0qePrIplMVqNrpZzdNdA14jhKGldGxwqljM+t2Q7qptQKzecFrAFFCDeAhoL/Z
 yy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046097; x=1740650897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2bbvpaMxnQ9ItTta/5Hoc0GpndlEEH7ZCqt3McNEd4=;
 b=XBGdjte6DOnLtv25ro/HI4VlAAjLCc4H5wWDEui7KULoyWOFJpi0euE4xU5ACGe+SV
 ikfZycDtQRE/3ksqwoR6cRNs+A5d+jgaL9ESVL9RPU8mEDPua7/3wo+JYArVpFMrLzd6
 tHKmfIVQU/lmdf55sv6ru+LFBTSuAxkqrOrfLQo3kYoFctsT7uazfbIcPL12vTnm8uif
 RlCGU+Ph2lMo7Cs0jQOYNe10VWwH0QfcFa1PHi5r/WvEIkXXwcePYbBcMubSFugPZDHo
 nUDnWl7gv78g3bFRKN7ENU9z7K4dtwuG6TVdEEP6pS4nGU9relIZcjHSdNGsDXidBN5m
 asZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4sUsLN8Jyd9qwdDfu6FZ25zTTRl+VUiNJLuslwBw3j2dMbLEQlWZDuPgUkuB+Ma3DYl3vNXLxozc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHFcNuqcnyAsDRl5hEjxs+jus/rYt8Z7YwEk2MKnZaF8hP1lNb
 HEYWB2u0lj6S6M6udsHkRR2yB6B661HcSSKmIVtme29uNaef3ZcMvsc0PjRNSdMCLsDwDEbUNrO
 Z+PoLtg==
X-Gm-Gg: ASbGncvE2dby7xq71scOCIHlkZK+LElfXojBDMOYXPyIJp0tIer6QKy+J9MbQKGFbL8
 oV1PyUdSufihkUXqf7HVFQxmDiYLllXUC8oyJQ9Hf6wTQ5OIh2t0F/BnjChs7H2bld1wuV0WHO2
 U8nkvclIqxm0Amto8IiqSHaeAW82wJweuyDDeP7ycCADgv8bofzPviaPeKeZH8hKOyhaFL1uqdy
 vJhao4mNhzT5XoSZPd5v/xpazcYFdzb2od2j+AMSwhZ2B9BQ2Xi0EgdzNC7TuDzQMWBNoI+DbXE
 KBl53wrc252I
X-Google-Smtp-Source: AGHT+IHCE4RtRNEXKZoOaSDN6mdrpoY8L7CkHQP/kzENk3sqFeSHV34QzJKi6JsrMhW9w9ua07iDCQ==
X-Received: by 2002:a17:90a:d445:b0:2fa:21d3:4332 with SMTP id
 98e67ed59e1d1-2fccc97dfe7mr4597618a91.12.1740046097223; 
 Thu, 20 Feb 2025 02:08:17 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:52 +0800
Subject: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1578;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lyKLAJr554JAOHjjCnxBQz5CBxEAxvVfUFObcdY1ag4=;
 b=m9wZrPVBSR+QFJ2DUz/SNoHz3xMrc85nVdPM1VuwlkkM2KmcuqsZt4IzPpcd3vqZEPukV8UFz
 Q1wZLZvkNnCDMVDPFv4QVErnUTSQ+9VvDwTKh1lvQQdWOSoY1Qs3jj7
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

This change originates from the Qualcomm Android Linux driver. It is
essential to support a dual-DSI configuration with two panels in
some circumstances per testing. As the name suggests, this modification
may enhance the bandwidth robustness of a bus.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
 	return ret;
 }
 
+#define DSI_VBIF_CTRL			(0x01CC - 4)
+#define DSI_VBIF_CTRL_PRIORITY		0x07
+
 void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 				  u32 len)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
+	u32 reg;
 
 	dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
 	dsi_write(msm_host, REG_DSI_DMA_LEN, len);
+	if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
+		reg = dsi_read(msm_host, DSI_VBIF_CTRL);
+		reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
+		dsi_write(msm_host, DSI_VBIF_CTRL, reg);
+	}
 	dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
 
 	/* Make sure trigger happens */

-- 
2.34.1

