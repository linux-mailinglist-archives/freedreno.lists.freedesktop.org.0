Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D42BB00A34
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 19:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6610E948;
	Thu, 10 Jul 2025 17:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FNh7qlXD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A39610E933
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
 b=FNh7qlXD6m2QLcZ3QRT4K5kIxg92JTM+rUjeJk25DvzaNoB/evf4izVsHdYE8cqlmUJqOq
 yiRnOq67x67x4T2EwgevrqcJJHL56py6c0HPE9dmZBN21DAgRpOBHaW2qTO/4ta4i+gN4K
 dlNe6TpPpmEbjjMS2z/n9CJsbSfV2lU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-hayEzAb0Mpy94LqTPtf5nA-1; Thu, 10 Jul 2025 13:43:43 -0400
X-MC-Unique: hayEzAb0Mpy94LqTPtf5nA-1
X-Mimecast-MFC-AGG-ID: hayEzAb0Mpy94LqTPtf5nA_1752169423
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a6ef72a544so27684721cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169423; x=1752774223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
 b=Cdxi/gL3ZZa2N+pSmLpveOKXMonWpCYdKCIRTJLSKM1u3bJFPAvrjse3OnHg8AGMHP
 z4Z+ehLgf8bbibmpmOX4Kw8MTfgs8LW5jZPosIEuKGx3KFhK+sKLk0c7Bv3a9jW7WFCY
 ziQ5AjGX6ZXv1hdUJkApRNTcnHaW7oOEz+qV+xUWJBlc3o0dc4trq0BzW9bF6RzskUgU
 ugbXzfVcLMe/tNz1KxKe0bBSxC+ahztwjy+XRO0ogAanH40AKcZ4RSTBRgizFWuoQJoL
 IigWItIKMJD+YEyl1mOrjHg6p1jwFq4Pkum33Od0qispFbGQxmR9/o67Oy9fT8pDpwA4
 zRlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrLDHHq8a+tBv66jT39etVsrYhB3vifRdcDxBJYmaTv2pG9x8s72DK8oDzs7bm26pspgUGNTKHFOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwugqWQKR8q7WHENqajaRRTaVBB6qIK570DAsEuFVusIR927QPd
 GRHT3wK70CuQPT1Sm7P1ghsVVrCqnGyzx+wuE9XUtVLVOUBx3Qx4AVp5ZlH3SvUejDzjDh9N4O0
 5Lak4A2+y3FjS6dn8q+Re8yxnioIRYDo6feVgAhRxIKRpv9umEWR7Huzo62TiQhcV3W8nkA==
X-Gm-Gg: ASbGnctAI84fW4dSMNgYbyAzZLPXvqoIp2Gma3sK92cjJlipvPx7LJj6FCtYsO/PfnN
 T0Y+xpxSRvILEW0CICviIT4+w4oUytBZZSpELS1R1sVnLGLS1GjIjQ3Be72yG7NeDB6UjNnzbZd
 Vzh43guLWS+Ji8ZCc4sGB/1DSE8c/NSbQ3NizdkBaMRoh/XggVUvetqbx1dpbkWCRfxVuyDMBlu
 NXsIe8Trsvmtgs9vzUXG8zyvjAEHA75HV9af0mOKJHmqus4of4xkarFDr93Pn8CJ59JgE6knOWU
 vXzmDv0XX1c6vlhuvQPbAxwX/88x0X57KKeIkgiOjrcGh3hYaccDCqhrs3dg
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id
 6a1803df08f44-704a4325359mr1692666d6.32.1752169422745; 
 Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE946PzHD0RXk4GY5dDiYIFHgj5udxSitTpswAFFe0EalaGRnpP5sdgmvG0/oOdFa+px1bfeQ==
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id
 6a1803df08f44-704a4325359mr1692226d6.32.1752169422349; 
 Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:09 -0400
Subject: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1647;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
 b=ho7GtAWEeFJp5Ux6aTEtHmHkJKzsUOAKpGEfNDI+F7l5XbF1qK2v1eRvTIse1y82RTcxYpTS9
 vSPNZAJFAqpDDKhg/zIW7SbizIxqSMy8J+QnCYzoa0xmplhJw/HPvrO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F-1I4YEkwq8CwldikxKqx2ky5rG0jNYdCd3Ao3LKRow_1752169423
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.0

