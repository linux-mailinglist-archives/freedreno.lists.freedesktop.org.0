Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A5B20680
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EC510E440;
	Mon, 11 Aug 2025 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdYZ2QFE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5810E440
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=fdYZ2QFEnRG3oEykvZ/uG8I98OLVp+Tgso+hhhtfwss4fzFaf/E6fxydjCMz/DaD0cvLlK
 VGO0K2kEkPpg7zR9fDuS+/MuYpBPHx8YNzT1YRIudVZwxaZQDZcbJJj4uAO3aZnvlkZ1cx
 1JFEmBgbEXCj999VOnZOB1eB3+uJzWY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-uLQeKNDjPnmxgdNklmDg3A-1; Mon, 11 Aug 2025 06:56:33 -0400
X-MC-Unique: uLQeKNDjPnmxgdNklmDg3A-1
X-Mimecast-MFC-AGG-ID: uLQeKNDjPnmxgdNklmDg3A_1754909792
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e8100bef92so967909085a.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909792; x=1755514592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
 b=Q5qe+kmQI5htvR33Q07rzlQJIxyfmfp+/6REhnS7MtqWBKj1qI8RTMoZxn5kHiDXqc
 8xaqWG5t8ulJN4UvkvPcoF86mYJ43w6NX3k9P0pptoW9/KaXLNWB6kp+filq/ZHmQVN9
 njEoSBOvoKTSCLDnVCQqrJtqvy6hC+odORVylVw+kSvjNkHB+u19lezZSixzmVBmLN2h
 u8S/OpBU6VPCSzrJ2XQbvDtMn/pY7QMcsyZ2Okbhx6K17GBBv12BZLrf45QtU2cYylhM
 1x13EBWlPuy98B37ZICk6xNcsbcTLPE6P7A5ZghPEBwdnu4hpweChFkskurykCgDxOzb
 qvWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfZ8vfFR5Q/r7yaLYTmSJxOUjr9M/2E2jKo8GNFIIT72lpejlz0guH7GiXheUleHicMQkufTXCSiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlbrzrohuSGpH70qncdj9ND4YUHmRLmWyfuo31F2CMUyJ0Qn+3
 bap+vr/oHgH0UjspxR9y1XTmRJu40ShTPTtJWq5A6B1pW1hpxpnDj4c5CRGYsgjhI6NVR+z9lzM
 h0Rtl6dwSKbrJllavk9V+tf6/q/Jh4RiOm9Vdl49NZSI4SjGP4uXD0rOe927hplu+fUOMhA==
X-Gm-Gg: ASbGncvstzSdfSgVF6Q91v9vCSR3teX5wryLcq9GqaLfChfSRXxsEVPuRuwU4eypxxg
 Zl4zESnY39NxE7Y6Jro2QhZn62kuqgwVPi3AnEsg6IwX4QoMtp5vjTNg/b4gNn2vg171rGgZUay
 y37OgT5A0jI23DeuM6HeSYTKTjpfLYei5u8d3ymff661ljsfhnq4COwaC9R3MAHd0Z6YGVBCtFJ
 Lr2itOuOdSJUjdvOrvmgPlDEBW58OiI5jz6pVhG8pZtlK6kNFdX/6FYHUHd9lGF1seNetxor59h
 /1jByYplXzzC9E4Oki/C7P9bhf3b6kMBahbXsA3K+JPHkUlO1REE14qnnFGI73h0Ee3NbC3aQiP
 a5t4=
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843254485a.16.1754909792429; 
 Mon, 11 Aug 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgW8gZJYQbVSn9A8dMelBcES9raZpoqJep5i7D+EdYN7YXUJOpmuR1qZ1AM51jM57roxoq8Q==
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id
 af79cd13be357-7e82c646f33mr1843249285a.16.1754909791988; 
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:06 -0400
Subject: [PATCH v2 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-2-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1730;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9BXAN9WaQXGACsWVgeakYqAdywyzgmh/IMziqVvQDEg=;
 b=ylupjg1fmCNBXXxO3X3BdCWItZxz3hbcUzYzU1GUNiNNWUiYrAb17RJCYD00k/EMPQMfWhWKC
 RXc0CDE9VnwCgzocNA8sHN+o4QXxCM6UpLGynPKDC6JbO0dbhiFFntj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B8NLJxWSWaToVsfku_ne5YRhqM02aM7Go_qRUV-x8ZQ_1754909792
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
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.1

