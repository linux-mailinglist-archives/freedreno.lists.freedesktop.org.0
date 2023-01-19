Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A16739E0
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597010E92A;
	Thu, 19 Jan 2023 13:22:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D28010E92A
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v10so2805878edi.8
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
 b=FTCVsOvKrMJzB7s2HyfaaX0VK0I4lqjddNgbgaeRdIaEeBYpc0zC9L96+kTMzE2PWF
 ELasBp8eHVFjaffdh2Rsh3uF/4xpsUTXTqr/o6jmPD9Ccr6lIncU6f7B9bM5cQcRq6Is
 gqPjfccgdjpEB/PHMplYqOGd21xht/eF6IoCmYCZhk1l/v6fCiE4qqYTlh9EcQiirHzZ
 JBbGvo7RPP2KcvfgJE+9JyJd2wGemrI+5ETHY+mBkeDoBVJw036xpxJv6SlnkjxJF/rW
 rMD4xknymB8h6iSCJBuirB8rNkCW4nW1Abir7DnpNQdGUdHtoSDGPlp3Uh/xJ1limrxr
 ljdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
 b=BpOZjcmF+aHDTTGzUeQaJ451IaJUtEF76nb3GVd+GhvamSFZNu0lH41FzhmQRe4deI
 XXAMSMgYcgvC28x15JdxxwtQOcJnOt1G6+5vqsOEo/iX/IYm3hy86f4KG7kEmhH/aWDu
 cKrG1/CmnYA6EemQSfpXlUK2g/Dv1QU6kqnrgI3Wc+suzFVEDHyeaEgZ4yCBhe10gH2q
 MYQGkv7IWchBWeUMp2mxJTKbQ8ODFFqfuZ57XmKh+FPBbeykkQm7vv582sSTdPgopOUA
 xLNC62K4+3H1Qe9TJzgby90hhg4eg6CREYF4Y3yjM/Ytnq0WnbmDXcXLQfTaY6xkOxku
 9NTg==
X-Gm-Message-State: AFqh2kqgopbipc0+9Fv1g0CHu08fvQ9s+RS59yKNi644H2c/vWz8ZcNm
 6Uv3Xqa8aKU/MsuN2FOHk6lDnQ==
X-Google-Smtp-Source: AMrXdXtxFXcYL86Q+ICy0lk69FgCFVTS6nVq4OzYff6WuL9NPpU43VaFJccJnYaa8jaxEVj0W2IjVA==
X-Received: by 2002:a05:6402:4d5:b0:49d:a60f:7827 with SMTP id
 n21-20020a05640204d500b0049da60f7827mr10775320edw.6.1674134541040; 
 Thu, 19 Jan 2023 05:22:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 19 Jan 2023 15:22:13 +0200
Message-Id: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI PHY
 with DT clocks infrastructure
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

Make msm8960's HDMI PHY accept clocks from DT and also register it as a
DT clock provider.

Dmitry Baryshkov (6):
  dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
  dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
  drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
  drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
  ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
  ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock

 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 27 ++++++++++++++++---
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 21 +++++++++------
 3 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.39.0

