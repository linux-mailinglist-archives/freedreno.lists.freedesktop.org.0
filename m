Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662FB0088D
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD5010E928;
	Thu, 10 Jul 2025 16:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gyus2Otr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4F10E928
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
 b=gyus2OtrlxWRH8FIlnRImO3Otn1NsrMXidqEorx1z1WQ9/TMYjtW6UleLaR/7P4rR5ZWW8
 ymZ6ySuK2hwVUQv41bFJZHtRWk/o55oGXOh8HnJX4rfeZLuHzQw1N5dE5S0WPHblBzAyLq
 g0EXPbvSmMkYVzrLwpOiLiZwbgImodI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-GAKn42bKOBWmre4pRzsTSQ-1; Thu, 10 Jul 2025 12:27:55 -0400
X-MC-Unique: GAKn42bKOBWmre4pRzsTSQ-1
X-Mimecast-MFC-AGG-ID: GAKn42bKOBWmre4pRzsTSQ_1752164875
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d44a260e45so213543185a.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164875; x=1752769675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
 b=xVSAv6KVFLtPg7noAYkbtutej8LaQAAKb9qVa2u6g53NUMJd/Tacn5MJQobgs6phYF
 pztZMNWeMxTUcZsG/2jAs0h/OBvyVwAaRywzGptHa5LtMpeqif/jIPPOZPlzqRF4QJ+9
 3glVMpM0eF5m0Aa76irqgNhxp+RRc6ucoiz9fRPhu/UFYvjzIvsBtdyjz9/WXrCGKSQC
 /ROguqxTWFq5SjoAC5acsyHLEGISq66B+3c5ncbd+6MlaNSMmy3H6sILBZ4PB9R1Bp/t
 NehZkARrjuKo/vHwHcCbBkpVaIqioYREgdPcwF555RGYYTqfv9dCFHh5akAMc9hCfWI8
 RoTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOaedMFHdu9acKJmWGhBxLpBHz5gux5l1aAwPRsMz6olvU2vw9Yc4+k1w8md8rJr96nTXJgdEN908=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5ZEMTyNuslfWGKBlAa0yuN/z00brdxENXi8j2A0pa0Xc9lgyJ
 YArWVaC/HF4u4amnMEUaKsKM90y+Fq4TEY4OZzPLTq95PtIJg5w30VVE8xdfYtLMcHTLeFpenK8
 aWFcmCzTSHGymMOp0eT7QCih42a2WHO09u437JF07L0aWUypZk4tAEJvwnnPDO4NsfN54Fg==
X-Gm-Gg: ASbGncvdKestEpJt+mRvWyHVlqMa5lWGoU1k1ilgoEivmPEAeOhgWeBvrhgiodFeh9k
 SU9S+2wDoTJldBPWyW/kyOqFYsKJH8buf+0BPeOJ9kdOjNa+nCxIFbqwIcFib1WVvlTD3DATk1S
 mHvUm7OMdo4UuokueXCRvm8o1kC6RZ1KKKMl//MqhZc7T1S5OIG5o/W5mHtxRmYl0P7telcSwuS
 ZFe1qP5exXpOk/6z+eTyh6TezfQU/TLDnMeGNe/R1QiKxw9cWPRL9zwL6qT+k72ssgS7Ze8SIXE
 S21dfj5BMVeZDknG/ELRBASUvek4IS1y9umfUOlbDhWdisyXHxv0MUOLV9+s
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id
 af79cd13be357-7dc99c97b06mr637919285a.13.1752164874745; 
 Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0LILioTmsFFFim3P7vjwaGEN2yDghNBYxo2rYKbBHf33eWtihemHAGlXYjN5wVdu8ijbLNA==
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id
 af79cd13be357-7dc99c97b06mr637913285a.13.1752164874254; 
 Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:29 -0400
Subject: [PATCH 3/7] drm/msm/dsi_phy_28nm_8960: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-3-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3065;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=LuIdTqZOB0IRg3CTS/bE+68lhiU63BV6cIYBbNqOn1E=;
 b=f34Vu5Am3Epc8RhAvgL3lZpMgFt7lkFGSFFJPkt5Aq5xZNEfkcTpI3h6rM13pyuzPIwSSvM1F
 NgAw7WN4IMXByyDaw/F9whWSiB6hkeMO9L2CsMqwBUVASiJ/wkk3IUg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LJVu5Go3EtdxaDVn-R_HRc-uUCte7UhP8qk5oA9Tn1U_1752164875
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 +++++++++++++------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8d234685c1aa3d4579e3dc766c000de1909f87f6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
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
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +296,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
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
@@ -328,7 +330,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.0

