Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE03B00A31
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 19:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE310E946;
	Thu, 10 Jul 2025 17:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DIvO8AdJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE71610E942
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
 b=DIvO8AdJDC2YwBdAa4BizATQLieIF+jRjNLYmm1gWP4S3E6TJUA/JbN5LO9QSYl0jD6g96
 y45vdIRHmWA0IsRQDOFaiKoUmPUGFfohKpEfviNZwc/qclp+DT5kaakMyqrP5bpxUvGuhi
 yefdMPJh0OSUj08IoCSfy/t9THzn144=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-O5oMOkmwMXCIFIIyDBlrMg-1; Thu, 10 Jul 2025 13:43:41 -0400
X-MC-Unique: O5oMOkmwMXCIFIIyDBlrMg-1
X-Mimecast-MFC-AGG-ID: O5oMOkmwMXCIFIIyDBlrMg_1752169420
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fabd295d12so21689056d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169419; x=1752774219;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
 b=TyP5heKeRQZrV08ypcUd8UrgWuvs8K8UtugPaHPGro7NA3jMTyzDLHj7sCJklVnh++
 Hsh1FxBuG/c+MdcZWSU9wRXWgsw91eWAAFLf+f2tYep3mkgi1I9ybbsTr26z7M0rUCcA
 eWv/Cputm2PNFU6etnHag9LOqTzLOYQ06Cn1LqSQPCKR62kuhk21zFwpXDZqvRVdmJj5
 WhHf63zm8uIV0JvMMK4or3IxjukbmJPEODS5mS55cwiQHdsyW3Lxf/fyjRwKV8+Dv8Rp
 9qJM8x3t7YMS+SYglomw1gHFbtkR+vU4K2QY6XzRJm3r/tQtYHPU7fs0IKHhbA0LUsEe
 P11Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgY+vDTu4JTTnctO+68+bSCHTPGua83AArtIYO9Vn6xWE8s9FtfhZw767wKGIL+yHsZpGQOYiLKz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBQXsa7iTslSPgL3mGMiEzcBZ8r/O/WOTpYLsEAF2pQ1bYgOff
 q5ANzIXLAtp8a5YGqUmqhsSRNW7NRN3WLiHUDj0sO90xAlFm93wu+f7nUh6jQ5Qml4hiK4K3rjO
 NQpUqSQWY/ErLFAkIVdXxH8P15wdOMoIyydusCG6hm9nhF7XATuO+8hAFe18XXeL+s9ifbt2tW1
 1ABVkJ
X-Gm-Gg: ASbGncvzcPR02oXxf1EPNws5gfE5WUXSGlQ0XWl4v28OKy0h1GI/ii02+Mz9yCUY6CG
 D6Q3FyFh7/KFrtRkK9vwRGkwcBDVxTwijgmXfw7bKojyGYkgwVmVHBxts2tT6yOueAFqrCpjBvx
 bZSQ32JZVj81Y9rqK8uFDSwD9fYsiFi9Al8vk57qrMn8NFfv3lDUdq9zLRWOq2EtEfIbg2t5WH1
 MpygE80x/kQneSvUYGjT870IPMLxLebHtRBBpkH1+wBYr0C2J1Mw+zOEUir2w7VzLZ9wyiZ/3w8
 0obDtwi1OX6CwM2zuyaV5/OsiecI+K/RXXirDI9lZfgZdqPu5dUJp8gMGrL+
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id
 6a1803df08f44-704a354cf6bmr4069856d6.3.1752169419271; 
 Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHT9fVCmhXOEcnhqu3VFHhqJP8lRdJ7DzuHPSbjh7k32ODCAsPCUcL2Z7QyeRoPgckrF6a+A==
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id
 6a1803df08f44-704a354cf6bmr4069566d6.3.1752169418934; 
 Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:08 -0400
Subject: [PATCH 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-7-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2097;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
 b=Ksw8mIL+2RRN/KI5dE4mx3sGUsPAEzJtg6FBiWBslMJaF5i+drzv8/2cRkcR9a0IBfQcYS2SG
 tVJ/WPvWyYACv81xH4ZsEZ5zwtnc4MB29saRvfEdAfzM+LmC3xps5M8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OxImZ0moD0Mi73uuNinA0J3jX1R0Bxw_6oyqpYpV0O8_1752169420
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.0

