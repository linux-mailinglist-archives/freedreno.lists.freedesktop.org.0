Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365856D0CD
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 20:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D481A18A8DB;
	Sun, 10 Jul 2022 18:45:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6C918A8DB
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u13so5495699lfn.5
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w6H7AZgWHjuSnqSkX8Y5Hss8POYSqDNUbN9BjUh/yDM=;
 b=PL4jm3aHr8zv3Siu2NU0vyTZ9tXLSyocFJSVWzdqXUrieXJal8Ug+C6gobbwdWi+Pk
 z7PQbmHSJtYluNTxYqqf7UrwBkPBOIXrRMMekQr2G1idzUUVpzjr9MCziEN/ECo4qzvR
 dp10xxn6fTLaL+pwxMspEnyAVmyLygmfMq8U+NdssrfQTZbzgXOnNZ/BvyGTN/yf6ntP
 YlYKdczhHXIunwtFKOs9iSy9RkLREc6kVLIW21Ees1ESyaW3nanxjgvGeO6FIpUg8oTB
 Ry2uZeVD01iFVkvlICysqTcA1fhvTMBR5m2fMWBNVJ+3s73ghy+vgVP4PAHYI80b1vri
 megg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w6H7AZgWHjuSnqSkX8Y5Hss8POYSqDNUbN9BjUh/yDM=;
 b=agA1I3F0SVAxM/oPZYP8OETQdIxKRl942lMUAm1ebCuHn3NgmBWM0comt0G0ztvG4i
 P/IBi5iIaDUkx+EcRGBe/Z1ZivkrkcyOWkAzM0BScPPgMsIl5zoGxtNHeeAm8jGK7X3g
 wjRZYeBwY/+rtEAAlWrRP2dxUiReyiWQVydkH1JpL/X6PeK8JHblsE8AI1pP0YaGTU/D
 gdJX153kJ6vBX36LLSK2woOsjTg0Wkd9cEkmKDmFAmzlAeCQoKvZU60JuAsg3DgAEVqS
 V89n4nKv45Ep1x67ts7ITmpsDMMPOcE1znRteA0KETrWUOicRUxT1Tt4HMtsumZAjbht
 W4Dw==
X-Gm-Message-State: AJIora+kEfNTkxSNUVLYpX4iKcQkSXKwXvtaC62ykH5so1NdRvr4uc2/
 wq4VvpJ8noYRh/glRvU+Fe4XEA==
X-Google-Smtp-Source: AGRyM1vo2MPiyoFOAGF5g9FgIpCiw6LZZk+dlO6WMHVsPOY4WYNygn8jlVz98uqq43jvOuikyC+uEw==
X-Received: by 2002:a05:6512:2311:b0:488:b732:5ae7 with SMTP id
 o17-20020a056512231100b00488b7325ae7mr8967324lfu.40.1657478739101; 
 Sun, 10 Jul 2022 11:45:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Sun, 10 Jul 2022 21:45:33 +0300
Message-Id: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

An RFC (or rather RFT, Request-for-Testing) series adding support for
DRM_BRIDGE_ATTACH_NO_CONNECTOR. Note, it was compile-tested only.  This
bridge is the last one used on the Qualcomm platforms (in
upstream-supported devices) and thus it is the only bridge that prevents
us from removing support for bridge-created connectors from MSM DSI
code.

Dmitry Baryshkov (3):
  drm/bridge: ti-sn65dsi86: switch to atomic ops
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 55 +++++++++++++++------------
 1 file changed, 31 insertions(+), 24 deletions(-)

-- 
2.35.1

