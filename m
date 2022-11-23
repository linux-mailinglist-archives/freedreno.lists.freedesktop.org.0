Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E65636C05
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 22:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89110E633;
	Wed, 23 Nov 2022 21:07:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F889798
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 21:07:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j4so29998848lfk.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0A9RS9WTIAG2lt1QtTE8t0FlIRUG4CfcC0TMQSUbrY=;
 b=OlLe32Q7esYlagWdYgvqaaO7qhmshYM8OtCqr+j9I+xK/dw34fk/8Aqicw3BcPvaZ/
 1PCv2AxP/VlKMF2iwb002W0G3prAqiIHdun1LZsEUmG8uLJ/CJ6Un8Kj0keI00PCk08n
 i2U8gVm9BpvwrhLuQG7CIIf9EPzSV0oudxv5dl+Xqe+xhAlohvG4rYrMYE2geLt6jfFb
 ZRx7549DNxoku9IpQXYrBFDh0vs2mPZcFTLruShebPgXLUclk9YF3ucB/9vzvINaJvYp
 Mzcr2s3LVqHOjEUBe/FiL4zQodidSM/Nasz3T5gq20+S4EAQllxKONFAyVHBXcZoEej9
 T3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0A9RS9WTIAG2lt1QtTE8t0FlIRUG4CfcC0TMQSUbrY=;
 b=Aej6IMRGxQf5sEOvIG9gAmUxh8xjmcgRn9kxXNhqROaQQboknDzDvbZ9VYHHS6+Rtj
 9w5lrCcLmRrc2ULRZB3xNA40KYxbxVzSzmS/CzisKlBCCP5EZhsCn195nyv8/wp7mT24
 d1V7qQ/yxzpIXdnfmAY06+6VqcEIrRI3IRHlm5zgY7Sz/+iKLFMNKFK3tGtC3e3fF0X6
 314J+X5Lbw4S4PQjQ7LJjv3HoWUKMzygI3P0UjhCj5RjujcxpMpL/gn7SX3jGxWTpurd
 Wex+BavL0atXxNrAu4gyD7cNemQdhr4CQqRuEqtTnVloyalHeFbLgWpf+nL9Cm4K0iQX
 /nsQ==
X-Gm-Message-State: ANoB5pkpbBUW8zibmBGezPDmEzvzOkM+oLv6c6cR2MKchNTyHHBqjVsZ
 qPxtvT3FyvXOC3TWcgbQRpxnkA==
X-Google-Smtp-Source: AA0mqf75hVPqSKxibnxFEsIPqYTLibqLSPku8NPj30wsuDlj+TSP2+pWTMc7yYwJd2S8M4bkwpKu9w==
X-Received: by 2002:a05:6512:3c8e:b0:4ab:714b:7d1b with SMTP id
 h14-20020a0565123c8e00b004ab714b7d1bmr9670025lfv.621.1669237641402; 
 Wed, 23 Nov 2022 13:07:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:07:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 23:07:15 +0200
Message-Id: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/5] arm64: dts: qcom: sm8450-hdk: enable
 HDMI output
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

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Changes since v2:
- Dropped clock-names from mdss device node
- Fixed pinctrl configuration used by lt9611uxc (Krzysztof)

Changes since v1:
- Reorder properties, making status the last one
- Rename opp nodes to follow the schema
- Renamed display-controller and phy device nodes
- Dropped phy-names for DSI PHYs
- Renamed DSI and DSI PHY labels to include mdss_ prefix
- Renamed 3v3 regulator device node to add -regulator suffix

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 117 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 303 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 409 insertions(+), 12 deletions(-)

-- 
2.35.1

