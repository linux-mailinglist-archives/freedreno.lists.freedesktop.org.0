Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50795B0088A
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EACC10E930;
	Thu, 10 Jul 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YxXKQmM7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF20610E92B
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
 b=YxXKQmM7GfaVVO4YjRxjbJxJIT5vGIejoFl8N0h3SZBFsgM45awPsDiHCvBpDmkwtBMDj5
 aB3kP/16/cM6XP/On5yCx9gQEEQ9Ycls9XUzXh6d6uNXW9R5IG1iQy0sYcaj/SXT90BWly
 h7q15Gu5oQOpniwBvdqW67G7utUPGo8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-6fErxW_hPPGRVuFwzWr4-g-1; Thu, 10 Jul 2025 12:27:50 -0400
X-MC-Unique: 6fErxW_hPPGRVuFwzWr4-g-1
X-Mimecast-MFC-AGG-ID: 6fErxW_hPPGRVuFwzWr4-g_1752164870
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so219948685a.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164870; x=1752769670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
 b=W0FkHKRvplsVEW49pMqgeX/95nDwP0l6gJauVAsJORYx9nHhAL512g8jIU7LNKi56s
 QX1P9tN/9BXggmlT+0ULT5sbJJ1HidK6ewmUPgOwgaxCtY04qm5BtQKmgcBo6ny+H55H
 wAt+G7ClZdV9di0FZEMVcE2T9dLivj4y603nKxxgKUUItQERYJpd/CxVxuWf9FjXK3Ms
 H7UDnHCUfJ+A2ozR+OXQtWUeOoNNdlCsx2cBS+kOOPOsC2huWyC4x9coPhA8phzfAfgd
 F8fG/xU/W9lnRNwxQ2YPBpDMKPg3DzfJNAaSWMRvUOh2TcLoJpMMvRqx0RLqa9W+syvb
 HlsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkMWdyCymVh2a4PxZP677ibSDfViZyWnFEryY8h/3EQj/PrwlSQoPH1TR25+2z1aHZQx9Rtkrm33c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoJQwPvEN7ha/NnMOhjnNERNmCeERYqF2VEwc82JUfb141Enzf
 mBheh+05whNQ/bsKi19+izMJxlJWlAeF2FCWtOhiGJXLn6auY3O9KKN9BNRnRUeiU0Xtcz/chkE
 7N1OZKQnuqnuGQQ8LMX4S80/HuUHROoGz8MRpUBdHigx2H7k+7cyYbKm7YsqjwwHSlb2ADg==
X-Gm-Gg: ASbGncuz7TnkEMOM+T4jbzRMVgquqQv47hubgcBECz0b0i3btp3mCNw+zRgotqzqlxJ
 ZplaFaX+jTWIo4nORfuViXr/RXxkQRwDv/Tkhe8JYl03FvDshuXk7hErTpF0xLUiaDzjZ9z/aE1
 JySfU3g9i2IEBqAtv/BL14VxJsptmMNhs/DFHjjQveWcKi2SgG6GXzYv6WFE8/Fq3dDUFc3KKXF
 e1PIuU0TIDzYcsWylqSwwWpjlZ0uufhbbFRvQ5PAgBWXFfF5+T5+ytgrVf6/wEhsNlodo42erzt
 Qdx+4jdj8DIlXNPFY7ROB0On6somcvG2iujOv8out0z/OzRYCteJdK+WYJHq
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id
 af79cd13be357-7dde995087emr35200485a.6.1752164869861; 
 Thu, 10 Jul 2025 09:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzID3fxPLzjceUNQ7ykn+etrxan44d1sFVAzLmbbmeJrEyagiiMxYKuKtBXqRalDrZs3g0iA==
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id
 af79cd13be357-7dde995087emr35185885a.6.1752164868703; 
 Thu, 10 Jul 2025 09:27:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:27 -0400
Subject: [PATCH 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1824;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=2tcX4i+WplqrfRmawSRGIQU9quR/NT2tlxOGP4FTR2U=;
 b=qzj4XInGJ7/EHJVBNG2+t0ziIbNz896g6fTJEvecN0CZRiGCaopgTV+PetsARQ4sfl9hv4ynl
 EW7hPRPg9BxC9pUnEaWMMeMPqih8fcUG8Gm5AhUD6C5SJGf/nMExHjE
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D_IBXBKCYTSfDVLk_IwJN0YzXd2R4P9NyceLe7uL6WA_1752164870
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index af2e30f3f842a0157f161172bfe42059cabe6a8a..d9848b5849836a75f8f6b983d96f8901d06a5dd3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -444,21 +444,21 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 
-	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
-		return  pll_10nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
-		return  pll_10nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_10nm->phy->cfg->min_pll_rate)
+		req->rate = pll_10nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_10nm->phy->cfg->max_pll_rate)
+		req->rate = pll_10nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
-	.round_rate = dsi_pll_10nm_clk_round_rate,
+	.determine_rate = dsi_pll_10nm_clk_determine_rate,
 	.set_rate = dsi_pll_10nm_vco_set_rate,
 	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
 	.prepare = dsi_pll_10nm_vco_prepare,

-- 
2.50.0

