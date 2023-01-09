Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D506661E14
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF010E270;
	Mon,  9 Jan 2023 05:01:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ABC10E26F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:01:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f34so11215368lfv.10
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ok+qK488vGNle4t9+FREyJqmLLm1uU83p9UuS5OAb28=;
 b=LjWJQF5RlnaPF15+9Tq7jpic+Kvjlrf3R9ol4KniKkED29v00CN/ba2n0OZVkivs2s
 qhzCmh12DQFbkcgj0gnhWeTBgwpWNvWu25qcraZNX0dq+AEIQwAU3FlcjDBIb5tsJscf
 mbB/8WG8Bj76EebIioeHtlKwW3OQIpAkcN8ZlGoT+3tCf7UizhH4PTOibC4OwQMK3An5
 73BCQ9mvErzeZZbAV0qvQcpE88SpSNORNattXWWSX8zjpb7IER0ftHS8xTzfTkHP90bX
 5so02fD+RRyRSQHmQV6mBa+3RKi0k9h0utam9IIWjlHNdFhoNmlUeKhd/yWfFqSIZe2/
 HHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ok+qK488vGNle4t9+FREyJqmLLm1uU83p9UuS5OAb28=;
 b=LYIdTJ9TU8P6RhayTObPVPknKwal81ARJtw0RFy5VBtyTI0tRbju+BDBYhCfwF4zoD
 7/F6/OqjgQ4FYmdaCiGpfRSG7ofXfdJOcPzeCYBaqVZ7EMFY6DuagkkG8mVZZ2e6pyvG
 aoo+lQCi2CObdM5s4S7Vaq+PpMdZK6+tXCl6DNggmttQdnGOHvz0+B+S064fhyQHYk6x
 7Hl0n1kKKVws6Yexs2tFIEyAx6Jhio1wE5YFFxa4fpZLOhhtcc95xtFYVP8zXDyUyK3H
 tWYNvoeE8Pf7BtyX659IasxYnP2L9eO3ulEsATVJQrb3jEp08ESj3LtO8et2WnZmoz/z
 GmIA==
X-Gm-Message-State: AFqh2kpUY1gL6ft2j/A4wyI16HBsHdD8ETCPmGrQquqTpITXtIt+xlHJ
 DuL4ewCm2qL1XVGTrGFpFFyhvA==
X-Google-Smtp-Source: AMrXdXtzp41qqG/lszrfNHfC2L92bMUpFeXQtOiWuX952aJY0JwdWMQ8uRD2mPp1CBfrgDMQkk1Jhw==
X-Received: by 2002:ac2:53a3:0:b0:4bc:4ad0:4142 with SMTP id
 j3-20020ac253a3000000b004bc4ad04142mr19967819lfh.58.1673240513932; 
 Sun, 08 Jan 2023 21:01:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:01:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:01:48 +0200
Message-Id: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 0/4] dt-bindings: display/msm: convert MDP5
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


Dmitry Baryshkov (4):
  dt-bindings: display/msm: convert MDP5 schema to YAML format
  dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
  ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
  arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes

 .../devicetree/bindings/display/msm/mdp5.txt  | 132 ---------------
 .../bindings/display/msm/qcom,mdp5.yaml       | 153 ++++++++++++++++++
 .../bindings/display/msm/qcom,mdss.yaml       |   6 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   2 +
 8 files changed, 164 insertions(+), 137 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml

-- 
2.39.0

