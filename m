Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03112B1FCE5
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFCE10E367;
	Sun, 10 Aug 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H3SA7oVD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7410E367
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
 b=H3SA7oVDblhdYHC/8RY1x3ZfddB14oTexnLdu91d7Bp1SUyrdYuBzHhxLH3f6rh854CZf9
 9inCiu4e6YD82+ni/f9biwxVCQPSosreURsOOODOgFGJQ6aqiSR4bkPTghXz0AOi3a1BH/
 8JxqyyIFAYiFLbDjdEhk+1xWZeH4QP8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-GolIvK2ZPrud6ot7NNoQ1g-1; Sun, 10 Aug 2025 18:57:48 -0400
X-MC-Unique: GolIvK2ZPrud6ot7NNoQ1g-1
X-Mimecast-MFC-AGG-ID: GolIvK2ZPrud6ot7NNoQ1g_1754866667
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b065932d0bso119329651cf.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866667; x=1755471467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
 b=nlVMdQ69Ms0P1gtyqHcqVMG2hjFICnoopps8Yz32x5fA4mvuYPzTUW9nTXpHFUP14m
 z7tPgbF3n0WXM2OOAi2GeMzLteqmnBHhPoIMMz8uVF0nfcOZiZe98S7T7amUfuDdTf7w
 xlt1Rc6B4LkY/PkEBzZfPQcVM5OQMTEabhTt8nTmrMJS7X+uyTGiIJElhf6euI02dWvx
 oytZz7RL5/RcMyV1aaab/8VU3X7+6o3TJx9RtkhysoTUDtozP/GUcMK1Uwi4gmx1z7r1
 FVlS6vFhg9YVwxW+55osqInlcw+XIL4Nph5SYw+7K2BXCpV7hoaICa3hiiaehwO7LrT5
 BeeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw1jRjqFs94r2M+MgkNP7iN+8Wd6OZOaPNvgii6GM3Ib4obZ5G9SSGt9pWF0roIhzvQGehfdcU6I8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEFkjKljV2bkjggdnxUhJHhNAacXNGcn/Xp/8opLP27KNPqTFO
 wz3ZUFvC4A+TuaA6bFlm18Q02F1sBO0s116OQUmk2xjw2wve3OjXZGyee23+Dsb3fiEkwPE9BJy
 K7RekIBkgvtCzf9rzLwd4KknL9qwrzJY/w7cwNAMo7brYxnoEZPFApbmg1rcBR0RyWZM+TQ==
X-Gm-Gg: ASbGncusovjHVKpwVn4fGVJL31MgGrGjsdpc6pf329VGYJO1qEa5N/VVRK/qEu6pIV4
 9wJc6dHwa4OlbDgbA9Yv7V/h2P1EYW5f6RSQ7Flaqee+lc529Y9UqkFIlqUe12OMxjGPsMjrLC0
 O/HkUrhF9QnikW/LfCfXAM6GX9C+ydKbEAvwSczvUaH1/c8HpV57X0pJy+ilz99Ex0uTd8xTlm0
 c1SlF8PO5NyvZJfO/vPhAJqPORMN1WdPccONnaSrSKXiDosqdPACQL4yGKIEnt0XZ76fspkRtXW
 UsNMbgubhtm37m9yfpX3e5vOWSso8q+n9KY0VAro17qHYq2+jcS0FboGIMR8yJeC023EpF28dbV
 wpRmOFw==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id
 6a1803df08f44-7099a199543mr177311466d6.10.1754866667585; 
 Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmz3g1MbcKxpKoE+L/OvCm0G94lPBEhAXAtzenne1OaexYFo15GBJiT3E87eJ0e4mZmWm1MQ==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id
 6a1803df08f44-7099a199543mr177311176d6.10.1754866667214; 
 Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:26 -0400
Subject: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3160;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
 b=g/OyIxfyVmL0j+PhW5RWDXbEs2uOlzP1vLM9nzajU+5emPdyje17xtKS5Qd4HfejxqWdsQWeZ
 8ROBSPZGhvzDt9b3VBZA5OUUGLIt5EVJPoH+qM81ctxrdXWei/umj9J
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Tlp9IVtgtX1FsdOIBizwFxOj-RdpH_DKUE2AYcyMY8_1754866667
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
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..fdefcbd9c2848a1c76414a41b811b29e5fed9ddc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,19 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_14nm->phy->cfg->min_pll_rate, pll_14nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +620,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
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
@@ -680,7 +680,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.1

