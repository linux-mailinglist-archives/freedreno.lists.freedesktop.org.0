Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59D77F9FF
	for <lists+freedreno@lfdr.de>; Thu, 17 Aug 2023 16:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F9210E4BD;
	Thu, 17 Aug 2023 14:59:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD2310E4BD
 for <freedreno@lists.freedesktop.org>; Thu, 17 Aug 2023 14:59:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so1059120866b.1
 for <freedreno@lists.freedesktop.org>; Thu, 17 Aug 2023 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692284382; x=1692889182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7cbonIUO9k6Z+IRlK2Q9DZPwI9fbtSbJaIBTTDnpXJk=;
 b=bvURTGxPiaEsoW2gStRUIiIUL1nmpH9aWh69Jd03Mbx/clTMRyGpkrpPMLGNg1vfNw
 t60axJ/0XPgoW6RwmVzKTchAtH89Wf3xDZTBDFmIkQTlMsgpN6yZC0WqqpeLxe43mdjg
 ImihLUer4BFAWQZDUCa0WsRSPLLMFvtkBQF9GrLDErYBMlaNiT6mP6P4Tcs7Sm8OGfbE
 91zkigZhdOfDwR0bR4E07wH5Ok0S0DTzBd6iWisJKQIbn1Hnj2RGI7VFCtJDjuPvfSRa
 41N2ReFCUMhwKNP4uDOD/0CAA0O1AVNOWrMrETPpm5czoV1gque6ifzp2MBaDqYCH1FF
 UQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692284382; x=1692889182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7cbonIUO9k6Z+IRlK2Q9DZPwI9fbtSbJaIBTTDnpXJk=;
 b=TSOs0BGzK88ClJUSJMedo7SpcFG42AN/goY/XPf1L1euwOJ5BTuS2xlXZmqtvnXTAp
 uxAsfcmcL+JZ2JRAT/EU2UD0Ykq5FW+M7bywm48Lj9a682sr+rMFcdfipAvFwiPJOOcr
 bQeL1NfPNxwumFLbN0wGY2z17/qdPBhnR9N19WhMd0+YeM0n13K6/UGpo4Icbcz/7SxQ
 Uq2bexQtReXYTaXAPbHzKl7tskOHfgxwX/Cini74OH/AqM+kOytXJmD3rfWp6xH5cfMZ
 O0MN+PNUAs2fUc/B2CnMghUadrwXkzlcbM7Gw0nu9HLqMTJHbvQAG/4PKkIZjb9fmBmj
 35ow==
X-Gm-Message-State: AOJu0YwnUbOn/WKjDgOFBSX+vdKqCsMUWJuexPcZXVogjaMyad9fMiwk
 jgMNYcpBV5LC/fGX0etBEt4gEg==
X-Google-Smtp-Source: AGHT+IFobKEdN20qtppJzG8TCXzVIQ4fmQ2hZKkbD/f9l/zI2ykDbRkXuG4GeVNDpLJ3yFMy+MmLAA==
X-Received: by 2002:a17:906:768f:b0:99c:4ea0:ed18 with SMTP id
 o15-20020a170906768f00b0099c4ea0ed18mr4219514ejm.8.1692284382349; 
 Thu, 17 Aug 2023 07:59:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 07:59:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 17 Aug 2023 17:59:36 +0300
Message-Id: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] arm64: dts: qcom: qrb5165-rb5: enable DP
 support
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

Implement DisplayPort support for the Qualcomm RB5 platform.

Note: while testing this, I had link training issues with several
dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
or VGA connectors) work perfectly.

Dependencies: [1]
Soft-dependencies: [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20230816115151.501736-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230709034211.4045004-1-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20230817145516.5924-1-dmitry.baryshkov@linaro.org/

Changes since v1:
 - Rebased on v9 of Bryan's patchset
 - Dropped merged dt-bindings patch

Dmitry Baryshkov (4):
  arm64: dts: qcom: sm8250: Add DisplayPort device node
  arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
  arm64: dts: qcom: qrb5165-rb5: enable displayport controller
  arm64: dts: qcom: qrb5165-rb5: enable DP altmode

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 72 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 89 ++++++++++++++++++++++++
 2 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.39.2

