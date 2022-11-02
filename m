Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDA617181
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621C410E546;
	Wed,  2 Nov 2022 23:13:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16C10E51A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:12 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id u2so230683ljl.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSZbtUrumgTcxUg6hHxu4JdqNGMhW+St+6BoWj9AtF4=;
 b=QWt5bE8GoKSTTe/12Fs3pjrZDO66jgMoUnihmGU+vi3vEz3SP9OP8UBz98g69t1Ft2
 xkPX9UVN3qgTPlf/KV+s/wqndJwJTa2V0ZSLFU/kGijn9finrOppSL3lM4MgEGCjPIrt
 6JesASoR9g8ECQHnweaQvHtZTS8HVDAlDh7ZIi5zT9tXqoVEWWB0qajBTypNMTTGm398
 yVLAmrfYy3kZ9+JSms+ygi95vGu/99VG4Zr0SV/9GncofTTkKabI7nqcX7OTs3yYr5HJ
 q2xYs9WRD0hjVaWgUMtOCNzC9n75MlFhFcLUsyCNATAf6j82hbwpFafcp32xpy+6Lin7
 QE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSZbtUrumgTcxUg6hHxu4JdqNGMhW+St+6BoWj9AtF4=;
 b=UTzUmxkGzbVif0yCf6bvhM7PUbR4ZfB2ZidBFrqhbDJQfonf6J67Z4HzYO4DujAszP
 kM0Yt9lUVrpeTj7IoxHyCHZEY2+iC3oqWwDLS9+lhQHP6IDpsP9J+wjczYQ+01upbotZ
 F+TQrlpg8lqsHtvZ1i0Ih8kmYR1tokUGZbbsmMM1i5ipS7tgrRriqb/DBCI7W1sR5a/v
 gwj+/z88d6ByCKO4ONO4Me1lEbJWCs1YQLH8XQ53+q+HjZ5l7WjWPV0zq13/UhR4O1Nt
 WdPQ2rB1LJ2Ad/o3wohO99V+esg+zO3AVYru1v5GAcbTij6bGZjwcTE5eBspZJHgg3Jt
 eRCg==
X-Gm-Message-State: ACrzQf0TXMGTFHWfZ74twlL+Vyq9jFbYwgGyCWSv3FkHlY0XuQhKOYqg
 fIu1nImtunXYevdrQabkK0vFdA==
X-Google-Smtp-Source: AMsMyM51xOPV6VD0ssIJh3+v+lQCDuf6J7gYV288GMSp2BNb3pLPFS1Fkom80EzbVJYExX6qGy0eow==
X-Received: by 2002:a2e:a163:0:b0:277:159b:4da2 with SMTP id
 u3-20020a2ea163000000b00277159b4da2mr10169593ljl.502.1667430791072; 
 Wed, 02 Nov 2022 16:13:11 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 02:13:01 +0300
Message-Id: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/8] drm/msm: add support for SM8450
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
  drm/msm: mdss add support for SM8450

 .../display/msm/dsi-controller-main.yaml      |   3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   2 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
 .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 15 files changed, 864 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

