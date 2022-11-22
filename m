Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B407634B25
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF6A10E4A6;
	Tue, 22 Nov 2022 23:37:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7CA10E49A
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:37:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j4so25860593lfk.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
 b=gGKAQKdv563C0u+WXaCrTOxSt4oi0Gzo9xbEyK0chJ5EkTcKRvEG7Chp7zHxOYhqBU
 xuNHeX+I2qzo1Bb65t4nCoto3D19Npd11LkQvCygMMcnblKMIbwQbZe66b1NfkaRBqtU
 NjP7rEVEXms5uh0ocz6cA72tmeEtp/7+DR4ub5CEW/zJTzFn1cxlxxfw6tcDfaQfFr3N
 PiXhHoDN38B5dqHk3D3MlUy68kYLCgGelhayXsDx7XmGEmxoRn3u7UVp5H4+5Nbm9H9K
 x7qG8BPSG/JBj02t2RUFCCNYdVZJj41myreXKfbExEFnTo03HpIYmNkz7iFD5no7/XuX
 6H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiQzjk4U2HBL8m9nCmdH0QqbW0qnEDB7JZce1irB8qw=;
 b=ElwzmMV6r1gIK0B7ZuM7ZWpIWFmQcvGMYZ95KJLsryfPPIx7IoFXjEC8LHAzHIcUMl
 xVCJvZSrAEPVZOjXedSuPDlCdQ3SkyTiPk9mTQ8jM5CbAlaIXG2xnYFOIhZpX+o0Zx0N
 oTx0jxDT8k6Zrpy3rzZeeGkMLPI+85OArvMffQD+ljGPYgA9gDBDiJD98HwijmO3cqFp
 QncYVKVCioAbr0FHhD+7R4fOv8twzk8zEHyeqVTlh2b1LCZtci/R9JuB20KsYSDrTU/j
 ArIXilEeRNgIkd/CYErEuVcP2o9De6TAACkQjtta6Fxa0za3ZZ584FeU6pTrTQpiPAjE
 Qg+w==
X-Gm-Message-State: ANoB5pkeSpFE81W/aHMV+p1oCUYy16b2JqbSbSaZkj5v8/m3UV6FxCGV
 1UeniZZGA48/fsSxfKK2y/JLfQ==
X-Google-Smtp-Source: AA0mqf4rbwu1mUCXJ+V4n19yRGiu6bs/kFIOG1QwdiwAGz+l+K+/1xXJzZ04Qsd1evUe7LbbLVzz7g==
X-Received: by 2002:a05:6512:32d0:b0:4b4:b5ed:c71f with SMTP id
 f16-20020a05651232d000b004b4b5edc71fmr8410539lfg.227.1669160220307; 
 Tue, 22 Nov 2022 15:37:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac250c3000000b00492c463526dsm2666454lfm.186.2022.11.22.15.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:36:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:36:54 +0200
Message-Id: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/5] arm64: dts: qcom: sm8450-hdk: enable
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

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 119 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 412 insertions(+), 12 deletions(-)

-- 
2.35.1

