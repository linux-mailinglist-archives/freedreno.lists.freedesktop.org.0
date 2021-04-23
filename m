Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45936984C
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 19:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7C96EC25;
	Fri, 23 Apr 2021 17:28:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7896EC25
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 17:28:10 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id s4so9129503qtw.3
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
 b=LRP8c9RoAsA+Ug0WokdedrbQa2U05MvwsRm0dqesAWlibw2QdTtvxcvQdUdPS4/R7k
 Dzzgk/NVhLr39A0/Y+c0E1oIpASUsgWoW44wkizulOIUdGTXJf1TxYOcaOZaGjLiltw5
 RprsqwrB6ufVd6lQbc1PR4I1cP30CgXdaD1SMVUeTa+CWeuN8MVkcryjdYdsMhZSfvcW
 q/bEEWQp8ROwYU7YLpQPR3/29AuViizc0bR4USvz2GkjG5ENkcpzr+g9mFWjncMMjEdn
 cQ8BfK2rAUfr0wNUuQ6115cBIxw5mz2WlRL2LJkboEdvmPFdQjhkkvWM8XnePAToLPEi
 TZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
 b=B2Dt8oskStN2PZvF5Pi0m5xsq6s5rDL2PTpe6kywzxLci+Zs9ZRacnzvPBLTgOPeZb
 8vyemQTBuZoiaYdrmfBEIrgG8AxJdTPDnsBWWW1z1R/JmN2Bi0EOttsc4tu/QKA/Nbci
 c1AaqNyNNccPvH8eBRTiBGATNZWh5Kky7hovuKoWE8p2G/pTIQ0AAwCuT0LmuvN6NPUG
 ZkPwbML6pWdS+KpZ/CNL4g8qNtPBgeRXThLGiyHOfOSTl7jNHQspzPj+uI7oSYHK5M1h
 ob4ehQoQvrz1aGTFwdYyIOElz+XwIR60pkbchEfvYoq35jmmbUyDs51uGYEkU1YwLT1v
 bOtg==
X-Gm-Message-State: AOAM532RxxAgeBCkPwBdxA2STggqWFMwKQUVY9/xx+NNMMFcnVj5oFuL
 203aP6ZPJ+TsAh7HOhP3l85d6J9JJbvO7fP9sgc=
X-Google-Smtp-Source: ABdhPJxdsCxGFuhVZIOZpCiAsDpeoN9/VhBAMMWbtJ2u0oxLiMSQyFyiBW+kjeIGADoDSII06RkhTw==
X-Received: by 2002:ac8:4d43:: with SMTP id x3mr4954636qtv.326.1619198889461; 
 Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y23sm4782627qkb.47.2021.04.23.10.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 13:24:38 -0400
Message-Id: <20210423172450.4885-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/2] drm/msm/dsi: support CPHY mode for 7nm
 pll/phy
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the required changes to support 7nm pll/phy in CPHY mode.

This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
the CPHY mode.

v2:
 - rebased on DSI PHY reworks
 - reworked getting cphy_mode in dsi_host.c
 - documentation change in separate patch

Jonathan Marek (2):
  drm/msm/dsi: support CPHY mode for 7nm pll/phy
  dt-bindings: display: msm/dsi: add qcom,dsi-phy-cphy-mode option

 .../devicetree/bindings/display/msm/dsi.txt   |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  47 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 147 ++++++++++++------
 6 files changed, 186 insertions(+), 48 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
