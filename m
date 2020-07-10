Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41D21C051
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059A6ED8F;
	Fri, 10 Jul 2020 23:02:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F446ED88
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:51 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id b92so3225682pjc.4
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5w7thCJ47LiXz+1HKLTnKORVAb6dWtKvGhWSiH+CyA=;
 b=czcZnmWK3uUzXU3jJUftlmd87xKqg1vh36GGnjurujBnUEgeXlC1M6Wca16FDUQn+1
 yZj82s/zD8peaRgTCevChpsENm2MclhtbVlqV1ldKm3+JpWTwS2UBaCObUuYsJAEdxXc
 onrMx7dOMRZrpJlLHafrJXEdUPVfZeTEt2K9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5w7thCJ47LiXz+1HKLTnKORVAb6dWtKvGhWSiH+CyA=;
 b=h+r8YrahOVPMgG34pGctJl9dKTrCLJF1OPcl+wPC1DiL0gnkJH1jljsfGkFAmJQoGH
 M75XIZ6qBqpv6na/AdGdKEJGaxTjt6n/bERSf0rq8ZzgmMBQzWqy4jRqsXiMwaoonCYG
 UzyYBMiIzitMH7Wp3G5rKKsjhcFIWOblBbrEM5jexL6tgWFFk/uSIUafQshR1/TiMclX
 dZbcGMKf9KcO/mG8adxRxBGN5t/TxrmlOIat0Y/sDbcbfbCIH68Z5Mx5nB6srKy2MZ7J
 fx5k88lieaWBizY95mpRKaDy2+tLTHBx3F0u9VpPb3ElLFnEylm/RBXm+7l4v7n5F44W
 IQ7w==
X-Gm-Message-State: AOAM533QF4R4NSCLS+6W4RzGD/wjLeI6zR7Td4YI5hAhAlZIEosTQTfM
 oStqADdfLEglnNAbhPXha4Kjow==
X-Google-Smtp-Source: ABdhPJzLC+zTXfa46e2kfj0dmtwYoXm+w+JRkwViDCVwoTfSIS5JSFTH2m0RSp/FhlQFUwXtRHO+CA==
X-Received: by 2002:a17:902:9a4b:: with SMTP id
 x11mr54096770plv.150.1594422171008; 
 Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:20 -0700
Message-Id: <20200710160131.5.I27644b643854c6deaae89c750041a5b69985b9d0@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/9] arm64: dts: qcom: sc7180: Add "simple-bus"
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

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2be81a2a1512..cae6c69fd85a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2594,7 +2594,7 @@ camnoc_virt: interconnect@ac00000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sc7180-mdss";
+			compatible = "qcom,sc7180-mdss", "simple-bus";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
