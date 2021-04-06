Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12A355F39
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 01:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B232B6E8CF;
	Tue,  6 Apr 2021 23:06:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649F56E029
 for <freedreno@lists.freedesktop.org>; Tue,  6 Apr 2021 23:06:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f16so18399631ljm.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 Apr 2021 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
 b=TpblUsbtD5po/N9CH/uKdwv0vEB3mnX65H7KPdYRddC7mVJFSjpYcspElVN2O/5zzv
 2NpmbX9x1UTxC/AiZlaBMKn4eS9jCVyuZQ/exmSW+stHaDAlpm6HzEuLtv+YbAGyjeua
 V4S8RLiqJk+mcEOvLgVUqhmmcWK2LLUItP/tmnl5KhP45rkzszvaaqhxln/vB2NErNSF
 whPy8AlWU59tdX6njnk0uAnKlCsN7wG36UGU6SFGzJ3mGEaoee9u6DAarPFvGZCBgvJN
 qqevv4fjV00ioLnCri+pzlI9ZIilUwxBMtOxAcgry/cd3REqfT8EOVLrcqTJqQiyak+f
 oa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPWXCRyQycYQvj6HYAPrgu+5Z9a57EfhLN3d1yHm7Ps=;
 b=Sw/uL6G52eRR+0FDh29OFucN0JThSJzR9qfH1DROdDvFA1oGY27mgTJhBGAOeWcaYL
 AoL8CnPjinSHSV4cb8X4mOC9twFHdPeIm07RPeWhNt5S2phHbJAZWnTkcP7gIQf8c4bj
 jkgvvwSfBXoMHmekJgLIwzKhEdtV/7GlpGfL2FjKTrGSXU8v34jkz/5oijhS2dvQ8ioQ
 CxC59U1xJeP7uXX9oJZp/nJHaxlU2OmAeCE8eYR/jg44QNttMyKyQyscLsH1EhI6UlwH
 NdYBSGbrLbnN76h4MjLmgVlxQZC7c+vf4H+J1viJOb2VT6KpPZdSuzZ+fb6U1BHlmnKI
 9IRQ==
X-Gm-Message-State: AOAM530YBdjllIkDeWQSr657eJs3DiqN3Khat9fdB+l8klDxtcqmTvRU
 qdxXW/Y3HUItbVZnEJG425wpUbzwzi/v5g==
X-Google-Smtp-Source: ABdhPJxc5AF4qmysF86wYNJ0vHcgPANetDoaI2kJ39Ne3VwoDSAJxdpOVbZhfFJ5YUI9Ez56qmMVXA==
X-Received: by 2002:a05:651c:ca:: with SMTP id 10mr240945ljr.63.1617750367763; 
 Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b25sm2351498ljo.80.2021.04.06.16.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:06:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed,  7 Apr 2021 02:06:06 +0300
Message-Id: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

devm_clk_hw_register_fixed_factor_release(), the release function for
the devm_clk_hw_register_fixed_factor(), calls
clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
after that the devres functions will also kfree the allocated data,
resulting in double free/memory corruption. Just call
clk_hw_unregister() instead, leaving kfree() to devres code.

Reported-by: Rob Clark <robdclark@chromium.org>
Cc: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Stephen, this fix affects the DSI PHY rework. Do we have a chance of
getting it into 5.12, otherwise there will be a cross-dependency between
msm-next and clk-next.

---
 drivers/clk/clk-fixed-factor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4f7bf3929d6d..390c16f321a6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -66,7 +66,12 @@ EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
 static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
 {
-	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+	/*
+	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&((struct clk_fixed_factor *)res)->hw);
 }
 
 static struct clk_hw *
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
