Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A45661B8E
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 01:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F1210E229;
	Mon,  9 Jan 2023 00:38:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D7010E22C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 00:38:22 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bp15so10612632lfb.13
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
 b=WSTVYuuPoAuJOGdQph3kfnYWipMLSmMWNS+WYmdpTUOEmn5pPUhh9nNcnS1efEkdE/
 x8F627H5jfYqXPCkawGZLPAr5M71OhOgkdgCsGdVBO2fgcn8r+lPFWf7fK7L4bwXF6p6
 Zezq1PKUClYDM8U4p+e+oFBGOKeBeWvi+5ehYI3WCb+Flvnk0slu3TzjKN7L0Z59/wmt
 sIziQuIlHA9i2G0zAuuRo/e+zf7pWa6ObRjCNDbR493i4NPSe3Wu3nlqttWx7empA1Xs
 dkBcEfdQZDn0Btnywe+ZXPmgGkLPahBihbLYdY2SJ5leJmagJzcUVfvk9k+ac7UZh6Rn
 JIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGJEz+3MmaHxEXAiV7clxhuQeLLp5nReizyyEldJfbY=;
 b=LrxF6qR/Zp1j1yGn2pXQJEJ7T4fWkq8INxRBcKDUGg7lOP0ZKjoUUqfTIMLNrmVvo/
 U7hw8Bz4O1bsLqtQNtG57lzSa7vI+DfC07hDOnQ3DqNJTqjq68yHFaN8tnKLEPuGKc2W
 y4mC106A8zq3qFa/WXKX5NDFBSrUFrSyPENaez+DH4lK+o5r2/CRLa990E4iQcgEGPCB
 Z3kmJzXsEb5Znq57MDR9h5evsHv1jv/Xi0Slv8wtl0Mny8QP5axAGT0qC2XpEAazMZxO
 qC8YP3o92LPX7qCmBhGacs+txzzwes3LwZOgXmHF7aN1pOWosGmbwW9JGlvKeI81pxKL
 +8Ew==
X-Gm-Message-State: AFqh2koAqX3jbSnviuDfS0VJJawsKvAJhglgvfcUM1KXdEdC4G5VKSHt
 WP71/PYnxE0/KyJ40l6I2Fw78A==
X-Google-Smtp-Source: AMrXdXvlxb4EFZ072+msFp0BZ4dz+pfleCfeN6prAx0jUGEHgXIzupqxHMlHuRAsBi9MgmaVLWbBNg==
X-Received: by 2002:a05:6512:131d:b0:4cb:c3:9363 with SMTP id
 x29-20020a056512131d00b004cb00c39363mr17078413lfu.11.1673224701119; 
 Sun, 08 Jan 2023 16:38:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:38:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  9 Jan 2023 02:38:15 +0200
Message-Id: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/4]
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

Changes since v2:
- Fix MSM8998 compatible list: "qcom,msm8998-dpu", "msm,mdp5" to allow
  handling this device by either of the drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.

Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 154 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 160 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

