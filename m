Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9554C50EAF7
	for <lists+freedreno@lfdr.de>; Mon, 25 Apr 2022 23:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AF710E0E9;
	Mon, 25 Apr 2022 21:07:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD0D10E1AA
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 21:07:11 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so550518pjf.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho4lFHBriP83EBuh7im6oUALrBEwYKd1HOs+QqrsoEY=;
 b=akQVBkH/VtMlmKfIuInlT+qJDziMVsZPpZ+hQ5uV3NeVNRFOVaH7CY1xTOQH14tJuw
 9+tODS+z8YOYzTHVdwEEGgsej/Zlk7M/54/cctu2l86RumWCo+GvIQ1ryP6QoC8Fzvx0
 WV/ceo4PnlqfPWY3LRXcb3JxC7fsxQyjQwzzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ho4lFHBriP83EBuh7im6oUALrBEwYKd1HOs+QqrsoEY=;
 b=l31wovc7ouB0g3VxvAT+5OwY3UDAFRKGxFl8KyXQXXkJ7YAWTxR7zf1vhxeAlJjLhJ
 Zg/4qmipvhzafzlYib1k8gEPXG3UVFzeqboNS1PCk/jzAZi3hwpTVQ2s8moQ3f1I8b5S
 UMskC2kNuquiFbCLNonBM0SAUQpDTNvxEy2WleFL60h72/+jvtzWJ6+By54wfDVwZIrc
 kWigm9SQGYo2Jfjr8ep7FyHvZ/4ugGMBc+ps8mIKzuvcTP9QYis9ZytDY/z861LFYf/B
 Yo0km/uf10lWq/3N9uAQ5egcFZBkSdgLvZlO3NwivZreM6yIfuOFE7zWZuBP7hjC9CfX
 VxTQ==
X-Gm-Message-State: AOAM533QMdoQcUJZIj12w7+/GL0IyrpyTJQPDOSEwPbKjQMfHwft00Qv
 NA+lHbuZT7/8jpe8eqNqCeEgyw==
X-Google-Smtp-Source: ABdhPJz9TipniGjuLfdSJHo77yegNcYEj0amTSj6sKn2dZa2BF4vcvsJfC2yD92BSkXEdeOLzSPIxA==
X-Received: by 2002:a17:903:181:b0:15c:9035:2b18 with SMTP id
 z1-20020a170903018100b0015c90352b18mr16668520plg.8.1650920831241; 
 Mon, 25 Apr 2022 14:07:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:b820:7f63:f3dd:3da])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a62a114000000b0050d231e08ffsm8523202pff.37.2022.04.25.14.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:07:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Date: Mon, 25 Apr 2022 14:06:41 -0700
Message-Id: <20220425210643.2420919-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] dt-bindings: List supplies needed for
 sc7280 eDP
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While looking through dts changes for sc7280 eDP I found that none of
the regulators that were being defined were listed in the
bindings. That being said, the current Linux drivers _were_ looking
for regulators. This series tries to document the reality to the best
of my ability.

If someone from Qualcomm has better documentation than I do and wants
to correct anything here then I'd be more than happy. For the PHY
patch especially I don't have a great way to map what I see in
datasheets / schematics to figure out which is the supply for the
"phy" and the "pll".

Assuming these look OK, I'd expect the PHY patch to land through the
PHY tree and the display patch to land through msm-next. I can split
the series up if need be--the two patches are just in one series
because they have a similar topic--there are no actual dependencies
here.


Douglas Anderson (2):
  dt-bindings: msm/dp: List supplies in the bindings
  dt-bindings: phy: List supplies for qcom,edp-phy

 .../devicetree/bindings/display/msm/dp-controller.yaml      | 6 ++++++
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

