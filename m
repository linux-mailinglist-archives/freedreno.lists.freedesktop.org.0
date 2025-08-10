Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF8B1FCED
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 00:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11210E367;
	Sun, 10 Aug 2025 22:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RjTmiGNL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA22610E370
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
 b=RjTmiGNL2tjpiJzMXUy9oCYJ0aLb3y2RWfg/bbkUHb++BM9eO6h+IMwwhbDrFwaqLc4lUJ
 ENh11W+/GmLhEvd7WEf39j4Ke9cFhCGaAcALSdqQX4NC5/wvOngKisFysRgXf/khw/X3SO
 d9hC6S5C5WOwC++nfIQwpBAT4E8Jp+U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-AVp-9gfKOFqB3fbSmiSmRw-1; Sun, 10 Aug 2025 18:58:04 -0400
X-MC-Unique: AVp-9gfKOFqB3fbSmiSmRw-1
X-Mimecast-MFC-AGG-ID: AVp-9gfKOFqB3fbSmiSmRw_1754866683
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70707168c59so40447766d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866683; x=1755471483;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
 b=kUhP66jFlTC9zaW0VrNEuacbArmEwzKLN2iH8xsqmYWt2ZT8iDpx0pyEerVLUI8C6o
 uCh+NTEWLlxTw1QybtsuunVraRNiiKGXZXplFw5LWpj57mQ9fjN/tVcywSAFdZC0gw63
 36GzXLZqV6KYu1JKvsAlw9y6hdmJG+ZG6EhZA9FOaRUNT7WuessUMRLe2ArKePPuJ4h1
 wUR/cK7IaGdUaXioViU5fb5ACBSviCqI0QqmAtkjw2W/Lil5uoVRzM8zKjO7lnTTG/Fz
 T8ugJw/nqeaM4SFxSHsPafoU4sr6/wmBaZSSHDVrU8N7K7zqzfFU1RzTzr9zTORRhOfx
 47ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzWcXHfp9FztA/4FjCGRaVAQ51sUyJZbwnXlEUwQL66AsOxIqM3wzyBrU1AD3kAuucnXRGhXsCtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7MRaqfT0aKB6cIz8Kr+WpxFM5yRetREjH2CrJg6pEZ78+Xu89
 ZC0GaoccOG95sDqsXFUuDXuwcWksDpDD9p7M6OsiF1yn5TQoAjT3xe24NlAfTG5qWMAbKHUNayw
 pfOa3KdMK19+KUvRxybbdTFmv2B/yvzqc42KrgP76gFzUAKuMV8/4Bmt6S7oLaAu+uAQYFw==
X-Gm-Gg: ASbGnctLhPuOl/bGwib7UJC0karW7/55xprYxQKJJVsZ78h27PSM20CsBDNN5X5KNDE
 o4BETTxZXXfDc7/XQetWhAMeSVe5xBE+pTyJ+zblW6vsoZNijVMKkGjh28p6wDUQ6uZJ1E1Xe6f
 Zrh3LsugugSULs4x6oL22PD4na9Ep5X0RgbLPk6G4Zq31VOIHcUXirJMfwM2bVP5RBKOVr+/v7X
 Y7YIOSE7W0ppgHl6i1nU7Ht0s9RrC+S1x1MehYtp1l5NKzGAeTAOKaTC+z8qizgTrSPgJwWRZNV
 0xPNOWw4Y6Omm7R7+KXV5BWVWZF9yIEH+K9WvviKg97FcqEbgVm/zVtQPuz6rjV57cksmZVrTVf
 bZBMleQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id
 6a1803df08f44-709ade97506mr71682846d6.43.1754866683160; 
 Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkOu59xQUnrcN/f1twSlF1BrFwL5WoLAQ12FYDXq2PWIP1hHCC8VcITCPbW5zGS+dtgeykrQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id
 6a1803df08f44-709ade97506mr71682586d6.43.1754866682705; 
 Sun, 10 Aug 2025 15:58:02 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:58:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:29 -0400
Subject: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
 b=hYrBk5VBcqe8AFaw5M0JbEMNQ/+5/EqgXMuDpqvpMtHJTmo1+Ev+Hog1C/ZssRnCSzPfMgO4W
 91f5Z5fMemWBs805qoxKufqYrIgn1TJu66F/ixECjawgTEoSUzz+mJo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YaVDuaza7kslpbSuwhYewc0rVEprjhz-cJi33wePaDg_1754866683
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..c3bd3f89434eb7d3d0f3bb9455d22aa00915e797 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,19 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_7nm_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
-		return  pll_7nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
-		return  pll_7nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_7nm->phy->cfg->min_pll_rate, pll_7nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
-	.round_rate = dsi_pll_7nm_clk_round_rate,
+	.determine_rate = dsi_pll_7nm_clk_determine_rate,
 	.set_rate = dsi_pll_7nm_vco_set_rate,
 	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
 	.prepare = dsi_pll_7nm_vco_prepare,

-- 
2.50.1

