Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852A58845C
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 00:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF97C97FE1;
	Tue,  2 Aug 2022 22:38:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764997F64
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id pm17so9322722pjb.3
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=C3C5nhfQMbZqyCX3pFoZEMov0enNRmYhg5gtHn4KJoo=;
 b=cgMuOxAGBnNnnsU1dMszkwZT6TDSBT1fyFTdTVXMp2WP69HDOP1+cbISIj/PAeFz2i
 JogPs8AQCAxc2Q472v1t/GJdHZWFjvd9sztQ8rjaVBY9zf5Uf3I49l3Q4B2vA38XNP9X
 wu7IYCegUfcCE3/pe55Ws1bKq7nK9FaTPwpfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=C3C5nhfQMbZqyCX3pFoZEMov0enNRmYhg5gtHn4KJoo=;
 b=CYGX+u9key5meyZU4kpD7IzjDQXOt6s5V8gJchEZL6PJNxSoiLfg5AsB6A9jGeqMGw
 S+TKd/w9zVSyU6739fjUL7oGd2zT5goH26WNMeh8576vQB2i7inxwR4a+eDm3ewoIsyJ
 A1gChmByu/+FvcKOC6jlZhYFnfZCPF+bhufhtMjQKVSzoS+wRmZ0mTgth87Zg8iQ3oNE
 Ms/KCRdEH1Mzh9nW8qekJfMbKjZXUzUZ702THbdL8JfNUuJBfSLnQYj0wpHy6eiGSxmE
 tRn5167MMuJ1m21KdekppvqMQOEachQVTFuW0avr/H2LNGh6LjXu3S/DsbXxsl6UmNTF
 SsDw==
X-Gm-Message-State: ACgBeo1mL3cMBp/wvnLEoQpiCJRZvNMX/JTzkLA/SwLX5qEtDn1vlZle
 seRzGHvLYaC1FA1Rn0JfWyxIvw==
X-Google-Smtp-Source: AA6agR65Pfd53RYkwBBMhSNB0UqWVSHBPJcuyEW6ghwHZJfmcz4Htfy5fvPk4k8HgU+GaWPwvafpmw==
X-Received: by 2002:a17:902:8508:b0:16c:46ff:53cb with SMTP id
 bj8-20020a170902850800b0016c46ff53cbmr23246764plb.168.1659479868034; 
 Tue, 02 Aug 2022 15:37:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue,  2 Aug 2022 15:37:32 -0700
Message-Id: <20220802223738.898592-1-dianders@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/6] drm/msm/dsi regulator improvements
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Archit Taneja <architt@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Sireesh Kodali <sireeshkodali1@gmail.com>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The main goal of this series is to make a small dent in cleaning up
the way we deal with regulator loads for DSI drivers.

As of v3 of this series, the regulator API improvements needed for the
later patches in the series are merged into mainline. Thus this series
only contains the DSI changes now.

I'd expect:
* The first two patches are bugfixes found while converting the DSI
  driver over. Those could land any time.
* The third patch ("drm/msm/dsi: Don't set a load before disabling a
  regulator") is a patch a sent the other day verbatim, included in
  this series because it's highly related. It could land any
  time.
* The next two patches use the new APIs. Since those APIs are now in
  mainline those could also land any time.
* The last patch is just cleanup I noticed as I was touching the
  function. It's not really related to regulators but it applies atop
  these. In theory it could be rebased to land separately.

Changes in v3:
- ("Improve dsi_phy_driver_probe() probe error handling") new for v3.
- Do all the PHYs too.
- Fix typo in commit message.
- Get rid of error print after devm_regulator_bulk_get_const().
- Just directly call the bulk commands; get rid of the wrapper.
- Update commit message to point at the git hash of the regulator change.

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
- ("Take advantage of devm_regulator_bulk_get_const") new for v2.
- ("Use the new regulator bulk feature to specify the load") new for v2.

Douglas Anderson (6):
  drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
  drm/msm/dsi: Fix number of regulators for SDM660
  drm/msm/dsi: Don't set a load before disabling a regulator
  drm/msm/dsi: Use the new regulator bulk feature to specify the load
  drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
  drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling

 drivers/gpu/drm/msm/dsi/dsi.h                 |  13 --
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  96 ++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 160 ++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
 12 files changed, 197 insertions(+), 390 deletions(-)

-- 
2.37.1.455.g008518b4e5-goog

