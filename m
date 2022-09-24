Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB05E8B07
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E9410E55D;
	Sat, 24 Sep 2022 09:43:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4146410E5B7
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:43:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w8so3682761lft.12
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=guecmyRIRRz2AXWadVLwOMYEwJax3FS9elbcAnyJFGs=;
 b=ShrZcbOcEr4oy3XOUsaUT8tLdzEoQ9DZOHKcv0og1a4hbgpfPg3szGEJ2fns8vGePI
 5HolOuuvjarT38gF7pYPXn+QEX8XnqCKmmsSCEDj7/vs70OE5mTB7NOFfwOgBBL2+Gfv
 3HGExhq8OvvGD6XH8PbIXmA9oqQz27O9o4elh7mZ8tg+NjwocsU6U4gIT6JkFMRCVsKs
 wHyOljBz/3umuyjZDhRxvLRM3Spq4Mqxh4HRZVmTR1kAftv9Vw+AovL4jhps8RQEtc2m
 ZZu+nXJLI0euvN3zvlv9Gc/gXUq3zGfzyIqKKeexx9mEn8ZnVLQ8vP/V6CSn8p+D0u9H
 quLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=guecmyRIRRz2AXWadVLwOMYEwJax3FS9elbcAnyJFGs=;
 b=q0bq71Q3q4W9u/FkE4TOYl2WLbt2dMoYsC6YjRPg7ClxgKnwnLoCXOAgzzi0lGPdlh
 p4xKmLFWRbNVf1mBNHQn9K3hfL/EUuAbgfOBoOzL9LcqecOkICXm++l4DDh4ubgbKWZ6
 N2diO+QKNfUfv2nBqX8+QmxMASqJdrZjogM4klc0EWZ9FsdJpTnF7EqegIlLbrdCcWom
 b4ELYxPhDkgSKnwzr30MenxsKJIWScq9Btl75kQMghNnYkCOMHKYfk7V7+bUiSXCz6JL
 r8URRQo1Z6Gd1kkNe9VIrR/Gd/37YR2gxznfa0O10RYoG3SDh6HuhmGwYIkpYKFQlZxW
 P3cg==
X-Gm-Message-State: ACrzQf1LBvxPp1lcwL9twxFJSnp57rLt7L1VBRAsoKjuJYdgIf2+HNjt
 1VF850vBG/fim549U9044Oyryg==
X-Google-Smtp-Source: AMsMyM5ZmT4tx4z30xIzBpRGlclQSCUra8mRCpWgxqdBdL/38aqlqC5ixrwsatwiyZQzLn/4fj6eFw==
X-Received: by 2002:a05:6512:2803:b0:49f:979c:cc53 with SMTP id
 cf3-20020a056512280300b0049f979ccc53mr5037103lfb.76.1664012628627; 
 Sat, 24 Sep 2022 02:43:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056512078d00b00496693860dcsm1833347lfr.232.2022.09.24.02.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:43:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:43:45 +0300
Message-Id: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] arm: dts: qcom: rename HDMI PHY nodes
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Historically HDMI PHY device tree nodes used the hdmi-phy@ names.
Replace them with generic phy@ names.

While there is no such requirement in the DT schema, it's worth doing
that because:

1) The recent qcom DT files already use just phy@ for most of PHY nodes

2) The recommended list from devicetree specs mentions
usb-phy/ethernet-phy, but not <anything>-phy, so I'd think that those
two are mostly for backwards compatibility.

3) I liked the example of sc7280 which switched all MDSS PHYs to just
phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

Dmitry Baryshkov (2):
  ARM: dts: qcom-apq8064: change HDMI PHY node name to generic one
  arm64: dts: qcom: msm8996: change HDMI PHY node name to generic one

 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.35.1

