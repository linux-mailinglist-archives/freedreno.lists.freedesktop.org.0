Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF533F31B
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 15:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53F76E5A2;
	Wed, 17 Mar 2021 14:40:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B46E5CA
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p21so3300965lfu.11
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=Jme4PgXEb5C26U3C0VZay05pzwR2f++881i12NWP9OmLS+yrpY+dGp+2SpnP/iYbiq
 WqL0tw3A38pYCKyhK7bRQLU/XXUtlz+gmQ4jxzec2xfTXIpXTPueAKMOjx8+SxqN9RrU
 KKhUJ44KvLwyytMJd9/j6Nq2xns2ECjn+WtQ9uoviLd0TsDRY1vbfMEnniuO8mOQ7XIf
 G5cwe27Rgq/1Z/cjdWdIWIFjUmtDkzUAKZGvD+b72Ggp/YuDhDAYW3qlKNCwFJGnPqNV
 fPWhf5kZRHi/O7pgB/WTfSdNWkh5/3jacaOMxqsqZHrTOVeyXKkqWTuTHxLO9Skf4f1z
 JrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBXzeZeDyvQyLPoNa1KGeI/poAISjCxdb5q3SKcFJsU=;
 b=pRbdrhPAXNFymfei2m/q9IlWLNU12YoJAy7GupzD16OMoLkp8axkr1bE/XTJJNrhN2
 RF/s/bY8rVBBHvpfNthLDlM0mupmPxNhkFIKo/c1M/TjZCTfAd62iuKB6zLGTS6GnWZM
 UGbFK/+6uRhK1A4/IqGhlfypZ+SMLjcM7Vs8u51DQ+518dlCBhvfuQyxxkaP9DwskvF4
 td2IPJl3SyF67GMM/T5B/Q2qTPr0a/n/GPAdht3cGnzlZyIRXIpkoYUAIgYbX6YaEs4d
 Fup56QtlaoQH44NJrPz48P9zBDqMsrAaikv88/PqkfQ6vegmXhY0XgCkn0eH62DlioYz
 EKxg==
X-Gm-Message-State: AOAM533Nv7+MnjJ29QHM3Iz7Nx59yp9SaCBMJ3hv4/A+Q53WjopI6pXu
 z+Tp6sQvBQIHGmlb92917T5CLw==
X-Google-Smtp-Source: ABdhPJy+ESHie2qqCcI7ASd44IVF06jPayvgNlXGLpeNNO7XiJ6dZX5kUUMb4jBIDhs8YOxjhW633g==
X-Received: by 2002:a05:6512:328f:: with SMTP id
 p15mr2543462lfe.628.1615992043074; 
 Wed, 17 Mar 2021 07:40:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 17 Mar 2021 17:40:15 +0300
Message-Id: <20210317144039.556409-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 02/26] clk: divider: add
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
