Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04046196CE
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857AA10E750;
	Fri,  4 Nov 2022 13:03:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582910E750
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:30 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id h12so6226722ljg.9
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NRhMNxQi6Qu7fp/d11z2XuTmlDZU0glcg0Uw8w9zeiw=;
 b=gIRqwUn/2btJsIMZEgpZeFlv5xMX1U4dhaUglHYKk0txFpixWoSmkyWLPKpDZ4PlvD
 sLTiWKJ7aGLvIhLrZ66WNAgY9ArJ2uNEk/ER5xgpMAllw6mRA1LnjBtr2CFwQqxgb074
 jchfQplVCkBAHM9mKAHySFdKdS6FMtwVsryX/8mO7ulWSlO2xUMAj9Q11wulCaAaPxVG
 501UxBoTShudVTpPG0HfM4TZZWiM9bqjxCimjSm2GYaxXEOK1X8n+9CzNAw7udDOBe1X
 SdMEpmFm3OlLGI8Wtjwmrou+NA8W+FedAWIyJ3TZpNiP2xMNHiV5RavpK7eiGg0qrKxL
 coFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRhMNxQi6Qu7fp/d11z2XuTmlDZU0glcg0Uw8w9zeiw=;
 b=iQ9xdBvy2tRAocq/ifwH0DFYLf7Fz4ph8zX3wiRjE3ExRjjEn/vezGdZxLj4uSSb1u
 i8VoNq73Ql8wvNvcL10OSsjIIl7nzHY1ofmAA9GCLdA7LRK9jBaREgDXaF/iSTnKylMQ
 ULxDu69Xo2r0LjBipRsboIhfq6RN8k1asJpT0qfQslEEqEBYCsiCRSAVsWmsqHmHf96A
 N0bkiKp8KBZZypbezjLHq8U3mCqXvM2tOSePHyzWpA+B2PkjeXnPGB67wqJMQk6swqat
 YNa1ZweUzAJCzNKVKWZXAi2oeh/aU49Hdm9hqDSN3GcTWmyAByQOXqxVHQDDqiWN27Qm
 acJA==
X-Gm-Message-State: ACrzQf1GViw71A7oyil1eXTmJOLN8fIWjTY9zXdrT3TkoQQlm8DOVxa1
 RyhHLkQDJOqzNaF6JqOY0NJbMw==
X-Google-Smtp-Source: AMsMyM4R4JXKI6jpXn5A+LUD4pafING6a+I3Qec0AyQfuWzhYM6M6siyNZT5loXbGGdBDiJqEkpf9Q==
X-Received: by 2002:a2e:9697:0:b0:277:74dd:1fac with SMTP id
 q23-20020a2e9697000000b0027774dd1facmr717357lji.307.1667567008379; 
 Fri, 04 Nov 2022 06:03:28 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:03:16 +0300
Message-Id: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/8] drm/msm: add support for SM8450
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

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Dependencies for the DT bindings: [1].

[1] https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/

Change since v2:
- Rebased onto msm-next-lumag
- Cleaned up bindings according to Krzysztof's suggestions

Change since v1:
- Fixed the regdma pointer in sm8450_dpu_cfg
- Rebased onto pending msm-next-lumag
- Added DT bindings for corresponding devices

Dmitry Baryshkov (8):
  dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
  dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
  dt-bindings: display/msm: add support for the display on SM8450
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss: add support for SM8450

 .../display/msm/dsi-controller-main.yaml      |   3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   2 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
 .../display/msm/qcom,sm8450-mdss.yaml         | 347 ++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 128 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 15 files changed, 858 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

