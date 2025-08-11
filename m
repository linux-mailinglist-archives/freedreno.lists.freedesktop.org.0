Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B729B20698
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6610E447;
	Mon, 11 Aug 2025 10:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eUMN4dSQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6010E447
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
 b=eUMN4dSQ3le9FS/Y+6Y244khcoOhLYX3ErDME7G3+JqrItrM3btxiZa4VxtdirKP6n+uVz
 bKdOfahB50Z39mmUTDcCmij99rrkoz/YQHYs97rsBTh7lYgC0fX7KFzWbQTg/8Dqn5Y990
 K+ndaUng1xI4r+jRbtzKOn34Udo47z8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-4eAF3xIqPvOcYS5e9kpeTQ-1; Mon, 11 Aug 2025 06:56:56 -0400
X-MC-Unique: 4eAF3xIqPvOcYS5e9kpeTQ-1
X-Mimecast-MFC-AGG-ID: 4eAF3xIqPvOcYS5e9kpeTQ_1754909815
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e82b4ed799so705435085a.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909815; x=1755514615;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
 b=sS/VUu0Iqka2IHF8ARkk00MQXETUVAp4V/FfhzMIPEDDr0qCXnIDkAi9Bd/jvVkzHf
 rE8XVSFXrbmluwbGLhAHGiLjWHLadYxz/nfiDwDS7qXW/TIKLxtbbTKaVwxV9lJdC9Yy
 VpkXyb9MNqeU6ELl+1QesPkK2f3xwbx3HGehK+RO+hUP1jR4qUvjLcCJWsbgsjbqTK+d
 XyPIxlKbINlanrjv8aia1linW6oIPAckRwcCA5d3TcAeYEWJPrwHuqutnzAl0Y18W8iH
 IG/+9/OW+G10hOO771bvomFvZKb8xw5cA4l1KL4xkU53lp1yPTpTktoYXJq8eIaTj0gg
 2zjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGEtEp40LFYxU8xYolZ0gWiZbZafUjUZ073Qhiw8Kc6V8nPEIj3CGlHyfwz3SQKjYFYiQhIcNTxPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBCxRjaPOuePOI2rA3cfWUPdYi2lkS3iVhtVehHL/wsNDupdTL
 v77iQ+PA0BLwHCFGN9DZtS43I0VCKaYCitKOQ+b6IK4yr7EGiF3QkTCMSkBMdxD56GsA6fDfd9o
 1lvalUZjDu12BOnL3Dla0bp56xjDUqVWRw+dAAxaN+E0/g1QUmq09gEUU3zIl51T/57aIkw==
X-Gm-Gg: ASbGncs0UAS/PZSLtedxGa/Hvcb/FBRVgr+Fs1r4lHcDGSiAgLI4smrjazjX0K+hccf
 HgzwUf5ZdKTNpItLd+yw0X4z0mX1IKsbBZ/c+52x5mArA54Pgmbmcl5FDnmHw7AmIYj4CGE/MFD
 dA/Jy8+b7mjRz999zm8CkjAvAQ9VnOwjiMiar9Nha6HW3aTiBsYjLdS1r/rUDz/goSMzD+O9ygw
 cb7fH1sMa6+Vhjvzdz3Arrbl5BMb85oz5Y8NUJ5oz8dYJ1v0c5aNXDZaehoMahTU8djTzN/9AxO
 XMA/8kcavfU4gdcUlroYSahjh6SpY8q4g+lPwOvdsZ/460NLBWcwpGgCgGdo/WyrMvJbzZE5/7/
 PNbI=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id
 af79cd13be357-7e854f76862mr91488985a.50.1754909815385; 
 Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id
 af79cd13be357-7e854f76862mr91484185a.50.1754909814934; 
 Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
Subject: [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4y4wG8TBKZBUb3IbH47bLQJ8TN04ZHL_t_YWOTXGXio_1754909815
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1

