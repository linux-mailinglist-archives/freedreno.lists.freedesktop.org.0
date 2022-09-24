Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D657C5E8A48
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 10:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C9F10E54A;
	Sat, 24 Sep 2022 08:51:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B6D10E54E
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 08:51:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b6so2355782ljr.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=iDwEuv4T7rJzq7WHYdQWqX7LJJaB6y35xV9LrRnMHBQ=;
 b=P0ZcwQPNEHGCa/kFG1k7Rtk8ll1dAN19sfN9ZHbSTKBeer3HKfXILiiPZKzRGtVmwv
 ghqtRljRETPEN+SO/3csMofmRmNB9FjIRDJH5rXnFcrDm8rkWnK8V20fCbr6rcLhhrFI
 hYRW/US4zZ/uWujGsi+lK8wQYkcqr5Xt22GBXWJhNUH9h/86r2fhuq/pE/g2n0j7o6U6
 tWMSceDiyT2Dk/0or8JZZrCTVitEcxYQhKqLKmC1NipXIBZmDOYhuIHoarqCKiaaqF+j
 H8Xc2HdkwIB1BXCadmv8xMcj3FNFBfsF+EZdWln+1Uvls63+4we6qo9thUDHE0YcILKO
 haOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=iDwEuv4T7rJzq7WHYdQWqX7LJJaB6y35xV9LrRnMHBQ=;
 b=1NooelyecP3Kxgi2V0xG5GmWssZrNJ8Irl83xILrYxkkS/buM/IxCHyenCFZh58rqH
 VuC1sRKwcscRxJ3DbyNONDoDRr3dyvYLEbtQsiilxcq3JmSaZwnLdLjLk1wzxUjTe/ht
 cHG5fX6u5yLc6FiKAboSR/rgSm+GaS+dH96abxkh34DnNE9wVGUG2PuaginPxEmb/Asz
 Pk3w8QdyyC2kLMU5JNpLAkoKcsyrsKtH7NyKCSX7XRDqXiGShcJP0UF8NJwRpk3cAZQz
 9FOcWsMGpJYWbBqXUYsN2/sd8mP4OA9lTfaX1TJXc53r8hL2YMdyYVqgyXxhHcFjknve
 o3kw==
X-Gm-Message-State: ACrzQf21RcRv/wNIy3TtT6EvRX2qMcKcQgCGsCGw4NYHyg8XPWf2puQE
 /KlKCVwDDhavL23mDIT9pzS28Q==
X-Google-Smtp-Source: AMsMyM63Ts07oQdImLmzAELIpuUd98DDUPvv+GpcuZkiZ0YCMuydQmUx2b0h1SC//8tmWgokHgrcTA==
X-Received: by 2002:a2e:a795:0:b0:26c:51d9:e491 with SMTP id
 c21-20020a2ea795000000b0026c51d9e491mr4325044ljf.327.1664009490210; 
 Sat, 24 Sep 2022 01:51:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 129-20020a2e0987000000b0026acfbbcb7esm1717607ljj.12.2022.09.24.01.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 01:51:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 11:51:27 +0300
Message-Id: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/msm/dsi: Add support for DSI PHY on
 QCM2290
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The QCM2290 platform uses 14nm DSI PHY. As the configuration is not
fully compatible with the main qcom,dsi-phy-14nm, a separate compatible
is added.

V1 was not sent to freedreno@, so it nearly got missed by me.

Changes since v1:
 - Rebased on top of msm-next, fixed DSI PHY config to follow upstream
   changes.
 - Changed compatible to follow agreed scheme
   ('qcom,qcm2290-dsi-phy-14nm').
 - Updated commit messages.

Loic Poulain (2):
  dt-bindings: display/msm: Add QCM2290 DSI phy
  drm/msm/dsi: Add phy configuration for QCM2290

 .../bindings/display/msm/dsi-phy-14nm.yaml      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 17 +++++++++++++++++
 4 files changed, 21 insertions(+)

-- 
2.35.1

