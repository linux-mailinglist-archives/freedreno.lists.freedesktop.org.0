Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5BB0088C
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C087A10E92B;
	Thu, 10 Jul 2025 16:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GYMo8y91";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA710E92B
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
 b=GYMo8y91X/8JpzsTHmBwXm3AAAUEFIe4zgxNZJ0/K0mZvIjHH5t9lvvdzwgQyUCt656for
 1lMcyaLcj1VkgoNEYYW+0HfIRhQI86A369eCBZxVpapOl8EWx4c9EzVYiG6q4FhVRgz2Sx
 Wg+xTX0GULfXk0971vqT9W55rQ4oCj4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-itammVO2Nme9HadlENop2w-1; Thu, 10 Jul 2025 12:27:51 -0400
X-MC-Unique: itammVO2Nme9HadlENop2w-1
X-Mimecast-MFC-AGG-ID: itammVO2Nme9HadlENop2w_1752164871
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso191579385a.2
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164871; x=1752769671;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
 b=hAoQ76DZ5d0McxrhPOjFXHPFw0z9DCEtD6hNR5DD8g1519Ymlk7kHwgGqDMQcagOvF
 nm6x7t6aC+cD+CbAd1y9tqhFWoIaWPRwrgX9u0rqNvrViKLrTLFEKfN+5aQho3rM4OxA
 pqsAPIvSPRqXon8ECa1lP+EGz8YOf0K8fWnaL59HaUZPweQUqoeeS9p7CugI+3nilptF
 f/N1d8mjUk/DVQWN+Ui5j1JMQd5gkiuOeas05hwTSep9w8Iml7/KZt03L8AqlhoEion4
 5Ez3VNNGhl4ex8+TpHUwI8q+Z5BrNVEbu8OpTbW33CDTzKXDc65ANsLOZsc0EH9A5Hml
 nekQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7o31TbVC4t4rpYk+9U43ruea6GjjJ8W1iLDp8IzyhDCWeHZImUq6ybWj7MBdGgl2HGmPKiLKe7cI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjPMHwLV8WFrur0yVzRYgcZPzeS/HGzQzPS0yWTI4Fi+qijg4L
 f+MnZY+QRUfpe3k1zXwl1dP7fGjYUd+ck8mGrEFhOycMdbILGTRyJckv9fCovYdtsReD6B4QITS
 dvV2HPZxViuk9bYwQb3qcyGBucT5n8ZzSLvb1rqH/yP0/aE7Eg3EVrhIrIEpLezK/5GAN6Q==
X-Gm-Gg: ASbGncu5Gr5uuZPBcoOSUJm3iTcgHj9Ou3SjO0AsDKotrs/QzKDEy9Aqjl/eHlyCX/e
 G59Q6aotBPW1Qq5RN+1Ivo1Xmucnr12XzTiZIgbvzax9PbNJAJZNqyRNn7ZzcDvoG2607pmcwZ9
 ehkbxEq1MShIi+pYLgiIhMZE3SorklXEaulF2oAXqCOp2y6aFaG0RMN6Iw+kJBD8vXko/kjm3H5
 44mRTXpZ3Fz5udaCnlz1NI2dj1pcYW10lhR89AZV6C3wbQuW0BObJxX/6Ght7f3esxso6TPO5Cl
 TULk1du3jo/ICQYgZZar+fhZle2LpuYdB2dZRRUN2djRloa54uYmzoIw5aGk
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7dded1f16b8mr20791885a.43.1752164871199; 
 Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOyyYlCkE/VGPozckcGjQXSedTTbkLOtyXFJPCLzGJ2sRyA8bY8gLQAjWSxObzTseQLmP6BQ==
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id
 af79cd13be357-7dded1f16b8mr20785785a.43.1752164870612; 
 Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:28 -0400
Subject: [PATCH 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-2-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3196;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nqAod6ptbkqWsY1ReyritvzpOhyiZE8UL5uK1TlylSY=;
 b=OoNhhsZUbmAMdwPUtra7QULaHqehIf0/38bmAqXxUkaMeC3doTAw/V/9TIJKb+x9w7DYvOig4
 Gf4oVrvhKVRAcfxi2pcc58T03+pEYH6XMrMX4bp1bgSK7BzZMg4R1Tf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jmaKemSQem-rxY5ID2DR_aL3zF-yTilaedwByn2Q99Y_1752164871
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 36 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..4bc9b7e44ce775f676fc89cf4565adeb309f0177 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,21 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	pll_14nm->phy->pll_on = false;
 }
 
-static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
 
-	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
-		return  pll_14nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
-		return  pll_14nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_14nm->phy->cfg->min_pll_rate)
+		req->rate = pll_14nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_14nm->phy->cfg->max_pll_rate)
+		req->rate = pll_14nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +622,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 				   postdiv->flags, width);
 }
 
-static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	return divider_round_rate(hw, rate, prate, NULL,
-				  postdiv->width,
-				  postdiv->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       postdiv->width,
+				       postdiv->flags);
+
+	return 0;
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -680,7 +682,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.0

