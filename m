Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC2B1FCE6
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0C310E36F;
	Sun, 10 Aug 2025 22:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="STG8J45A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410AF10E370
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
 b=STG8J45AD+ceA/9DBiKAsNZN1OqegcradKjcfVE0DRCgCspIbnwAdb8Kyr/hxi0ER1SG/S
 uW1ttb4V3YZXQ8XGtuLhUzcIRbPSS1DoS4mOdY4u+/JNfZxfChiOGHjIXssWbytEhs/BBp
 I6Em4q/5zIMBQQgSoUPGS4DwFy9QFwE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-gndBRDGrMj2wH7D_ftVZfA-1; Sun, 10 Aug 2025 18:57:52 -0400
X-MC-Unique: gndBRDGrMj2wH7D_ftVZfA-1
X-Mimecast-MFC-AGG-ID: gndBRDGrMj2wH7D_ftVZfA_1754866672
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e7ffcbcf7eso890463185a.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866672; x=1755471472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
 b=D967ffqHzICr9rG0zYVxuhZ5iTW4FZOQlMkSFMoSCTiImXspwNqYLkhtm3/vjbvSDZ
 bf4eFHgKI4XW37kBixWTjY9YaB+BwI3n7NO0RgMb7c39UlMHFM/klLFs4e0ZE0F2Ktu8
 14SyW4Ti0XJ1puipH6oA+HpnICBQNyiM0ohCGs83juKzzMD7uZcDYysB8IIxnfOnEPck
 a8/3nptiuH844MBBhIOJud/17cX4zwmplZPTdx9SalWlCMVALJcHg3XEErzP8EByj/rr
 j74LtRVKGpHw9S8gAxJNrZbk1x6INE+xwQcTbQ6OnXdOyZ77Lnh81Xp6dXwPCjLu0Tul
 zlcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2R3i3KEs8HzS49QkujHPlxtBbP401qpSIQJlNo0qQbyG+6GOXtMb8JVFWRy6TE0PxZ+L08thZDSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB1kk0RW4Y5Q5KhNOGE2kzipXFe5yA9PMWXqFB1//KRszXduv8
 Yf5F2mLBixhl6jyfdIR4Nft7YmWgkkj/i1oOYWu5BJjBeoaORHlrYkKBHDR/xDZHALXGP8TbFMU
 nspo/tDPM7iDuzqIVyasGWTBZrSEuVRJ0yB14XdLwEzvavhCyhzDUGGvGaXSmyKB08GIk7w==
X-Gm-Gg: ASbGncuMutfV+0yQ75iNcT16cjjJBjFFvf5Zz/LztGzUZlM0PL9qa/jvwe7W9DPSzCZ
 kVPM6Os6nudGR0t9bKsXcEfS8cJWBQ+asvGLs0QN7t2Og14rumJwdLUwN0fxEAOnSkSc1KMh0+1
 dyuxQXLX9oPDcTNNtbRyFX8qn3lgFr+KuoGMroPzxZgWQ/Icjb6cFsWLQmsf32s124iieNxNeuY
 5nfwdfo/dDwR/FkEi4Fm3aexfAf6aH1A5V4E7BclvVL2HhO2UprCzgzSJWIC+SFQHviCZBhzCoZ
 UtPNj1R/+5wBYjL7n3E/wjPxwcmICI/lquaIzPuUtSCrsiAfgTuB4EV+VqZk8irv2ilvU2T0zNd
 hkyDxtg==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id
 6a1803df08f44-7099a19aad2mr137563026d6.5.1754866671703; 
 Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8jqqdlU+xWojFno54cfUqsUBZEN8YO23eSx1vJ00mPnhAbDT9uCqATLlZeCwNyroK4P6n/g==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id
 6a1803df08f44-7099a19aad2mr137562776d6.5.1754866671327; 
 Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:27 -0400
Subject: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3029;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=S1ThvUuOJst13Y/YlkE34LQrjuUVO54/oWHL+6E9CBo=;
 b=4rVxfvm9gI5nV5UAVPsesymzsnSyxITGfXVS5e8nQ7ETrG0DkGZDJjcM2GeRttJ1xTdECTbGI
 s8fyPCx6Vs0B/8HLHCZbs2HwuxniL7G5vx63VQcoWh5nqmwlomL+2OO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gmg8_joPKDVlV4BwzHn2spIV_oPoMZJUb6ZbDQ9e0ac_1754866672
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8dcce9581dc38730ab725e0e435ab93a04c527ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,19 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_28nm->phy->cfg->min_pll_rate, pll_28nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +294,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
 		return 8;
 }
 
-static long clk_bytediv_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_bytediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	unsigned long best_parent;
 	unsigned int factor;
 
-	factor = get_vco_mul_factor(rate);
+	factor = get_vco_mul_factor(req->rate);
+
+	best_parent = req->rate * factor;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
-	best_parent = rate * factor;
-	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	req->rate = req->best_parent_rate / factor;
 
-	return *prate / factor;
+	return 0;
 }
 
 static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -328,7 +328,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.1

