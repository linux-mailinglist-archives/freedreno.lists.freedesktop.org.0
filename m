Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69F5A0D26
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 11:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621C1133C9;
	Thu, 25 Aug 2022 09:51:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD51F11216C
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 09:51:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n24so16855559ljc.13
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=tpyf1AK+W21R0VaLwh8O8+lqzRdSfdFGGL30pitSVKM=;
 b=J9KRyJrDgp3B5iFvG8wKhqBYQppPrdNLt0cdQBT9SR4/ZjFxDGnjp1AYqpwiluT47b
 LMkAbILCXkKDgo8KIEXpt1XTHOOhyn0g0ON2vdbGTjD99tZVRwmun0bjaxoWJaFYvdxB
 Arv9xQDXAxUSjUfsgeThbnn8tpX3+AGG8r3r0ehPCwBT39EboKCwUY/vdJMgAif2Gss2
 oBKB0vnsqgc+IymkJlJsdUFrJ/QfJBBE7IP1MBXAZjLcFozvx9/8Xfj42eJ6POYGb6sJ
 3cJ44/FJSy4mavYAaIQvOz9oONnm5a73z1D8IUDGweCIlKXC5ezMw8a/AvT1eDH49z/J
 My3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=tpyf1AK+W21R0VaLwh8O8+lqzRdSfdFGGL30pitSVKM=;
 b=AMDrX6r+fRFRM79jU+ihfCeksT9kPT9uCewaCpHSFgNm3OeLyXVsdcErteJ2KN5+EP
 S3LPgSJ2liVifAGQSM7Zf6N0PZ/39PXt6e/pZFk+wRq9b19EPsOXTa7c1wdFzftJHIld
 e3DBwbSmwprEoE/kvNr/zt042sV6F1kbxqnpzJYfF0QNaG1E9un/mKjxQFegh6y6G5E5
 eGkrxHfBS9YxjG3lYU5o3jxQBbKLueh+wiz0mTmlPTlFQ5H2mTDSWhMR5eSl7BZd4vLp
 R7xuPxLbrLDXeYxEwT/yNMgU21rbCFILb9pVYrcznqHcsJ6oCzL+txca3vhuW0cjflP/
 IxEQ==
X-Gm-Message-State: ACgBeo2om9K5WRf07tsVD8nALQ1ESKqg9iAoF3hJhWpIEfD01LIEiq7l
 6fvparctg9mmzf/kDdbTqxIIIQ==
X-Google-Smtp-Source: AA6agR74Tz9FPEsBsZZMiR9A+8UDim/mVuD9g6zKLM5gd+q0/nbi8JTdlx+L1gjtLTobGxLzqAHrqQ==
X-Received: by 2002:a2e:9b59:0:b0:261:d61d:5f51 with SMTP id
 o25-20020a2e9b59000000b00261d61d5f51mr801415ljj.418.1661421065035; 
 Thu, 25 Aug 2022 02:51:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 02:51:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 25 Aug 2022 12:50:53 +0300
Message-Id: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 00/10] dt-bindings: display/msm: rework MDSS
 and DPU bindings
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards.

Changes since v3:
 - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
   dependin on the mdss compatible string.
 - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml

Changes since v2:
 - Added a patch to allow opp-table under the dpu* nodes.
 - Removed the c&p issue which allowed the @0 nodes under the MDSS
   device node.

Changes since v1:
 - Renamed DPU device nodes from mdp@ to display-controller@
 - Described removal of mistakenly mentioned "lut" clock
 - Switched mdss.yaml to use $ref instead of fixing compatible strings
 - Dropped mdp-opp-table description (renamed by Krzysztof in his
   patchset)
 - Reworked DPU's ports definitions. Dropped description of individual
   ports, left only /ports $ref and description in dpu-common.yaml.

Dmitry Baryshkov (10):
  dt-bindings: display/msm: split qcom,mdss bindings
  dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
  dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml
  dt-bindings: display/msm/dpu-common: add opp-table property
  dt-bindings: display/msm: add support for the display on SM8250

 .../bindings/display/msm/dpu-common.yaml      |  45 ++
 .../bindings/display/msm/dpu-msm8998.yaml     | 139 +---
 .../bindings/display/msm/dpu-qcm2290.yaml     | 143 +----
 .../bindings/display/msm/dpu-sc7180.yaml      | 148 +----
 .../bindings/display/msm/dpu-sc7280.yaml      | 147 +----
 .../bindings/display/msm/dpu-sdm845.yaml      | 139 +---
 .../bindings/display/msm/dpu-sm8250.yaml      | 123 ++++
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../devicetree/bindings/display/msm/mdss.yaml | 591 ++++++++++++++++++
 9 files changed, 861 insertions(+), 644 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

