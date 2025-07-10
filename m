Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B146B00A2B
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 19:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330510E11D;
	Thu, 10 Jul 2025 17:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gIxkbYzh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6110E942
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
 b=gIxkbYzhzJu9VXAhX0wu0qWinqNz/xR4w9iiOZTxiv+FyLatwWf3B6i73Rwg9HJFIsU6Fq
 XgljN4s7m+HJu5Kow/8aEnc2/vbjHtl+19UvZLc8tQCiPaobidwJYcfwVNuNY9M1W1CTq7
 NWrJnlIh52wp7Z0cEjnEhOI8kby0kq0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-44TShmeKPzmAonc-ZUeXoQ-1; Thu, 10 Jul 2025 13:43:36 -0400
X-MC-Unique: 44TShmeKPzmAonc-ZUeXoQ-1
X-Mimecast-MFC-AGG-ID: 44TShmeKPzmAonc-ZUeXoQ_1752169416
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d45e0dbee2so203192285a.3
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169416; x=1752774216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
 b=KN45tuXyE2KHe7LAaNMSLst8y1JlrstRbTuLSTlLzUxBllrk/sIStsSiRc4fSmZS4D
 6hIy+eAcqwjWzxMF0mmJcnXiCOj7sK8RiHOnVUv9XStPU1KqmwrIBpyUCDZQ32nRtbZC
 njXd7Ri+CrUI9YpBUNz49NSJc4Ioa/RFlRc0Q+C2Q/6jjyGHtIlKVpLHpylvGxC6BAaF
 H7R3SDb1O8lofYkaAwG3L//27NnXJpbFzI91CY7kajhOV5gYtj7vaRNt/0i4S2/bPu8t
 0JlDaDgqcD/dhL8APtkGqtcyLm5TQE3NgMjkinhXR1VWIoP035tJZdeGsM3+jKPoxFjm
 EMGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqfUG5/WZlTQ6ThJb0iLmDRewm0XgMhiqdFzLigV04BvEkBNovmu8QkYzCrmN4+zVmWHExIdf/7dg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8zOB7sJIfe9bkIZwVMOlX+6GFaKZi+oDWYdR95dVHkvoNuu63
 Bl2PLUybxG9CrARETblSiLJ1xNgujRLF6DnpIIePhCTIMPWFh2MoRpNR5eznOKeXY7lbZ6C9Wyx
 EKixQQJc7zyKu/Mncwfl0qmPNX9sFoD2bdC3ZS7BW2PXQtf4td3Zp7kCfnEfPGRk3kMdzwA==
X-Gm-Gg: ASbGnctHe12+6eenh/Y2BJuMqHtr9zz5kF76j3aiQcdDR/MHKXImIoqiavxetnvL/b7
 muUCrVGwjkRgw+xvpw8MOGCr4txcNomzGIukQpa2qS18cYlNdxTLM8/Mvrjs8icnzzQ6zWI4wbm
 RXzACXN+lwE4aWbtRicQ4EYRH0JsDmWc0RPJWu8WloyfscMJGweB8OKshACNx8v0HVM07gOOKGp
 oUIY3aTWSkwqigO2FEATd8T4/+pqDWz8yIzSHDSx65a+dU1hCF2bawi0qTkL6i6L11tBsFxrrgz
 xb9/Td7Qn/OD9jPvJAR5mndw8x7as2m3goGEIV8UROOgZhlomY5pxdaGtcJ3
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id
 6a1803df08f44-704a3885c2emr3440216d6.24.1752169416340; 
 Thu, 10 Jul 2025 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS2Rzm0JfKmIyrTldYCoa+GfaWxjePB16xygyyHje51M4cEE7holVyPZ8C5FzqtnGtvcUbQ==
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id
 6a1803df08f44-704a3885c2emr3439666d6.24.1752169415753; 
 Thu, 10 Jul 2025 10:43:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:07 -0400
Subject: [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2405;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zHcO3z3+e99osmKzMokPyvWC6/DSceppfY/05RlRXYo=;
 b=QXQyVz/ESQN/1lpuOY+kiAZj2ii+/13EpYKJAuvi9VgjSVMZZp3cWkyo089YF/6/d4LrccG+3
 IcOoOTC43L3AvbwBhN/wVyDOB1m1IcbEamuqRU2PQsvtkEzD5/kz2nO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VkmrMl386J5excgaT7quGXW_KSmck4VBswbPys7TCjw_1752169416
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
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.0

