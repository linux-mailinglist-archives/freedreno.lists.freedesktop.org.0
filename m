Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423554F57C
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 12:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4526711A99E;
	Fri, 17 Jun 2022 10:36:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3776D11A97C
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r24so4300901ljn.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HADbm2Q0iXz5TZbFf0x7dUMSunNE29kysn4VYUvxWAA=;
 b=SEamXvUPZtDClVb+it2ZQnT30PYuKodPn7A/WyVg6obnHTEkPDJ428TlByPbYDKaJc
 4rVdVijNvzxichCr3rxvv5wRQRAeDm4SX5/zz+PtvIRCHR9e39PamDppRJALnU/30JjL
 6q8fQXnUnzi6Uc+c4qGH2mCBIeGphmnL2Ic22c0M3rWbHDs1C4KGccUchgtfge90yokd
 nhF8CyJE2YOWaaSYTHaVz8YzGvV87pFqHKVQPvzoYfgEjbWXY8agLlWZaeYj4/nVwISh
 4t9ey8jeIaDv+dPkYWV3I4QN+pygEz/O5XEdbtIgawfTOmbMAi6KrTQdR2su+liBW+w3
 8bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HADbm2Q0iXz5TZbFf0x7dUMSunNE29kysn4VYUvxWAA=;
 b=MHBtUah7ghME1JWHQjWgUp2McKHalbnQaZyQlzI/nJhO9Piyv8V8/LHNGfQr1OGKqf
 1dLV3qZ00nLjk8KSbUXViYnQfOLt+UQaQMIhfO44MY7Iy6mHUZ3Cjd4nVbUnkGzHH0fq
 z6TsW1dGR4b50/bikzxPk8RbZ6/WhO5uNyYCtlLSQJoLj+XjwtHp2Yko1JhP8bLfUF+d
 5hhQCEUr/ebea3mI5ZECbU8xWbpwW2saq0OqQvKmagHdt3n0qll1/4q7jcchIkj0Lcvs
 f1pMrs+yzu86emuiG3UsvBPXxwAQV8JgI6YxtYmsBXfE18DDREidSvX5vB4FFLeDz849
 W75Q==
X-Gm-Message-State: AJIora8qgpRpVUe/4Pjwk5zRuGwmYxGXz7atwNTdJ+IURdxMxDFwP04Z
 ZjQGU1ef7ZcpUpey/biAlqO/MQ==
X-Google-Smtp-Source: AGRyM1vCISv5DGQKfk8IeXYWAss+EKIjGwI/FSSIK50PMS+dysHBeXd4oFs22JKiVbKZeCeXKkdg3A==
X-Received: by 2002:a2e:9cda:0:b0:255:6bfd:3bd with SMTP id
 g26-20020a2e9cda000000b002556bfd03bdmr4626470ljj.302.1655462170346; 
 Fri, 17 Jun 2022 03:36:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 13:36:05 +0300
Message-Id: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF
 clock provider
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
used by the MMCC. Add support for providing this clock to the OF
framework by registerding the clock provider and adding #clock-cells
property to the DT node.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells to the HDMI PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml           |  4 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi             |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c          | 15 ++++++++++-----
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.35.1

