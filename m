Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929F660B208
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 18:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C7D10E443;
	Mon, 24 Oct 2022 16:42:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AD810E43B
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 16:42:28 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z24so3530131ljn.4
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 09:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c08g93mBF9rHhNs3GF7QFErRxt7k1Q6/dC3x12TTUPQ=;
 b=yUK2myVCWVcO34uSWy0fHghoA84NZxDo5TJhxBYUNSM900bXaQ9hLJ9qNgrQyLQp5f
 +ELWvZryll9o+JUOYN7vMC9GLU9jJ7HBizm4RnFpYz3q5Br51TPu0ozqIUJrxMWc7Akm
 djiqSsIgFpriscJEeqouabdM1nCxmfTeelRKcci0kpBMRHX2GuCmMUn6g3qBursFVcC1
 E0t2CUrmKZGZz8+qYPVYoJbVbCu+N/i8J1XEnWKSg4u/HZ4UVCDmOPXKSRtf5fVxkGj5
 fITajnhGSR1/VqpiUunvYkEuU317Jv8asdwtEd79t+YbufbVsba1gv352qtZH32/jhju
 6UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c08g93mBF9rHhNs3GF7QFErRxt7k1Q6/dC3x12TTUPQ=;
 b=0enQlZLj7wgpj7IpErbMWziQAVNWgTKK8xacbwPQWg7pCiK0/K+hlDo9VbJb3t1tcO
 ggWMvleGGWo3i5bWIsnH832KEA1aSzDkuAiM9NSWO4pfH8U1GbvCzGCHrd1TlWI9tOOP
 jxtZdNnZtTsQI3AEDGicB8MdNsdhRjRBEBWWv8S8CKvoELwHA2/AwbjqGOaFAkmdK5zn
 oM6Ur+oagW7F3BUwANjWqfdJlW6og/hKOkMLAtDi0KjSSPaSnHPdeoYKRxfHN7GL9AR6
 FOpbrify7aE1PODXbjajNcmhZBVbM1610RqyYGhaTtX+QnrhUAi93RwYdfdEcWfcY3om
 rpTA==
X-Gm-Message-State: ACrzQf0p2WrFOUEbLfNgQH48iiNszQ9f9AaLNl5HWJ1HgNDdy2UEtZwA
 Ssdo45KxAx4801GN2TvF+Z1Fbw==
X-Google-Smtp-Source: AMsMyM6tFJiCqeATOg585ajkr5p5VpOPABLpiGqO7LfhXBC03jcNk0nMuWUmk3+wwHI9mYMZ/cL9HQ==
X-Received: by 2002:a2e:a910:0:b0:261:b408:1169 with SMTP id
 j16-20020a2ea910000000b00261b4081169mr13085322ljq.360.1666629746968; 
 Mon, 24 Oct 2022 09:42:26 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004948378080csm4593978lfm.290.2022.10.24.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon, 24 Oct 2022 19:42:13 +0300
Message-Id: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v9 00/12] dt-bindings: display/msm: rework MDSS
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards. Add schema for the MDSS and DPU on sm8250 platform.

Soft dependency on [1] to define qcom,dsi-phy-14nm-2290 binding used in
examples

[1] https://lore.kernel.org/linux-arm-msm/20220924121900.222711-1-dmitry.baryshkov@linaro.org/

Changes since v8:
 - Dropped DSI/DSI-PHY examples from the first patch. Proper example
   generate a pile of warnings because of DSI schema deficiencies. I'll
   add these examples back, once DSI schema is fixed.

Changes since v7:
 - Expanded examples to include MDSS child nodes (Krzysztof)

Changes since v6:
 - Removed extra newlines (Krzysztof)
 - Added $ref to dpu-common.yaml#/ports/port@foo to enforce schema
   for the port nodes (Rob)
 - Removed unused allOf's (Rob)
 - Fixed repeated interconnects descriptions (Rob)
 - Fixed dpu-common.yaml and mdss-common.yaml descriptions (Rob)
 - Fixed intentation of examples (Krzysztof)
 - Renamed MDSS and DPU schema to follow compat names (Rob)

Changes since v5:
 - Dropped the core clock from mdss.yaml. It will be handled in a
   separate patchset together with adding the clock itself.
 - Fixed a typo in two commit subjects (mdm -> msm).

Changes since v4:
 - Created separate mdss-common.yaml
 - Rather than squashing everything into mdss.yaml, create individual
   schema files for MDSS devices.

Changes since v3:
 - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
   depending on the mdss compatible string.
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

Dmitry Baryshkov (12):
  dt-bindings: display/msm: split qcom,mdss bindings
  dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: add interconnects property to
    qcom,mdss-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml
  dt-bindings: display/msm: move common MDSS properties to
    mdss-common.yaml
  dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
  dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
  dt-bindings: display/msm: add missing device nodes to mdss-* schemas
  dt-bindings: display/msm: add support for the display on SM8250

 .../bindings/display/msm/dpu-common.yaml      |  52 +++
 .../bindings/display/msm/dpu-msm8998.yaml     | 223 ---------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 222 ---------
 .../bindings/display/msm/dpu-sc7180.yaml      | 235 ----------
 .../bindings/display/msm/dpu-sc7280.yaml      | 239 ----------
 .../bindings/display/msm/dpu-sdm845.yaml      | 217 ---------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../bindings/display/msm/mdss-common.yaml     |  83 ++++
 .../bindings/display/msm/qcom,mdss.yaml       | 196 ++++++++
 .../display/msm/qcom,msm8998-dpu.yaml         |  95 ++++
 .../display/msm/qcom,msm8998-mdss.yaml        | 268 +++++++++++
 .../display/msm/qcom,qcm2290-dpu.yaml         |  84 ++++
 .../display/msm/qcom,qcm2290-mdss.yaml        | 198 ++++++++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 ++++
 .../display/msm/qcom,sc7180-mdss.yaml         | 304 +++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml |  98 ++++
 .../display/msm/qcom,sc7280-mdss.yaml         | 422 ++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |  90 ++++
 .../display/msm/qcom,sdm845-mdss.yaml         | 270 +++++++++++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 ++++
 .../display/msm/qcom,sm8250-mdss.yaml         | 330 ++++++++++++++
 21 files changed, 2678 insertions(+), 1165 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml

-- 
2.35.1

