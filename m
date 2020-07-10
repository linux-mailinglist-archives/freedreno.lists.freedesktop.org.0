Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0C21C053
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4236ED90;
	Fri, 10 Jul 2020 23:02:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1E6ED8A
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w17so2836238ply.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
 b=W05HtcQbPIXl89xuFzm4GPwHFSTzuwS6hsd6ixbS+qwJmURhFW+04wI+YdXhaXJdwf
 gZyBNbX0eJuS6UKNz9BnvMBF+eGM4d0cV+AzqPhAvOQ+M/XgJa0mXxXlTlscAKe2+ZEL
 ji+EXJAV1US4mTdKcZIuo2k2hlDCXBrobBLQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
 b=Oi+VDFZVtSyPraP6Pg6IWikVmha96Rev+8ejCu4jbtLZFDzCqr2wj+sJNRO/WMi74f
 xRRD8rTXUR/IcMrwteA2ofnjD2mXmOAvbQqaFYdrVqIb9dN5pPRWleooCUtyaT76MSCI
 4JP2MiNewIDfQCCH0IjZeETEuD2Vw4Tj/uIkmxZvUXSJF9S5FFesfr5/hfOhk0XTW+/C
 YNYZRmKs2BSzwu8OQfrT2uMJ5vFmDLFDpF1lQj6PZSyPsIqcq9h8UMAfESci21mUiM9L
 frvcfqX1nUkXv2cTbw85F3eDrH/zHo13NzI0YwdXObwyL/i2DuMNEtwSlMvQQwcaIXUM
 u6XQ==
X-Gm-Message-State: AOAM531P2KBCRY6fwVhXblni2cSsU3wzI39v1W6aJG+XJW/kOe45dP5I
 3yKem+gWezsUFwO+/igqe5Fv6A==
X-Google-Smtp-Source: ABdhPJwjcX9D4B+Y8sp8rehAg+DrC8K54299WPrDi2IEEU/9tpv0fAIuMD/Nv1C71frqmllXTO8cGA==
X-Received: by 2002:a17:902:6906:: with SMTP id
 j6mr18275162plk.125.1594422172084; 
 Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:21 -0700
Message-Id: <20200710160131.6.Ie343c226b3566575fcaa9e4a8732674a1ae1b513@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 6/9] arm64: dts: qcom: sdm845: Add "simple-bus"
 to our mdss node
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As described in the bindings patch, this means that our child nodes
are devices in their own right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If this patch lands before the patch ("drm/msm: Avoid manually
populating our children if "simple-bus" is there") it doesn't seem to
be the end of the world.  The first time through
add_display_components() it'll notice that the children are already
populated and it will be a no-op.  When it gets a defer it will then
depouplate them (even though it didn't populate them) and future calls
will just populate them again.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b0d8308a3e95..e52a5e95168a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3582,7 +3582,7 @@ clock_camcc: clock-controller@ad00000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sdm845-mdss", "simple-bus";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
