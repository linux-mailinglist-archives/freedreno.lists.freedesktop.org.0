Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42B654AAC
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CCE10E19E;
	Fri, 23 Dec 2022 02:10:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2FF10E193
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n3so2644972wrc.5
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V61v7o2qMnueojIDHZPqsNgrVDte2LSI7QH2SkLkZNo=;
 b=iSkKnGD11cub4SDAg2GZe0WUULRc3g0u1XlENGOVVCwXebdReZVkHL1WLa6m4/otJA
 w9JNwaVAovzNI0loDgLycfSkFCQ64rDkV0hG6gxxpg4RJLojaG/wQdAh0vs82G54DJS9
 tTaxj0WirSFjEhx2fUepXewVtEwugtgojdo3Eo/Fm7a6f6TQ6z5c9q269Ds9APxKbdiA
 LGwZ+Ubor/WIzM9FLExydbBg/GTK6vV+CfFeFbB/tA4CKpnOGSjlLpSjhZBUpEAVM2xI
 epScqBw9fsgNkTFE+GHOLhp5k1ukiqjan+q107Wi0ip0Qc11hQL0CemSbpsCIc+67FsJ
 fpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V61v7o2qMnueojIDHZPqsNgrVDte2LSI7QH2SkLkZNo=;
 b=qYZzwHwk+Ew0Zy6MSoXgNj1gQJpRed6SOK3rluWeolevvuhvvN/JFkLnPFPZDFg31h
 TGJOI6V5A4ZIPes4vi0BMuRGFd3U7yJDjcR6aIiJ3ogjPLp+kZ5BmXz4pxKWP7B5sYHt
 ftM/LGH4Y2HjwW/lEF8wYCozbxRuM22q8tKS0iArZXNHUq3c9+9SZ3jx7IlGAAHEcFR9
 sA8jAX+Jp0Hvrib2Bw4Zz7jg9+2e7UsDWsKXPTTmbpJ1Fi2Wr+YqymKdT9CcGqODbT5E
 A34LcLXQhTGRvSjgutVMNJvb2eS4YhCI67XNInJPm1RbGoucbPG9FasPRk2nCctR2f6U
 V2ow==
X-Gm-Message-State: AFqh2kpzmJKMYgK7ziOwnUMn1EO5zb/L3kNLZuHW6hcGvNAm4h90D5d8
 KsbnMfJsJXOtvLu21l7B9omcfA==
X-Google-Smtp-Source: AMrXdXsOmXW4NSyHwF5rO4+P2Il6blqj62PbuO24b/0DefcbmCMMhsQqCKUbAo7i8e/oXYA2gIfYOg==
X-Received: by 2002:a05:6000:16c4:b0:242:5083:abea with SMTP id
 h4-20020a05600016c400b002425083abeamr6224322wrf.69.1671761428736; 
 Thu, 22 Dec 2022 18:10:28 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:28 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:07 +0000
Message-Id: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 00/18] mdss-dsi-ctrl binding and dts fixes
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V6:
- Squashes a number of patches per Krzysztof's comments on bisectability
- Adds in Acked-by Rob and Krzysztof 

V5:
- Adds compat strings to bindings/display/msm/qcom,SoC-mdss.yaml - Dmitry
- Re-orders simple fixes to the start of the series to allow backports - Dmitry 
- VDDA and drop of node-names - Krzysztof
- Deprecates qcom,dsi-ctrl-6g-qcm2290 - Krzysztof, Dmitry
- Expands set of updated files to include new msm8953 - bod
- Converts to agreed compat string qcom,SoC-dsi-ctrl hence
  -              - qcom,mdss-dsi-ctrl-msm8996
  +              - qcom,msm8996-dsi-ctrl
- Adds RB where indicated for the compat strings.
V4:
- Moves the update of the example from patch #5 to patch #4

V3:
- Moves declaration of mdss-dsi-ctrl into compat string declaration
  patch - Krzysztof, Dmitry
- Renames qcm-2290 compat string to agreed compat "qcom,socname-dsi-ctrl"
  Dmirty, Krzysztof
- Adds empty line after if clause in yaml control flow section - Dmirty
- Adds Rb/Ack - Krzysztof, Dmitry, Doug, David
- vdd*
  Looking into this some more, I don't believe vdd, vdda, vddio ought to be
  required properties. Its up to the PCB manufacturer and the panel in-use
  how that panel is powered. Powering the panel is not something that
  even necessarily needs to be done from the dsi-ctrl driver.
  Originally marking vdd* as required in the .txt was an error, its not a
  SoC level dtsi requirement.
- clock-names
  Rather than replicate the clock-name in each if block I listed them with
  a specific description from a similar reference in usb/qcom,dwc3.yaml.
 
https://lore.kernel.org/linux-arm-msm/eb80681f-2e0b-605f-0444-ec65562f74b8@linaro.org/

V2:
https://www.spinics.net/lists/linux-arm-msm/msg116326.html

- Moves the DSI PHY changes to a different later series.
  There are enough dsi-controller-main changes to justify its own
  standalone series.

- The original phy-name binding change given discussion with Rob and
  Krzysztof became its own standalone series that has since been merged.
  https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403214.html

- Retains the drop of power-domain from yaml as a required property.
  I dug into the available dtsi. The apq8064 doesn't appear to have any
  GDSC which can be attached as a power-domain, which means the
  power-domain requirement is not universal across the various silicon
  versions.

- Adds Dmitry's RB to power-domain drop

- For the clock declarations I've
  * I noticed that the simple change I had worked for msm8939 but
    subsquently broke other dtsi which drove a bigger change to document
    the clocks on a per compatible basis.
  * Added compat strings in yaml.
  * Moved the allOf down later in the file to acomodate the if/then.
  * Number of clocks validated on a per compatible basis
  * The driver code which doesn't care about the number of clocks
    can still operate on the mdss-dsi-ctrl compat but the dts checks will
    validate against the compat string and yaml.

- vdd descriptions
  Took the previous text I missed from the .txt file - Krzysztof, Dmitry
  Adds vdd, vdda and vddio to the required list. This exposes warnings in
  existing dtsi but the previous .txt declared these regulators as
  required. - Krzysztof
 
V1:
This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.


When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403211.html

Bryan O'Donoghue (18):
  dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
    constraint
  dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
  dt-bindings: msm: dsi-controller-main: Fix description of core clock
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  dt-bindings: display/msm: Add list of mdss-dsi-ctrl compats
  ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
  ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
  arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
  arm64: dts: qcom: msm8953: Add compat qcom,msm8953-dsi-ctrl
  arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
  arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
  arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
  arm64: dts: qcom: sdm630: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
  arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl

 .../display/msm/dsi-controller-main.yaml      | 249 ++++++++++++++++--
 .../bindings/display/msm/qcom,mdss.yaml       |  16 +-
 .../display/msm/qcom,msm8998-mdss.yaml        |   8 +-
 .../display/msm/qcom,sc7180-mdss.yaml         |   6 +-
 .../display/msm/qcom,sc7280-mdss.yaml         |   6 +-
 .../display/msm/qcom,sdm845-mdss.yaml         |   8 +-
 .../display/msm/qcom,sm8250-mdss.yaml         |   8 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 18 files changed, 292 insertions(+), 52 deletions(-)

-- 
2.38.1

