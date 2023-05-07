Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE856F9B7B
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 22:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323410E2E9;
	Sun,  7 May 2023 20:28:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8141F10E07C
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 20:28:44 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac7707e34fso44260391fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683491323; x=1686083323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFULAHottHyIiJ/qnKwuTIZZXUlarclQ80PbJxT8P6o=;
 b=I/dtP5NmpVn4Z5lspvVGMjytuzEpdN/5Rb4zQXK89Or4lkX4McpPn7VtRMLwRLsLLA
 rZQGikf62hvxPxpNWi3e/oP8aroAbal7h26OOTq4u48NgfQiMzd1V/cNoszb7qjqINhV
 Er7sZ42DKyE28rv7oO5QmT7SkMlnATvb/Py6zcMTncQ6d/jpqyDRSL+zxbzJieCTlG5N
 LhTVokUrsXKpQkFsCCVWnTXljz6+Xtks+jey4mGKWKyP7zepeX59xH+7QsWPyahTQ6dm
 c1/qSG3AfayxWgaNbvGooY+ZTY5yoOKqL8TzSwgsCYKRRjHWDJFGG0l5He9tVqIc/DBX
 +4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683491323; x=1686083323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFULAHottHyIiJ/qnKwuTIZZXUlarclQ80PbJxT8P6o=;
 b=YLjE9w2yaYMxGvgdIsI92Og+kZZzDWH9GjTEZ9mPBYm7ILD2ziRCWRlcyQKiBhmFVY
 Zx4kOcx5/LN6nX/9UvwyDUOLgvPtvXb40cfH4q3y+8u46Jt4FMr0Om1SXc23+RO5e4iv
 0oxR07RL6C+LrynlciT7n8pUGZR+H04xVAQR5GJXyuqZ4lGPO6R6LHpBC20VLC5BORzQ
 61VazPlr1hDFWltLj8HiC2Q667dyqpyJc8q2bPBjiT95Ooe01pyDz5XtQAPAtgsUOrFV
 p6mzI4Dl131dVV/7zxdlbWla+oLpKOvlV6SDK5Qy7q6I+A+wLHhNogXDWL8gkrl8jpn2
 o2Og==
X-Gm-Message-State: AC+VfDwUHIJ385KJWDpKPuQB34x9Czz9z/cm1yVsmkZEh5+nm7IqxFJQ
 xboyzJMA2e9ODdLw0SdhGkMdvw==
X-Google-Smtp-Source: ACHHUZ4Jv+wTxeXCPJjjYK0WrVRacQaoSLrjJFlnb00KVGhyYWlOa2vtQspehH+mxvxa3opWFN5C3Q==
X-Received: by 2002:a2e:9f4f:0:b0:2ac:767c:ae14 with SMTP id
 v15-20020a2e9f4f000000b002ac767cae14mr2370588ljk.19.1683491322710; 
 Sun, 07 May 2023 13:28:42 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:28:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  7 May 2023 23:28:38 +0300
Message-Id: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 0/3] drm/msm: add support for HDMI on
 msm8974
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series adds support for the HDMI output on the msm8974 platform. It
was tested on the apq8074 dragonboard device.

I'm sending this as an RFC for two reasons:
- The series depends on the other patchset ([1]), which got no feedback
  yet.
- I'm looking at refactoring the HDMI PHY support. I tink it makes
  little sense to land the PHY driver when we know that it is going to
  be reworked during the same development cycle.

[1] https://patchwork.freedesktop.org/series/117431/

Brian Masney (1):
  drm/msm/hdmi: add msm8974 PLL support

Dmitry Baryshkov (2):
  ARM: dts: qcom: msm8974: add support for the HDMI output
  ARM: dts: qcom: apq8074-dragonboard: enable HDMI output

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  30 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  90 ++-
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h               |   6 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c      | 689 ++++++++++++++++++
 6 files changed, 818 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c

-- 
2.39.2

