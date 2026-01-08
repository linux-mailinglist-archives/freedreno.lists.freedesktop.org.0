Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838ED063AE
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 22:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DDC10E7C3;
	Thu,  8 Jan 2026 21:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JxU0u2rA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8410E7C8
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
 b=JxU0u2rAqLLgObICtO/LydX4/F68sVrdPi7tDQ8qIcYcf/4q4vTBeCQt8APznRlIc3irsA
 mSc/8w1RSNM7WyKl/gEBKqBqeEZiGg3L+W8KZTE0V1EFK+kEMthHtMnwyKbSXzJ262L/Fp
 8K4OjlHCkk3MEkwSd5785vNfEzVmoCs=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-xQfFbxSoN0eyV8Q11eQibg-1; Thu, 08 Jan 2026 16:17:05 -0500
X-MC-Unique: xQfFbxSoN0eyV8Q11eQibg-1
X-Mimecast-MFC-AGG-ID: xQfFbxSoN0eyV8Q11eQibg_1767907025
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-94120e0acbdso3870697241.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 13:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907025; x=1768511825;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
 b=XBRQ3cUmeUMV6AfsI5iioOKgycdiPg+WijBZiUKh248fjukoK2fAR4CO6lL40cJFXa
 /uoRCJYIYpeliLyqscogFP1hkZzFiUKY7liLTxcdoHYcvcBIl1tKoJ4GZcXxrNMlRp4n
 o5WIm/iOCLyjKNDic8+8A4m9nP+SXA3RhKASZLu2yDPKFfBDOlnzBV5gNOOEHs2EFb5K
 /3CBCm/b9R+SZUCdtBXT/l54Srpns4NYa2eVACcQFRgL3YCwfLTJkJCTUTTelY+Gztc+
 WtGx212Yb/oByUNyno/FSiKOjw3Vt3zU3YGxLVZJGHHdUTL56YoSIMY5a0RUn3J2cNaI
 iT3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6GVv2ZZ9pVsoKxm+DMXtFH/YSH56T6EoQJqGL6/mLslTLdYkiwV447g5GUx0dUUmSKnaWP86UCjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWMODL+NidR+S66HWHqa3c1eO7Mfi7mfhnImYdiqxzVOY6Vhl4
 lQXHJqBMMuJvC83r+RWTY+CcRdpyqWy0DY6aJYTukJlMPFu20mtxMMw+eqe/FxPKKsqFub+y2NP
 0sfKLsiMNR8isgJisjBrn5dBRMk4174iXu2hNeSos1j+ZXt2Z9I8dpWfdt1tgeIAqfIK7UQ==
X-Gm-Gg: AY/fxX6LQOgz0mMAe3O0mEFrz56Je+9XgQLUiKsuH8idYtlFxRCFvi3cqemKmBIDRAK
 3AUsf1GLiQx7SO26A4h2421QWnvG5gIWtj76s6Ydw2koXmt06Sy6kBuCvcjS/KpYEUHnPx4nWeP
 0LPB7LIM/Gkh+PxprN4QWXhVOyMq1H8vHXagw7VbFAmo3RrL3SU5u7bAnPqnXp85/r7gw0O9Jj0
 dLNVxFohU5QYOWDdnotrzHn5HEwqtT5OFm5hh4uZZlEg1V6l1vSZopOMGlhtd8Wl17TXw+YzdFP
 1zVLvAo9EExxHbq5Cnc976CHhkV2AumpS0Vl6Dfi5q4tA3PQ0CvzpNF6JdX5Hzp99lV7xw72X2d
 jyJHAm6YYUyidSls=
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5ecb68aff05mr2988591137.21.1767907024796; 
 Thu, 08 Jan 2026 13:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz/p7kGP9fvfk2vXLPq3R9VUjKVw1cdN6NrP5mq/P0PGpCjqA4/hKeGKMrVWaYIPrb1wIVZw==
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5ecb68aff05mr2988572137.21.1767907024314; 
 Thu, 08 Jan 2026 13:17:04 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:17:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and
 friends
Date: Thu, 08 Jan 2026 16:16:18 -0500
Message-Id: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA0kHizsVcYO2kQNG3WkKkLpu
 6/s+B3+v0BWN83w6Aq4XpZtTw3cdxC3Ka2KJs0w0DASU8D4eaPYZaKOvp9J0KdDkeMizGGmMRC
 0+Ou62P0fP1+1/gDlVpEzaAAAAA==
X-Change-ID: 20260107-clk-divider-round-rate-1cfd117b0670
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Michal Simek <michal.simek@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lb+j2COyZDSrq1aGtHuW3Hnjb6jSZa7wqEZi1UKM
 +/wfPfoKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCLePxj+cE8JZ4ir1XC94hPf
 wLfqhfvjO0u5RdiClDPF9/n9TrNyZGT4NKcq8ciUz4qK0XG3a+4381Zd+31jtWu5nMfx+TvuVsY
 xAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wCyqcXbP9IUB7V4O_vo-_tHRmQhviNunnhJOidC0elc_1767907025
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

Here's a series that gets rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

Three of the patches ended up being a more complicated migration, and I
put them as the first three patches in this series (clk: sophgo:
cv18xx-ip), (clk: sunxi-ng), and (rtc: ac100). The remaining patches I
feel are all straight forward.

Merge strategy
==============

Only three of the patches are outside of drivers/clk (drm/msm, phy, and
rtc). For simplicity, I think it would be easiest if Stephen takes this
whole series through the clk tree. Subsystem maintainers please leave an
Acked-by for Stephen. Thanks!

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (27):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
      phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()

 drivers/clk/actions/owl-composite.c        |  11 +--
 drivers/clk/actions/owl-divider.c          |  17 +---
 drivers/clk/actions/owl-divider.h          |   5 -
 drivers/clk/clk-bm1880.c                   |  13 +--
 drivers/clk/clk-divider.c                  |  44 ---------
 drivers/clk/clk-loongson1.c                |   5 +-
 drivers/clk/clk-milbeaut.c                 |  15 +--
 drivers/clk/clk-versaclock3.c              |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c  |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c   |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c              |   6 +-
 drivers/clk/qcom/clk-alpha-pll.c           |  21 ++--
 drivers/clk/qcom/clk-regmap-divider.c      |  16 +--
 drivers/clk/sophgo/clk-cv18xx-ip.c         | 154 ++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c     |  15 +--
 drivers/clk/sprd/div.c                     |   6 +-
 drivers/clk/stm32/clk-stm32-core.c         |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c             |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c              |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c            |  16 +--
 drivers/clk/sunxi-ng/ccu_mux.c             |  49 +++++----
 drivers/clk/sunxi-ng/ccu_mux.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c             |  25 ++---
 drivers/clk/x86/clk-cgu.c                  |   6 +-
 drivers/clk/zynqmp/divider.c               |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   7 +-
 drivers/phy/ti/phy-j721e-wiz.c             |   5 +-
 drivers/rtc/rtc-ac100.c                    |  75 +++++++-------
 include/linux/clk-provider.h               |  28 ------
 29 files changed, 257 insertions(+), 408 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260107-clk-divider-round-rate-1cfd117b0670

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

