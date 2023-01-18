Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2BB671250
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 05:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF34910E65F;
	Wed, 18 Jan 2023 04:12:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DC510E663
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:46 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ss4so72978179ejb.11
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pO+Uco41EUjfLqhvJP0rFyHyCPPZFeb3S6/8ABkjVA4=;
 b=lHJFpcqGExqtPFjhW7R5odgjeffA5J3nNkxsE+e/AMD4ZAOg1xKVF1Z/XHFOkUTH0b
 rUgW8aA+Qb5V0MgimIf8ps7QMSTbg2tCj345pUWsqD1ObNLFjf+8QJXLcn/jyEj9DWqX
 j5//dZs7yYdaWNRL3mPEVLbuJG8inR6iK4gb7Sa5fj8TKSyUv3YrMQg6ztG754SbYRqg
 y4MU8dO3SJdhTkxOpM0g73TQkzTVO4pQ11HXvQTzG6NmkrZgrM4rKzuC0JOh6PwPa5FW
 R0Kjjq7m9WiWVHba7ajm9PExa9tpqhIR5c0LFosf8rtrxStGxoMAlkHFYMMNpLBgJY9c
 I5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO+Uco41EUjfLqhvJP0rFyHyCPPZFeb3S6/8ABkjVA4=;
 b=uhliAUlE18k0nAe97ON9qvdAIzQFikrSVIiZVeIiGiL8hWzG+1DhLgmJucHAsMkJv7
 NkISKhYk10N2969Dis/n0uOzcKPAYwXu6OGAkCc6NP/OCz2EFwdjT4aKSVRtnSnDEFzg
 RGsu3C/+B6aQTDo4C8IrLM93yxKgsmNtvfsZIi2Bb2YhXB5TWmOt2XYTKZ2Oj0RXcmXv
 /NM6ukPpx+WJP5uZSK19zQUbUJXV9x8ExU29LZ95RjFG0IAkOffKIL2Io838M/JCUTcO
 Srguajj3i6O6hX1oEfzsIB3iQteHa0RvnPbzii/DlvoEzCehvwaJKk7Ubb2MHNxfDaaV
 1fBQ==
X-Gm-Message-State: AFqh2kpAG2am888WktgJG3N/ydOBjJRuoxbXQkjbblMmY1zW1VcQ+lXv
 UigcxdhuJw5PmzYqMxjidOtfcA==
X-Google-Smtp-Source: AMrXdXu9dIuU8w6EoeW3K9kLGvsJMauYo1b6ux8eRySmw1DVE5IlEjw3z7pg7LCdSH+d6wwqFZhpmg==
X-Received: by 2002:a17:907:a708:b0:86d:e1ce:5c9c with SMTP id
 vw8-20020a170907a70800b0086de1ce5c9cmr5171931ejc.76.1674015165386; 
 Tue, 17 Jan 2023 20:12:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 18 Jan 2023 06:12:32 +0200
Message-Id: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 00/11] dt-bindings: display/msm: rework MDP5
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

Patch 4 might generate warnings in qcom,sm6115-mdss and
qcom,qcm2290-mdss examples, but they have been fixed by the commit
e5266ca38294 ("dt-bindings: display: msm: Rename mdss node name in
example"). See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294

Changes since v6:
- Switched qcom,mdss.yaml to use contains rather than oneOf (Rob
  Herring)
- Fixed typo in patch 3 commit message (Rob Herring)
- Reworked clocks/clock-names to have oneOf under the properties
  themselves, rather than having a toplevel switch (Rob Herring)

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
 .../bindings/display/msm/qcom,mdss.yaml       |  46 ++++--
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
 15 files changed, 223 insertions(+), 165 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

