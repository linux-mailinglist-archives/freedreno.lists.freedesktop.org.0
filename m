Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0D6B1FBD
	for <lists+freedreno@lfdr.de>; Thu,  9 Mar 2023 10:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0E10E7BD;
	Thu,  9 Mar 2023 09:19:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5A910E7BB
 for <freedreno@lists.freedesktop.org>; Thu,  9 Mar 2023 09:19:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso743502wmp.4
 for <freedreno@lists.freedesktop.org>; Thu, 09 Mar 2023 01:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678353543;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LusevUH+SRkUXslUQ5vOufYX7haQVeFO1OhyQy8vqF0=;
 b=DUttmBslMVfOiKE3J4udI8ShvJc34pEqiXtTgUE+SHjQgB3rKA9bN6BI2rrqqhoDMz
 IIMf18QHVfKBx8fBkg/lgBN3bDREoRnUm50vELswc4quXMnGO1zyyej2+vq7Mx2JsQvY
 iJZgE6wPaHjC3q+tN5sskwja4v9jbpglTcDFgZljeS7N9PRKW+Vy4saipk2D/IOOpoPh
 jw8T+50hIC2/kIIUscVIP3XjKeKl2dBnb55sz+VsXJ/k7qn5IBG4BKkLIVMlU3Yyv+v8
 Z9oScWlQkbXY8q5C7fPuE6OzmSsL8u7yH6uJNEZf4BJnD0e+oh67KSrSh2H0JTopj5+4
 oQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678353543;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LusevUH+SRkUXslUQ5vOufYX7haQVeFO1OhyQy8vqF0=;
 b=yD2GoVEvqrr/K9HoQSSpX1sIl8HO/IMa9z/xaQXusqJ/eI7tCwPtS3PeET4SnsHyHy
 BgTB8o50up6vHB7AofAHRIDTqFjtLl05K9xGGAw1SjHnMS3xU4aiUAztKlelQ6UAOEW+
 alogxYeSiww8iTEZ5orlu0J+Reb4iNJ8V1vpGXHihrTe2d/28q9U/TH+m6+vsT1vfWl7
 /rO02dKS+aKxNrWjFQDTOsBpAYan3stGM4VA4NxqVkQI6K5WPYxrHN6HjTZsF6op/wpW
 fQ4NTs5rMKDrfl3CeqP4uVNFPfu09BQl4gV93lYLaAGhZh4oSy4byDmM3OouYOGI+JU8
 zN4w==
X-Gm-Message-State: AO0yUKUnxqMYdQJatZYyD3DoHNu6PF3Zly+k2e9pr9bZasIPCnKqlZJ5
 PqHdbsUvlB4n+FjOA5cgYEIfag==
X-Google-Smtp-Source: AK7set+4o48cfbThwFEajvH+tETOf6lLG/fUBCI1TvKH5P1isYlgRMCZtRozAAq7XRjzRgLJf3CyXw==
X-Received: by 2002:a05:600c:4ecb:b0:3eb:3148:a1b7 with SMTP id
 g11-20020a05600c4ecb00b003eb3148a1b7mr18522092wmq.12.1678353543380; 
 Thu, 09 Mar 2023 01:19:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b003ebfc075eaasm2177066wmq.16.2023.03.09.01.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 01:19:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Mar 2023 10:18:59 +0100
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOkCWQC/53OsW7DMAwE0F8JNJcFTVmulan/UWSQLToWoEgG5
 RgpAv97lWxFp2a8G97dXRWWwEUdD3clvIUScqqhfTuocXbpzBB8zYqQNBJ2sOYljFAufWsQrkt
 Zhd0F/AJjTqvkGFmAEE3rBurRs6rS4ArDIC6Nc7XSNcZaLsJTuD2nv041z6GsWb6fT7bm0f5vd
 GsAYWp0a/oPYt/YzxiSk/ye5aweAxu9gFJFDVnviFB35i+qX0B1RTvd8WTZWqvpF7rv+w8/25A
 ulgEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH v4 0/5] arm64: dts: qcom: add DP Controller to
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
by the PMIC Glink infrastructure in discution at [1] & [2].

DT changes tying the DP controller to the USB-C port on the HDK
boards will be sent later.

Bindings dependencies merged into v6.3-rc1.

[1] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
[2] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Updated trailers
- Fixed patch 4 compatible and reg sizes
- Link to v3: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org

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
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230206-topic-sm8450-upstream-dp-controller-20054ab280de

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

