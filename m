Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB95E8C37
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 14:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3610E5F8;
	Sat, 24 Sep 2022 12:19:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2885310E602
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 12:19:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q17so2707630lji.11
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=MaDjvuC0T1gDpBZdhun71775TT8KE1KBiE1Ke5bcei0=;
 b=puESy4K8V67FVny/TjrFn4LNCygurVqlx7Z88YOG3DcajlZ1Lszxvj7Uu6WFZGat75
 gOugVJLQ3NBooviB0K6QVmabT7FiLHXvfoG+9h62FqhGY9GxRJsGDeBwn2mZ7x6sDxi1
 MyOw7HdrZkWoRWVAOsM6EGDv+Xck5CrYtY3WByrl3PQ8M3ZSKd12f/ok+m1KT+WyAMHi
 ObuFmIuwNIC8zDWN4LVCICN9omcE4Q0crG0AKI8ISX8qzPEwDaA8QI4Rojq3+XUNEMRJ
 qcvmcP22Y+Tp/BrEsZ8GZ8MLmH2JqPy8O6kHjRBpjev0x61/l+ZmZ7HCvuvjFZVL4YfC
 wlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=MaDjvuC0T1gDpBZdhun71775TT8KE1KBiE1Ke5bcei0=;
 b=3h3TJ9R0lhUJRm491Pj0TCgWLp8vBvdoyqydmp4HlDHz91AfDo6r3V8JAkPIXq+aC/
 UbitfmMYerLxFSoFKdFurYIeUwLqXAwTWZ840xEIe5hQLK0g7Fp4s0u6b1J0TmhjBWUT
 rbOFjvwt1rooEopW4XmyLFo0DwJbGdnyKUDqxNSBzlvJXBlaoOmRF/2zRTk3DKIkVF/g
 CtpWc7IWfqrvIElOVHKTyD/vz1jnFQ+hKjiiE4PKoezql8970cYcRXVOFUTIlASNZgEA
 KTpAKdNpOOspQETjPFbHbg6CAzmdioijqU5ZIAYCWEukoWsxiduhbV0pRDIB7gozSDme
 /cmA==
X-Gm-Message-State: ACrzQf3UYlMN0Nmiimmi4vrPmuENPyxveWYE8wxNcJJf/J0ZSIw3zNee
 4QebhI89tGhVk6BRJ0VR62XsGA==
X-Google-Smtp-Source: AMsMyM5kIedc2vSNfpdV2AwJCTNLYPUIAuFCAPKvrxjxi1VJPZakDOpQOr8MJzT2q6U8UAD3So+Q+Q==
X-Received: by 2002:a05:651c:198a:b0:26c:27a:c504 with SMTP id
 bx10-20020a05651c198a00b0026c027ac504mr4475685ljb.443.1664021941429; 
 Sat, 24 Sep 2022 05:19:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:19:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 15:18:58 +0300
Message-Id: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/2] drm/msm/dsi: Add support for DSI PHY on
 QCM2290
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

The QCM2290 platform uses 14nm DSI PHY. As the configuration is not
fully compatible with the main qcom,dsi-phy-14nm, a separate compatible
is added.

Changes since v2:
 - Changed compatible back to qcom,dsi-phy-14nm-2290

Changes since v1:
 - Rebased on top of msm-next, fixed DSI PHY config to follow upstream
   changes.
 - Changed compatible to follow agreed scheme
   ('qcom,qcm2290-dsi-phy-14nm').
 - Updated commit messages.

Loic Poulain (2):
  dt-bindings: display/msm: Add QCM2290 DSI phy
  drm/msm/dsi: Add phy configuration for QCM2290

 .../bindings/display/msm/dsi-phy-14nm.yaml      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 17 +++++++++++++++++
 4 files changed, 21 insertions(+)

-- 
2.35.1

