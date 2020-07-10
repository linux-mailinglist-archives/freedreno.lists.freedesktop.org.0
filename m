Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3B21C055
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8BA6ED91;
	Fri, 10 Jul 2020 23:02:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E029C6ED92
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:53 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id t11so3154976pfq.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Qsyzl86u0xp/Q3AsfuSrATvhmR+NH14naSidgeU2PQ=;
 b=lq+MGkGphLSf5MfibDTvyQhzb4kbnr6BuiTTOfoYVXvs6hnNVAZTeS4GzeWIxArgee
 Y/DxQGYcoFo+gk/NY0IejlYOm3y/3+wSh+PT17XFNxMNb8K+oQfFlM+FQezfd3als/7y
 0D+mf6sp9cX0TEI2MsZR5iuiPVqiJ/+S4Grxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Qsyzl86u0xp/Q3AsfuSrATvhmR+NH14naSidgeU2PQ=;
 b=lUU0idIyoNANeLSfyVBT8z68tZsqcGRD6Dg9cDq7EsRn4/5ELvdDGqp3YSW2tmuvXu
 PGk11Hq9u1I8q9pql0TWafqToEI/y5R5HfqPocYaHHJHVNyEtv+GzpWBzRy/K2CAKvDQ
 AAUFVhNIDnWfVAwzANUzwG5cWafnFrjov2cW/PCAcjdUIHSMSQB+n4PwQcY2w86opPyM
 89QmdppxL6+egdXSNYye/uM694RJdGWFCDKi7PT6FXW5uaK+X642KkcPyFdGa+PHaNWz
 II7HhvngCjFYjLrkuYqFq5HvNLQg73qRVsfFOQfThjCTyuvPmQeGMHwqCxG4WH7VoX0c
 MTbg==
X-Gm-Message-State: AOAM531a9oQfSt0HVx7kVNElhgsAarT6hc7zMfNWgciABIpAwQXBKz/q
 HCYYY0iik+oavO0mUMv6orIL7Q==
X-Google-Smtp-Source: ABdhPJysOX+rXIvX5/wYSLxirccnx0NQRBQKy0k+Iygaxavdr8HbCK/P41qasElxbHYh6Os2dg4vCg==
X-Received: by 2002:a62:5a45:: with SMTP id o66mr5243667pfb.43.1594422173149; 
 Fri, 10 Jul 2020 16:02:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:22 -0700
Message-Id: <20200710160131.7.I1605593efa85e3c9260e64fe51aedd0524544d81@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 7/9] arm64: dts: qcom: msm8916: Add "simple-bus"
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

NOTE: I have no way to test this patch, but I'm assuming it works OK?

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 67cae5f9e47e..491362fe02ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1023,7 +1023,7 @@ opp-19200000 {
 		};
 
 		mdss: mdss@1a00000 {
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 			reg = <0x1a00000 0x1000>,
 			      <0x1ac8000 0x3000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
