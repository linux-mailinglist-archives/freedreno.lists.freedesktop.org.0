Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5CB1FCE0
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DF110E369;
	Sun, 10 Aug 2025 22:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E8bqvQIQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5E510E367
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVC0fsmzSbmTSL6eyVRHt/hFHyj+fClbPc4jjMQBQNc=;
 b=E8bqvQIQkELMDS9sPnuHDdUdMKydEf0zBwRgj0apyhT3Kd5Rf90ZYvn56jetay+UGBrXey
 Smuu9FaLEVyPKa7etM0c4MK/QmfrVrLZOE+RsclJIIayxeD29Z/lMGuE1IFiVWNl/rQf5A
 os5nnI9I8ki8Zp0qln6IOo2odurs9lQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-70Mh0EB-Pqa5DNGtgnX7pA-1; Sun, 10 Aug 2025 18:57:42 -0400
X-MC-Unique: 70Mh0EB-Pqa5DNGtgnX7pA-1
X-Mimecast-MFC-AGG-ID: 70Mh0EB-Pqa5DNGtgnX7pA_1754866662
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073bfeef28so41925356d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866662; x=1755471462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVC0fsmzSbmTSL6eyVRHt/hFHyj+fClbPc4jjMQBQNc=;
 b=uvqyqDtQW7JneH2qwpn618ZRQ3O8GblN4wCXMgjOeNa4ukN7wVyJCtnpT51Z856nVv
 EQhAZJsEgWrHw/V1G+L0HNv43ADCfeDW2l/98QYmoxlOH+R3PQW6jBLlsMSKKaY2djJa
 2upNmxlvhH4DJc3DA3+KAU79Oxw3zacpqrCX5DQgU7MnZAO3yFccXs0DqMcQnwi4DHeT
 jpRiTaiuW1pl/iYOWV1lrwDLPiKVhz4Vxo0KBIExoQlL1Ni0mV6VNBSc2tcay7anh+mc
 6vOBYOOTIDw5cvSfY0pVnCon4f0/4fyqUa2fDPVXh40VO8HZV3aYUBfa3oOKb5cxwj3z
 XDEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrUy0kocmLQFx1QHFutvcBjuOuBtXFQz5UIcOlDefOGWs2VmUuFpOeBgrL+mWNvpjz0BsbUXuWKFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoTlEGudiYQOBdMo5yzQhE/iqBYTml3Rcsr4u2O7gffPdfEEcv
 K2vzC/uUEKRcRCstxsFVlPkvPi04EdicWxnLPm3ZeCUgNWiCF/uh5cKVv97+3PQQ9FGmV+mnthJ
 UxcZZ+y4bch5YQqgy+DcUJPEQ1eUJaestPnw4OltqyyNEkihxNXAX8iDyYIIK6T7K/OvSJQ==
X-Gm-Gg: ASbGncvRDKgBrUUIZUtmMtB/PtGyyUE/8lvuxfE5OmoLBryWUituosgt4TwDS+NMsiM
 JENcRKwYIjSxjaU5ze7bLlidbUu3r1di5p2khJYNce8pWYhdY5xkT+xJf3fmF202G+qidaIBIzN
 y41jAlqp2+FWyxvCkRYnKnkWR/poZUfEZxIPiejsVmdKvOqOZ0+lUCMuiz9ugp6nBH5U3hhW+jk
 A8Fw7wk92YPHIvtjcf4hS9RlThAUnzA3P6Lds5ZH+aS4HaJ0SqYlBOVkQLBQGMoIeC3+wOEX0eN
 l02stQeUEQ/EEo+sOo1ZpGDWhM2AbaYo2ZuuWhSt+Fe2jJ49CaOU6bAgcsNrBueKalBxS+Sln20
 lfdF84w==
X-Received: by 2002:a05:6214:2a45:b0:704:e0ab:a9bd with SMTP id
 6a1803df08f44-7099a3e56f8mr122299116d6.24.1754866662366; 
 Sun, 10 Aug 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcMnOEXwtR8lN8UlPgOjL9+Zy3/GaRT4D7BPMh+oeXRYAdB1ptGpb4wo7alWACslPJfTQXCQ==
X-Received: by 2002:a05:6214:2a45:b0:704:e0ab:a9bd with SMTP id
 6a1803df08f44-7099a3e56f8mr122298976d6.24.1754866661965; 
 Sun, 10 Aug 2025 15:57:41 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:25 -0400
Subject: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1786;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=mlZH8VUTbF6GjSuW92dEJqa/xMC0PXyQyKOZ+vDaxME=;
 b=x0tYnThWbgPO4mmw+Gsp2C+ceOXEYoVMWAX/rkUBoIKXhbcdtiiiH5Qx0bZYWg7rb85fOnwgn
 te+Em4v6YAqCUom67xxN5Ay9xj6+tIi+ghcjTR1lViL5pmDtQqvYeDu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hh4wUDE-i76u58KvOGivzfOVdOuruQdrLjkjM_ot7qw_1754866662
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index af2e30f3f842a0157f161172bfe42059cabe6a8a..ec486ff02c9b5156cdf0902d05464cf57dc9605b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -444,21 +444,19 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_10nm->phy->cfg->min_pll_rate, pll_10nm->phy->cfg->max_pll_rate);
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
2.50.1

