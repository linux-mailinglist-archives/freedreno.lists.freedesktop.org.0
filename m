Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C7646622
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 01:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FCE10E140;
	Thu,  8 Dec 2022 00:55:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7CD10E19D
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 00:55:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x11so22791331ljh.7
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
 b=tY2d4VviSGal/QMy9Z8CDdTou7sz4oxGObjk1VhuO0dDlh07dZ/rj8gFNbZLpvolDr
 RsiekjR/3/s1q+hK6q5mLycMcIuBOX9nmO+86FAYo8GV462xgJU8JOXZz+KuI1lwsFqm
 nLlgUQiAa4BGZPDXR5CfiXcEXMOgZR43PMk0EDYRqrn/cRlJ6zy8n6c+p0nILDA3uWJq
 TBRKce7/qGf6r2l++J9vufs5OrlJm5MPo5V54ispGhcZy+202z4BMYTShMpl3EiJ5/0I
 HL5zScV3/d6utMGTzhyVtjnQzCmXvK8oFhDz/LvAAleKaUfktCjvkeoqTEK21fTQRosa
 xLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDR5TGPsNhjWsPBDgVfNtYEgkFBeujMENl7U3gpKJY0=;
 b=lAvLb6FUtFTGtv66805qbMz85uxA5N35/Q4BskeotwPP6QkFsx8V/hdJsZMET2yMJd
 X8WppYkpsvIjdz+tGNczGNWcod5SMGFkmAA9jXUljaok+IqoYsFio7v6Ho5Qa2x9JT6X
 woTw3sM+YfTxK1XN8BqJKupuFxxG8AmnuGjQGT3LTY6xgmlo44ccCIZZ4Hq56u+g4XNP
 VTWP3EQQ2PSeeq7XWj+rMXWcWaOVzt+B5fsyTzo64nIakijT/HNcrdn0Mza3yHom2NgV
 kIPaRFsMhfAsLKygNcmL008hJ/BMI4GxhHL/X6ly9Y34WTLXfMVH0aVooL1mhVkFraf6
 01jQ==
X-Gm-Message-State: ANoB5pnthpRy+0z9mPiu6d1YmvLQf9IXrZBLqyohYoLZHwULFI8Kt9aj
 8tvLeqANsaM/+XvW6jWDz8xq3A==
X-Google-Smtp-Source: AA0mqf7elxcLWQxq40/vt8Rf3Z6g2zKIwhLRkFfg9GZBlR3gUTfVmrB+lEcu5V+SRNewsNZOOhiTdg==
X-Received: by 2002:a2e:8092:0:b0:279:da43:44bc with SMTP id
 i18-20020a2e8092000000b00279da4344bcmr8376466ljg.432.1670460899485; 
 Wed, 07 Dec 2022 16:54:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 16:54:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  8 Dec 2022 02:54:54 +0200
Message-Id: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] dt-bindings: display/msm: convert MDP5
 schema to YAML format
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

This patch concludes the conversion of display/msm schema from txt files
to YAML format.

The per-SoC compat (new addition) is required to ease migrating platform
support between mdp5 and dpu drivers.

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
 .../bindings/display/msm/qcom,mdp5.yaml       | 155 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 7 files changed, 161 insertions(+), 136 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.35.1

