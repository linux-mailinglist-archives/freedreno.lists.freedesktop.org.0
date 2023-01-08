Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB166613E0
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 08:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B5510E15E;
	Sun,  8 Jan 2023 07:26:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B67E10E15E
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bp15so8293094lfb.13
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
 b=Bg5O3r+rUSHFezSrSozin/g+crW+X/TQyfCS8A40HjPt7lpnrxoX27edLpOF93lGNY
 fzmkTeGYcGYG3LGUERYvsHaUhNUY9LmxvgF6fjH3nnT7cs49ckY9Y90BlO8gcjxs3FUg
 pso9ebNbyTNkxbY6gXhKTS+W4/DpOHHw3O6aZFDaqhQ7Zth4sR9YFkiZ4NDJpc9A6tWU
 7pWCVOl82ICIqEb4giqCuBCWutbirn5/y284x3EQDdYv85TkTopv52gexDzn3Av4kAXE
 Te4TNB6BblpL7cf2/2Qzw775R12UfcR5ygX92BFajXlmAiM5PJUnmz7EJx2BrKaxSYGG
 mRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
 b=x+KuQwhhpbP/5x/oxm4BUyfkjyf3CHifvZZ+eLLvVswO8YnlYBwqMpz1dHK19QOiFr
 T/+xUW/DblxJQIJZY/18HwoId7a/ZRmBlRfk071YXcPhmEiXX5t47JUhvEGOkDF4rkcZ
 YqdS5kEl6PkAgFh2iAqhnEWS1nBLhSs2Nf5HNYRIWFHnsXGJ008xoGb9macH0IeYvF33
 m77YZsCsN02hyuAd1kRkHO1FEA4d5Igao79PvZIcRtvTmN9UNtsGN2RYbhUyzwdqFBe3
 qCvxPSdpZErhV0S1SlA+Q2vtv7kUoSCc6Rn2ihZXT8EaoFqCxqiuljzVuaSrduxrOGWI
 vLuA==
X-Gm-Message-State: AFqh2ko1C6hnJ+3fO6Y9iEcGGIvcFHFNcJyzUmV3TiEvX+O0Bipt+9zA
 AZVoA5meJomRCw3tni8zcGJPWg==
X-Google-Smtp-Source: AMrXdXt1Eb0YDFNARb8Zg47TqsSCW9kfUXxzW6leI3UHZZ6Yx+SeFA+BkOCdFlLT/df186wTov8HtA==
X-Received: by 2002:a05:6512:74:b0:4ca:fe23:7677 with SMTP id
 i20-20020a056512007400b004cafe237677mr13119631lfo.43.1673162756615; 
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 09:25:43 +0200
Message-Id: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/12] drm/bridge: lt9611: several fixes and
 improvements
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A series of patches to fix mode programming for the Lontium lt9611
DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
platform).

Dmitry Baryshkov (12):
  drm/bridge: lt9611: fix sleep mode setup
  drm/bridge: lt9611: fix HPD reenablement
  drm/bridge: lt9611: fix polarity programming
  drm/bridge: lt9611: fix programming of video modes
  drm/bridge: lt9611: fix clock calculation
  drm/bridge: lt9611: pass a pointer to the of node
  drm/bridge: lt9611: rework the mode_set function
  drm/bridge: lt9611: attach to the next bridge
  drm/bridge: lt9611: fix sync polarity for DVI output
  drm/bridge: lt9611: simplify video timings programming
  drm/bridge: lt9611: rework infoframes handling
  drm/bridge: lt9611: stop filtering modes via the table

 drivers/gpu/drm/bridge/lontium-lt9611.c | 312 ++++++++++--------------
 1 file changed, 124 insertions(+), 188 deletions(-)

-- 
2.39.0

