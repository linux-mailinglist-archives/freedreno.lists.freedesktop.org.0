Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063EC347BF5
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AC36EC64;
	Wed, 24 Mar 2021 15:19:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3936EA3E
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:11 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u9so3032187ljd.11
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=v97pfOc4wkHEYLNV13IKhZN4dNBeU79Lu9y2VS+lBjB12QYlkvwkgu5zYE9OCOosLl
 BBGF0NeD6RdbhyA4ZSLoAWj57W6+NeHbE4i9klTOV1u2ZYpSnl3jBmmAOF2jtqH+a6B5
 7XIdCG37smDlqai4oAnutXmDnP5F7+xNN1t4Sqoqg61BMea2j9G+33R/V97EjyytAm4+
 WTllpBHpiT/zceAldkY5KNC2sx6XJyJl8imGEpWR1Z84pSSwo4FJ3yJuGHsIjmd3RK+q
 hzrGdGq9n6RD9MQJKAZrDguHacli8bMQQd2tDY7UX62AbZbhdwV36Cdus3DI7C4D7ZXR
 +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=Mqypw5g1T22aBFZMvvVg29kfAooBHVyfY5JcRHrPVwasaS+QOXOQG2fIIcM3ef8YAk
 85qCTxvA5tnFw6lnLH2dw3SXfkxpPzNx8N0EFS+IKk93IGjmAA0rgtJK2r2YwMg/fQhU
 5K/TzCyyUiyDIPSs0kTJjbzjop8oLLIlVWlDcamOQ8P7AaibZ6pWtBdgUhgR08jrveN6
 glxFtK9cEoubf58VdyN6aO3zQzFVS89bw7YNf521YplyYIyyKqPOx6IHqQM6whuL9lKm
 W1OZtx2qtIqupK1QBGd+rpyX+us1o/s5xuyUiJ9cu1r/Ii7bytOOXlHVNIbZ3anDXC9v
 0yng==
X-Gm-Message-State: AOAM531DeSgjF0tYkx/vUh+Lz2F3QZSm5yHWKdTs/4kJ76FABtKnNxIS
 AfZoag5Lf9mNM1x9JV1Vxgam6A==
X-Google-Smtp-Source: ABdhPJy7sQnjixlxXt2dxgPhyoBWzHKFhcfufQc5+XNuAJ+ErdVXS3tnmZXpUAcNqIG+KRIjkGVLgQ==
X-Received: by 2002:a2e:7301:: with SMTP id o1mr2429148ljc.42.1616599150228;
 Wed, 24 Mar 2021 08:19:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 24 Mar 2021 18:18:21 +0300
Message-Id: <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 03/28] clk: divider: add
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
