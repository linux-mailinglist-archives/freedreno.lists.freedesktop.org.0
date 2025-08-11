Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7139FB20684
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6AD10E43F;
	Mon, 11 Aug 2025 10:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M50D6U3V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDC110E43F
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
 b=M50D6U3VZliH6yNLTkh1JDR2fkGhSYetpLpYy1CHXkf5Symtj/vS+cdrJISrVHalx+KkQi
 z8Xvk5hlxdUtjvmGQmt2LdEJ5n5Q5Cm9MYRF3DYRl5Z2/hA35LLQsRk32O40IPgy/DMpvK
 BQTq3aKKn1mEHqismY7BiNkexV4gMiY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-3NjBjwU9PZ2cNBQ1WB3g0g-1; Mon, 11 Aug 2025 06:56:42 -0400
X-MC-Unique: 3NjBjwU9PZ2cNBQ1WB3g0g-1
X-Mimecast-MFC-AGG-ID: 3NjBjwU9PZ2cNBQ1WB3g0g_1754909802
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e82b4ed799so705390785a.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909802; x=1755514602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
 b=PfxtugUbNtUmGeYSmjPNefmBklAmKAGmDqgM0CErp9MymIgye9QcHfYeKaKGRDBDHm
 kiITC1PEWuzKeIDTQAYJcdUnszEFPMRJHQ+WWaQMH8xCH1R/vL2rBia6rX2/SAAzcIoC
 MQHvbLIfPT/9kbPxFqLG0uEbk4PZQZvG/4I+H6V19Hnf7j41F0tc5xHLfWw4Ykxmv0I2
 9RJMTFF1wGiw1gbmzUs72JLVeQodAHqk9Y6jWj/YPg0WdLzxnVIfKfqWay+BHsiZjwpR
 jFPHR+tS4FZhGrbyO4xXspWa1corn59cBb0/jraskOgN7esDmgAyWp6iqy30mTMnNj9b
 VETw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbKwa+8/B1dhp/4w9H2ntPchpiUnEtaQg7a2RoMR2rSqa/MkkYtJnRD1VONsQ46IDDvtUrSY62vdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTLPR3rG2GH58oSN4LtC/19j6joT/BFUSxlVpYiYTf0cBRlj4I
 17BwJk8lbsTGk1y+4/3XI6uGsxxDYzOoBATerd16hDrlDrLLPCTQBeeHcu2JxJR8LI7kYe8p9FB
 plTWANnWMDK647WTgYC5ajS+KclVQt91n0Ywdn3xLhIG6JgxC9MeWf/2g2wlDWjfTE/26fw==
X-Gm-Gg: ASbGnctZuoAl6wrEknfsqootSGPAyfBEAigcrDaEDXv3SNuiBmEkjulGed1E0maWja+
 rd8//Vi0/1I2pp0eHDJ5L3BKt/JvHV4QLOtlgf77T7X3N1tLDQjhbZ4FDZWKtlQCdKYlWqWwbCW
 SdUHTX/n+YTj7egupGBSSpokamnJXmCVvBky+vEoLtvn6dxNgJF2sQBDL7tD5ZZUjRzUpaMEUpY
 pWuOZOgrzzDw45sljElngWglAnW0LSkXvXntBBIIntyN4Pa4w3tDfs4EUM0qeACZqWbpAoivdT0
 pTNyFpnqk02dFe5vJmaRC5txQ5kfPxZVsJtTcb7Oy74be2APRtjo3U1KH1WudjBTEHqB7Qpar+P
 KnvY=
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id
 af79cd13be357-7e82c6834edmr1680334885a.25.1754909801996; 
 Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4J1YPALYk3sfXKt4CIgszP9xA12/nZjPecmiJUzpdOL3Mq3At3CKB2rvFttPLfHNTO7lJg==
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id
 af79cd13be357-7e82c6834edmr1680329285a.25.1754909801517; 
 Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:09 -0400
Subject: [PATCH v2 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-5-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1718;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
 b=NJqHQ2ssaD4y0rqVbCbujpIrqzdN3VuMWj9ghDV3lWlNDbiI/oggFqGjuVCZHps19PnD896Q0
 9FdZ8qhj9mUBZ/GerZTn1O4AjtYG03lLvn79VW/TKhLY3AumrqAiB+P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bkPNtCYeNKNB8UqJdgIslZstEOQu3vQrLUF61Yn74Ho_1754909802
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.1

