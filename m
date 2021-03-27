Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014E34B66F
	for <lists+freedreno@lfdr.de>; Sat, 27 Mar 2021 12:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B026F521;
	Sat, 27 Mar 2021 11:03:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062B36E3EE
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n138so11516908lfa.3
 for <freedreno@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
 b=C4ABTjf+1I+oVNozkaZuGs+wKMKgrnOVc+PKX/BfFGajdOSkWjvqPvBmhPv8Yy/E3P
 hWjfTA2BLyrci+Pnkp31bvXgNRqeHgOqKyg2mVyBH+pIma/GibqXa0w0JuXqwHlprh8V
 PRBtTbLFT6up/l5M+eFQOASguL0/ixCfVHTH6fTeX3Myl+4X1QWMDGNVHGy/KnXj3wmi
 rcvBoA922Kz0Um+aw7Gl+n3FqcJL3szQ5AQ7Z40fFkTmBd9Ay1Ep8mid6EwUKQFAeAZG
 bsod4m4tSzFVOIpiRkEfc/O049rw2eEhTvljAn6IBgmHyn7wD2AmvVgn//wFjGTyjpB5
 VZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
 b=o8+V1CB570iQJ6zIuCUUKbifT/wrOWJb15qcyjB5h9V/xtlmy9MJcCVv/GitMEJEKu
 FnpNSSM+U/4GJxzfN0qBeuPdkILGWFpFK+6t+9WASCqxvgV4UxtD6dYMfWjFwQXt6QgW
 zXKmZs6IYV+vc3AWg5QtxpIyolyerOEYUvBv/aTmgZ96j+jCDOUX0VQ9JnChu/dtH0pB
 /ZCQW8LOkuV1EaZs0ddu7ZjHJKRv1bcHbvXmJAubNIffnxAC9bLX2S7HiJsbkKTqHVBw
 GCCR8pY+ejr7GC2UKwyrxS5xsaZ2pFZPhsyGNiH+MzMkCWDZagMmOxRYBTjbaAWfKIF6
 6C7w==
X-Gm-Message-State: AOAM530qg6vuVNk80W9Y6zL9EupznkfwdpldpMG0Fu43U8pp6JONbGDv
 ME5ErQGovKWi/sfamHmDjVWhwg==
X-Google-Smtp-Source: ABdhPJwWbbznHAterTYKDXO9HEln7JYxzDLt5iKbWUyH78pxBQKVlPWB3d8mqM1sKP4I5tFTFC6Jxg==
X-Received: by 2002:ac2:4c85:: with SMTP id d5mr11456182lfl.503.1616842993422; 
 Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 27 Mar 2021 14:02:43 +0300
Message-Id: <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 03/25] clk: divider: add
 devm_clk_hw_register_divider
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
