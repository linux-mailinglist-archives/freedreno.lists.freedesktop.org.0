Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD306920FA
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 15:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4810E075;
	Fri, 10 Feb 2023 14:44:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454B10E075
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 14:44:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4220513wms.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JUqcgjjujHjgkEdrCVWav46MZqcwfOU+3rk+uktWyHw=;
 b=Tcm3kjkA01LfVgB8goZfB68FwZ9QASyREqArn5psyMdXx/nm4CJgHWDoUzWaE5/03g
 8hd2cTfrLT1E3NvDqhrzAo1VJEmZ9tbiNmqaQ8lK0iGRhOR4561wh4x7clrw4sB/mfg1
 rggiYF8vvQlzsnu0MFJGHdh5Am3Ibilc/tLBF8rHFpeUy3Mlu4MDrDaqYBA21XMP8x5W
 q8ypksvm15BDjFQ1RAV2mlj1+mfRFfN8WXCEihGHi9DoHam5ziw07Qnb0jKoNY4XE6ds
 eaDrs5x3yseXV5HBE1Q3hlnqvsTDiDSUT/HS3nDdEf7ffk6Jx5zFwsY2qW+XOFgS/V9f
 JCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JUqcgjjujHjgkEdrCVWav46MZqcwfOU+3rk+uktWyHw=;
 b=DN4xkxHKzIGmws+TVl9JpMHtCdDwOKDqyzJoBW7qTMeBzuWwe/MZLYIga11FnVUUiA
 3iUX3bqtYCWvx2e8U0BxyYZzWLvF7fjzC4ODIVBoR2GITHtA3ofc4yRNC2Ryo2g8gShM
 Xye7D8aUx9vEdh4xfD8Z27YS6J/lD982Nlfg6pRsp0xPKWKqE75fHLGhrRwXdqhxfbNX
 cf83n2L9V7iG0+4tFu3JMUcSF6WIYYsWX2zXB3FabOaeoeOKmU0Ch/nRaXOBN+1s1PWv
 qp6wD/g3YnhOhyPMzY6xVl0bXJnKHa9pI0ut04JPO/og9I8IcJjx8bOO5nwm3YsBZofV
 EQJA==
X-Gm-Message-State: AO0yUKW1hkCdSuP8Gw4koyqXh/G+5alKBbxVjX+HOUvBwjf1ocAEmdCU
 vEEQjS5V98AzA5kKzaDkt/56LA==
X-Google-Smtp-Source: AK7set9Yfx6thYGeqLRFFTpxS8OxPb6iS6nN6p/mF+ff7zlCZ++CU90uPOwp6syQ2BAvxOxvTiXajQ==
X-Received: by 2002:a05:600c:4b1b:b0:3d9:f836:3728 with SMTP id
 i27-20020a05600c4b1b00b003d9f8363728mr12967771wmp.11.1676040266901; 
 Fri, 10 Feb 2023 06:44:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l40-20020a05600c1d2800b003dd1b00bd9asm6103000wms.32.2023.02.10.06.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 06:44:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 15:44:20 +0100
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERY5mMC/52OQQ6CMBBFr0K6dswwUEVX3sO4KHSUJrUlUyAaw
 92t7Fzq8v3Fe/+lEovjpI7FSwnPLrkYMlSbQnW9CTcGZzMrQqqQcAdjHFwH6d7UGmEa0ihs7mA
 H6GIYJXrPAoSoa9NSg5ZVNrUmMbRiQtdnV5i8z+MgfHWPNX2+ZO5dGqM81ydz+Vl/i84lIFzLq
 tbNntiWh5N3wUjcRrmpT2CmP6SUpZoO1hBhtdPf0mVZ3pB6XpFBAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
Subject: [Freedreno] [PATCH v3 0/5] arm64: dts: qcom: add DP Controller to
 SM8350 & SM8450 DTS
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch the QMP PHY to the newly documented USB3/DP Combo PHY
bindings at [1] and add the DP controller nodes.

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure in discution at [2] & [3].

DT changes tying the DP controller to the USB-C port on the HDK
boards will be sent later.

Bindings dependencies at [1]

[1] https://lore.kernel.org/all/20230206-topic-sm8350-upstream-usb-dp-combo-phy-v1-1-ed849ae6b849@linaro.org/
[2] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
[3] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added Reviewed-by, Tested-by tags
- Used QMP PHY constants for phandle parameters
- Dropped reordering of mdp ports
- Added p1 dp regs address space
- Link to v2: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org

Changes in v2:
- fixed the bindings
- cleaned up the usb_1_qmpphy &  displayport-controller nodes as requested by dmitry
- removed invalid mdss_dp0 change in sm8450-hdk.dts
- Link to v1: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: msm: dp-controller: document SM8450 compatible
      arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      arm64: dts: qcom: sm8350: add dp controller
      arm64: dts: qcom: sm8450: switch to usb3/dp combo phy
      arm64: dts: qcom: sm8450: add dp controller

 .../bindings/display/msm/dp-controller.yaml        |  25 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 121 ++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 121 ++++++++++++++++-----
 3 files changed, 203 insertions(+), 64 deletions(-)
---
base-commit: 2c733385c7b8923b03e9730b87f595589a007b46
change-id: 20230206-topic-sm8450-upstream-dp-controller-20054ab280de

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

