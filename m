Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7E66911A
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FDB10E9B0;
	Fri, 13 Jan 2023 08:37:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8EA10E9AE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y25so32090294lfa.9
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=89Zd6mgRw6i6pS7UmAmLfKTihhoi7hZ3v4ZY4evNfNU=;
 b=Md/c6o4xFP/rPyTe1JxNVDFfvvxKjrHwRmQThWtvoxAemn7Qw8PDih/X4Ij3SBmKTQ
 oOorr2DP3DubEBXYQL/WtT7gBPCMt27Ux5W7KJ7ebUV+ZjMJjrPxLqsvRexkwvYM5qHR
 Qjk+RbtTNyBgHucoN3BkReQ3KFIV7dbIgSJq+bn68jku+e5rcHuFPCkbPkNSou5OEMBT
 NnlUBaudHvINOiesk1gOQmJrNcarT8ZYvUxASFNNrW7SQU/4PaJYx4uh0fkrMk1I+5Zo
 ToBm8065LUIaLfVossiVto5Ljal1qU9nYZb0LhK0pqAgV+FYb5PT6uRRZnQ8/dGNZnke
 qFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=89Zd6mgRw6i6pS7UmAmLfKTihhoi7hZ3v4ZY4evNfNU=;
 b=mcBjA+SnW5x8asCdCJeGAvp6VUBmFJfvTNpiVKDbkBp1ilCKVG2Kt5FB9XnOqEDnO+
 vWzlJQmT3V0K5wVnKvUQiq/hy0pT4bMmyrCAirqXo8DGP2Zj+3BGPU53k8auJS1vQgrx
 De0Z8bJPgiUoaOZ9x+LTfQ3wDTtxebte+M6rZ2ea2AAkre4O8csAEI1jS2nReXiv71Sw
 YAtjUFjS6uJQx2dBEUAYglrp+SOLIL9nI56J8cz2Lb6KWETdYRnKOdUxvt/EFdxLGNVb
 EURKtO/r3lKIVthqoW31jYXWTb4eTsTzBCwm+OYKsrk+6TmiX5ZZDNriVAwu/UfOGl5c
 d16A==
X-Gm-Message-State: AFqh2kqWUWB6k/BssfPcTWIWfiIYoTYdzEQhhy5epV/r5om/eVdHzW19
 AJZ9lBNqIGaeWSRWAIVMX+EgFA==
X-Google-Smtp-Source: AMrXdXsKRL8Wgn2I3YnZYNfAI4H1YVtupP4j3ohwao7d05G23ww7r7+efpyZW+XbzlG5m+TiV3Av2A==
X-Received: by 2002:a05:6512:40f:b0:4ce:e95c:f2ff with SMTP id
 u15-20020a056512040f00b004cee95cf2ffmr790411lfk.18.1673599042611; 
 Fri, 13 Jan 2023 00:37:22 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:09 +0200
Message-Id: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 00/11] dt-bindings: display/msm: rework MDP5
 and MDSS schema
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

Krzysztof asked me to merge all pending MDSS/MDP5/DPU patches to a
single series to ease review and to let one to see the whole picture.

This combines three series: MDP5 schema conversion, mdss/mdp renaming
and addition of the "core" clock to the MDSS device node.

Changes since v5:
- Merged in the mdss/mdp node renaming and core clock series
- Fixed the formatting of descriptions in qcom,mdp5 schema.

Changes since v4:
- Adjust qcom,mdss.yaml to follow the addition of per-SoC compatibles

Changes since v3:
- Drop MSM8998 completely, it conflicts with qcom,msm8998-dpu.yaml

Changes since v2:
- Fix MSM8998 compatible list: "qcom,msm8998-dpu", "msm,mdp5" to allow
  handling this device by either of the drivers.

Changes since v1:
- Renamed mdp@ to display-controller@ in the example (Krzysztof)
- Extended ports description to mention possible ports (Krzysztof)
- Fixed ports@ regexp to limit to just four ports (Krzysztof)
- Included patches adding per-SoC compat strings to the schema and to
  dtsi files.


Dmitry Baryshkov (11):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  dt-bindings: display/msm: add core clock to the mdss bindings
  dt-bindings: display/msm: rename mdss nodes to display-subsystem
  dt-bindings: display/msm: rename mdp nodes to display-controller
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
  arm64: dts: qcom: rename mdss nodes to display-subsystem
  ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
  arm64: dts: qcom: rename mdp nodes to display-controller
  ARM: dts: qcom: rename mdp nodes to display-controller

 .../bindings/display/msm/dpu-common.yaml      |   8 +
 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/mdss-common.yaml     |   8 +
 .../bindings/display/msm/qcom,mdp5.yaml       | 156 ++++++++++++++++++
 .../bindings/display/msm/qcom,mdss.yaml       |  51 ++++--
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   6 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   2 +-
 15 files changed, 230 insertions(+), 163 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

