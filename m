Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DC619733
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8B210E753;
	Fri,  4 Nov 2022 13:14:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2678210E74D
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:14:02 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c25so6281176ljr.8
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
 b=HLaOKFbepOY9VJ3gr1x5NgM/GwvMIHKqUMbknWaeU3h2qGxlJLt4QUvVBnFlRUmY6F
 eNBmATDZ/hDVpS6avJnga+LSbezCUtgOCqQbnBNs2KAMYEiZZB8wm70NXehTJCJWxZzD
 asBbK5cWoixW9xnsJFj3bPbkMUMy3wxxwX4RuQEQ8hgBxit15xHe4O6SRu+xGsse1JhK
 ClJDNO/g2eK3pW3m0WQUYvzdvA1voKqcKCmniH99HmIGzanotBREFZ0HZ9usdyzDKRbX
 pBI/EepxckCd1p3TjMICEAiQtmiaRAN7Q9wrUXvVPwUPaBJOO8tMgosrkPsh1OMYFNbz
 PZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkNU3+fp0nhaCwixTYlRHoDEFAnLM2EV/3w7IT8vNw4=;
 b=lmMu4ky1eLsWvA4FV47Yd6B/JqAX9XTVAK9fc9ZJLBRXWyCERTS8Bn5Eqm0EmZd8hV
 npWz8UKUh89TgD8LPj0XrP+9it25hbzcm+qFrjp1Zdt3h7qUry5JX59UoLOcr1AdaGZ3
 9uD7X+kSCaCbyRe2UMxamQt+0ANozr2FK8yTQ0/K23zHrluLTEGXQIjlFybTmHOiGMpQ
 ajqVYuc++OifXQiHqzPkAHm+eLcXuT0FnUnZr+9BTIBHSIOOMjRjmZ+QApGiGYxhpg1w
 V4p13QuCa4Xc56FYlWUbx/G1e0O3oVWXsxnjKMRHOTlRuvo32fjf3VDj94sm6TnG7c+A
 zaiw==
X-Gm-Message-State: ACrzQf0SxoEkq7XktmiYXwe2kugaEXWEDiGRbSjDPTComITdY79SDTKq
 FKLPuR+SJGfBctMAICJrsaDxig==
X-Google-Smtp-Source: AMsMyM6L5kv9idmr6tL6VMZge4A6ccABD2Rf6Tdjxzvbt7trM4M0KMRdHYubn2IjK29mSFCyyDuuHw==
X-Received: by 2002:a05:651c:14f:b0:277:3f46:a034 with SMTP id
 c15-20020a05651c014f00b002773f46a034mr12664086ljd.529.1667567640496; 
 Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a19911b000000b004a95d5098f2sm457050lfd.226.2022.11.04.06.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:14:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:13:53 +0300
Message-Id: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/5] arm64: dts: qcom: sm8450-hdk: enable
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
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 124 ++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 304 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 417 insertions(+), 12 deletions(-)

-- 
2.35.1

