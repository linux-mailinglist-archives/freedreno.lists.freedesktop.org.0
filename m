Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01FE21C057
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325FC6ED94;
	Fri, 10 Jul 2020 23:02:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AEC6ED93
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:55 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w17so2836279ply.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bGZQukgdvxpeO9P4CSAAgyZ7LH76RJIkGY9IX/WOgs=;
 b=BcS8K872KzDafnCAvS8hTMh2QRHiwdT9K3jScaFOUPgJFjZ13VQBHt7Y2Uk6bycC3s
 gFubY3kH6dpBie7TZ00tvqwBf2YvJK8IXh9opftUX+2Lcxu5HoLJMLtS5LHH1U4GHzV8
 WUOgdIZLvuu9ghtGat46xqbYhTXSeOVqFMp/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bGZQukgdvxpeO9P4CSAAgyZ7LH76RJIkGY9IX/WOgs=;
 b=AKoRB45TQ9+PSd/Abo4qaTSRBONwpD0q0A6Vo6IKVhQGtDAM12Ai+dw23XCwgRZe1M
 LGKDQPg7/qt1fmOX90faGL7uS8Wk1CF5wfAVaqKDX9MeGERWHzrya1JJstVWIyGdyxgv
 QKn0tbeyx4eYJoZ+QBjCRe07pSJkOtF0qlqwrSObcx1mqVYnDF1gpi+ZtzjBuYpZEPhe
 RTqDm9JdR5npjLTW7KzgS/SKxrtp5+aXEx0bL2kDjojk2MIRNDXI18PxVH8LADCvfgTU
 BGjtRjydqoziJmxKbeDKXsn1OwXeKU4T38VlMiEqp58YLv1338y1CY/KfpaDOR52juR1
 dpEg==
X-Gm-Message-State: AOAM532+RGtecbKiNAGvkfx7MPIRwc29930d2sddCYxbEu0AR1BGqHcF
 oGDYe+QXoi9VzHkUedTt8OzQYw==
X-Google-Smtp-Source: ABdhPJzVWK4kKHNQXZpw08rHhXfVuWKYJIflqz8a/l8lIEhQwXnMNLvfwBAieMzQP16Ze01ezXBUxQ==
X-Received: by 2002:a17:90a:2681:: with SMTP id
 m1mr7431338pje.204.1594422174680; 
 Fri, 10 Jul 2020 16:02:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:23 -0700
Message-Id: <20200710160131.8.I7a02e4b37149190227bc03fd1027c8241d8d4f4a@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 8/9] arm64: dts: qcom: msm8996: Add "simple-bus"
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

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286db775..e303b0e644ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -499,7 +499,7 @@ mmcc: clock-controller@8c0000 {
 		};
 
 		mdss: mdss@900000 {
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 
 			reg = <0x00900000 0x1000>,
 			      <0x009b0000 0x1040>,
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
