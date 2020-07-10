Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D821C058
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EDE6ED93;
	Fri, 10 Jul 2020 23:02:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F56ED93
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:56 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id md7so3234698pjb.1
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
 b=l5ce6hjS0xdsv66VLkfTFe9rwljnNeJ2hAUFnEXltlcciTj3GGqnNyK32o3TZO5+uL
 hQu+6PL0ibJ1s2JdZyy9/nrbrSEwM2PdoIk8FFiIaYNRhJ1pg9Q1h6xsMGYxCxgIiy7t
 r7I75GuEvSq8lGjPgTHXgmf/mqfSk79NkurBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
 b=jTZKdxEAbeCvrCkTHUCL2m8IXGnGhIXtk9XiUmJznwdzpKSdoPNECqSdzmX8IUebKi
 C22YPEZdPtgisW1S52VVteGq37k8T6HBRiGcV98J1kEyzhPsgSJI0yB3mmSjR8r2OWrm
 5/S2hQI09qoPX28lhKMO0r2g3hd28iguhnc6mRXQ8WtBq8fbCosfER+bguva2ICwrHD2
 QhXAa+RjPszU/4dYkV/m8ZXf3rmUE2Bje6NDsjQLMXdgFWNnbNbEHI+fxNuk79oj9qCi
 skdrAAOQOXpsYvBd6sV5yFavFQgtV7QEcEp4zCWKPl+UuK4sbPI2oFxuxSC/NQoaWxLw
 SMLA==
X-Gm-Message-State: AOAM533BODuVUKJkfgsWWncQdrpSG+cYBeOc7aphelmTZqdfhyT03NEd
 neWDRJ7eK5OVgsTdj8CgOK09xA==
X-Google-Smtp-Source: ABdhPJwAAHPNollF2qNbk1bn/dIvuDP118bo1zP5qg598VD2MSzTkTnoyhetCyghTdH9xKFShiITnw==
X-Received: by 2002:a17:90a:7b84:: with SMTP id
 z4mr7749468pjc.106.1594422175761; 
 Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:24 -0700
Message-Id: <20200710160131.9.I667d728b2a99b1ed50df01a3e14483fa69babf0e@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 9/9] ARM: dts: qcom: msm8974: Add "simple-bus"
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

 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb..9f84c9fd716c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1402,7 +1402,7 @@ cnoc: interconnect@fc480000 {
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 			reg = <0xfd900000 0x100>,
 			      <0xfd924000 0x1000>;
 			reg-names = "mdss_phys",
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
