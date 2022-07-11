Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5856D6EC
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 09:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A87B10F94A;
	Mon, 11 Jul 2022 07:37:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6201E10F94A
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 07:37:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a9so7274874lfk.11
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
 b=Dff5xnUEbOFZ3krvJAHSf8q7CaTXArvxJlXk7Ac3HyhbEKI17xLdj82jioSmMlm9XX
 w8xoFuxHIHww8BPcbVRuoufFdfD7jps2p++JmURLyPi1RgpsYP1134ZQtzPDG54fMTf3
 F3RFPAuoT7yNsfclITwxtA04nUvhNVGVOuNnyriKbPUKguqIsSo8f+Md3SdeZK0mCD+D
 YE0zvcu2gKRHS5D0uN5iuxn2KKusizBR+r6J/wse4C3eHFF4BhgPrH9HzXX9SIpTPLG/
 r9UznThMZO4cAIb+8C6NnAuScTYnFu9qyKprEU8MZ5/zUrDQtEzviVaN6i2y6TTC5f+2
 3bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
 b=nR9lKTN0T3moHznsgaSiUn1YSG4CVqKmFq4OqOEukNzemG9UWXSQ7bCy/XThvuWeOw
 WsE7KEN0aWYIfTvi4Sio2zXtJJ0bu5Wwf4EVNWU85CPFZqG3SnDcovoP6S1OMm4xQlXk
 p1aQM4vE3qQAElUAhZW/k/FomEEKjnJLaEjZY4+wzKjGg7Z8Zc2HwwJFBFaAmUfKW/Ns
 lTvVucIJqcWtRb29XA1WUCrbyMEC09LPlpzaJdu6TSGO1xJvj1vFCoPnIbcQnhNIvwV6
 jpAKLuc5xsHoy/vOc9rcYHljT7xF5y9CfPjQsOXYdCXwAUHb/O0r+nbiqnO7+Q2wQ/Kh
 9FYQ==
X-Gm-Message-State: AJIora+3GNXIyVnH4A6bH9S4Thb531iUSqlpd+Jm0sfSLghBMYA7VJqu
 lvZTcYBzVwD9iCWOOmjRfjezzA==
X-Google-Smtp-Source: AGRyM1tdY/eYp5/POtpprgNAZwPGA3AOCYoE4M26Kh7kOJYlFARkVpnWiqVOQjs7wCrImJPHpHs7bw==
X-Received: by 2002:ac2:4e13:0:b0:489:d699:5046 with SMTP id
 e19-20020ac24e13000000b00489d6995046mr4416536lfr.134.1657525054672; 
 Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Date: Mon, 11 Jul 2022 10:37:31 +0300
Message-Id: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 0/2] drm/bridge: ti-sn65dsi86: support
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

Changes since RFC v1:
 - Dropped first patch (conversion to atomic), corresponding patch has
   been already applied upstream
 - Added DRM_DEV_ERR_RATELIMITED to notifiy users/developers that
   corresponding connector was not found.

Dmitry Baryshkov (2):
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.35.1

