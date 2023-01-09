Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2071661E35
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1054F10E270;
	Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE1410E02E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x37so7769408ljq.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PvdkWVVFT++i2HrXBK25wLmmBQIyNJvJJ78RUMtwfHQ=;
 b=cMmJD80AQE5+uGOgBtAn20gwsELKhIR5IRx28DwD9gcV/j376g1au5p3+zmmlWRRoJ
 ik5BtT0BPcSiCHxmJCPV3zFErCP/brX6c6gIGzCZbMnyGk7KD5hclqpxrZmee4mSO2za
 YzNsWNh3pENDCfe3KqxSjl22TY/kKSe0E+BN0ZSgBVfbzcaW+EIgX6BQgBGmdXn6HbtX
 KTm5AMr8S4HsVlNK0nPmZD8diV2d9jvlhnUMeTOCS59Zs12CTRBZpqxgtO7jGS1WlJcz
 7XPoBH1YRvijCI8OxnoPKxWAoePIb1JpcoH/qzrnhqJvd+jsKcul6+PQDTJ3LOGyGYz2
 ac6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvdkWVVFT++i2HrXBK25wLmmBQIyNJvJJ78RUMtwfHQ=;
 b=Gq0AKOBTe2RaB2dMBfbG3spB6+IYGpjh8hB6+m+KgM1ri5ZRU8ibk20K1nFY5J693v
 3k5IhgahCie+f78t1lLhzhwbUMO3/ZQcHI8P/Z4t6wDhmvSS9dCcmxOIOJW/nCQ30S1k
 o/1/oOmmdKV9Jjc7PGntA9gW7xjfIgMQVUt8RF8cStY5CIMlylbin1NHcxN1vRGtiGbv
 Put6ruy+hQleZI9IagTsH+u7+KDpxKn4mQFmb3TTq4T5iyfLsemNxylm3PxxL0CeIR1I
 d2RGeGso/DQ9XW2I37VJwaO62XH+qqzkMq6q1P7+VjESseREcfr63nH6dITXi4C3On75
 BQjQ==
X-Gm-Message-State: AFqh2kr1Z+7B9dUYcQGbJum6F+57616d6U76a5GJiQeoZlnxzIBQfDs8
 /7+MX4gKcQ1g4nZpfEA3vNEcOg==
X-Google-Smtp-Source: AMrXdXtdwSRQ4dPucdNAQqPmdkBsTj0C9tXRHKfE+ngpkDjMyh9Kw6hDCs2C7izQqkMAG/GiGql+5Q==
X-Received: by 2002:a2e:92cf:0:b0:27f:a604:22b8 with SMTP id
 k15-20020a2e92cf000000b0027fa60422b8mr15051285ljh.40.1673241242904; 
 Sun, 08 Jan 2023 21:14:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:13:56 +0200
Message-Id: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/6] dt-bindings: display/msm: rename mdss and
 mdp nodes
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

Finish the process of renaming display-related nodes on Qualcomm
systems. Fix it in the schema that MDSS (Mobile Display SubSystem)
devices are named `display-subsystem' and both MDP (Mobile Display
Processor) and DPU (Display Processor Unit) nodes are named
`display-controller'.

Dmitry Baryshkov (6):
  dt-bindings: display/msm: rename mdss nodes to display-sybsystem
  dt-bindings: display/msm: rename mdp nodes to display-controller
  arm64: dts: qcom: rename mdss nodes to display-subsystem
  ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
  arm64: dts: qcom: rename mdp nodes to display-controller
  ARM: dts: qcom: rename mdp nodes to display-controller

 .../devicetree/bindings/display/msm/dpu-common.yaml   |  8 ++++++++
 .../devicetree/bindings/display/msm/mdss-common.yaml  |  8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml    |  3 +++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml    | 11 +++++++----
 arch/arm/boot/dts/qcom-apq8064.dtsi                   |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                   |  4 ++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/msm8953.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi                 |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                  |  4 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                  |  2 +-
 13 files changed, 40 insertions(+), 18 deletions(-)

-- 
2.39.0

