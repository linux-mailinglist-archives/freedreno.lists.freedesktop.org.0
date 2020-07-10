Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAE21C04C
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 01:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71116ED80;
	Fri, 10 Jul 2020 23:02:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5DD6ED75
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:47 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 72so2857106ple.0
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
 b=k8zU2rjLwwu9xxH6CtqzfzziVe1vGy1bbnfaYS4aV6d8OBtTZkbwlSOJJvvmPXJbSR
 e+lH31NsyffijpPqmezQuKlLqrpVO65l/rRqLmPGfkCVwXEwRCH5bYRYw15DCh6yEcR+
 41eQMVmiDyHYBBVuEs5cYvgWCaYuLUL9AnpjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOEifiIh+gw1ksCpw3+MdPsiCbOdQ0cDfgdVRKb9Csc=;
 b=oiz5rbs81ojiRHL6Sdw8rRqIZDASKHxQVvh5RhU5an1dj7e2qOC0kvv6WqE6eJUXla
 w0scCd03LrbBzjq/Fxn9HI6D4Hbmvt858M4f5UInrrsgpIND5m/OJ4x3ExgchPcD1AK0
 PZG38ACFU7qoS29+F46KJGTNUEVNa4YE9IYM6QWRz5mnd06ImsR4KKWY+N/JEhZfdEfl
 nkdDx/NQD8bBKJ8eZvC0xjCUVwHUqZsPsvay8kRh7ox3aaW/FLYupLKkPfyRd8MFePx3
 ao5lONxLUnEg9x/GEJko/2vFca6iwupaG5BJMWu0senG0qUJkeOpJT0Yg7JKCyUW/zae
 F8zg==
X-Gm-Message-State: AOAM531aQ4tIfqGdijenKJYMMyuWOM0r7wfEfuCTAC7xbbDTlIk3txn9
 pkvJdHZBnZRbNVXGmXq8JQdVfA==
X-Google-Smtp-Source: ABdhPJzdSjyDJg2gb4e4NI73Cop7js70UClKGQIJKPQF33PAmLwF3oSqZOi78uGWEWIaJ81gbrnxfg==
X-Received: by 2002:a17:90a:cc:: with SMTP id v12mr7439843pjd.96.1594422167234; 
 Fri, 10 Jul 2020 16:02:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 10 Jul 2020 16:02:17 -0700
Message-Id: <20200710160131.2.Id4b5c92d28b7350d047218774afaf69b683651e0@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/9] dt-bindings: msm/dpu: Add simple-bus to dpu
 bindings
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We have a whole bunch of child devices that we really just want
treated as other devices to instantiate.  Add the "simple-bus"
property for this.

Commit-notes
This bindings file really needs to move over to yaml.  Hopefully
someone at Qualcomm who's working on display code can help with that.

Right now on Linux we have a manual call to of_platform_populate() to
populate our children.  That's pretty non-ideal as described in
another patch in this series and I'm trying to remove it.

I'm not sure how much of a hack to consider "simple-bus".  I've seen
it used like this before, but if folks tell me that it's terrible then
I guess we'll have to figure some other way out of our crazy
-EPROBE_DEFER loop in Linux.
END

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..b88269524365 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,9 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  One of:
+  - "qcom,sdm845-mdss", "simple-bus"
+  - "qcom,sc7180-mdss", "simple-bus"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
