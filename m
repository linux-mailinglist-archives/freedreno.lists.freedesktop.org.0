Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126D6715F2
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 09:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF9010E10D;
	Wed, 18 Jan 2023 08:17:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5E10E055
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so23774422ejb.9
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HMFaJxYFrlXy63MEZ5DsEVe05+seYph43YbtRI0Er4w=;
 b=SmFOaIy/EpLz5Po+uXnkgrdziaaCZxSYa5aJg1Rfopp3v1+LSgRp9UP9FfnC1dQ4pi
 NNoHMnIKwpHOt19zxn6hTz85BGJ5IKrUp7yaccDpkj5SzAYgszjnaEh15m8G2xijVKkI
 tRidxBzlG8FHeIARu+G/H+3dK2sS3WrHa+HCgm5NdHA3jvRtDiextR1a7pNHwOM2Gcpu
 eXDit7z6f5VGkqL1snX/KGALxWwYyQIJlI+pw5Eg9ld2w8fwHhhHSO7VdJjBl1n+xP2p
 W4btXefY5G2ZBXOWtKxnerjDWopVerd71CrCtkC/LjQAE6VdEW176hqoVywaV60/klZb
 l55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HMFaJxYFrlXy63MEZ5DsEVe05+seYph43YbtRI0Er4w=;
 b=fo9iSUEzlBhuNIDrbpoL7knsAzV13oFTc0NkwDmKPyOkibey3n8BBrtWy5ulxhvGNe
 sy4JRN2Jow83x+5g+/n1Lv8HBkJl+FFhQsWvOvUH4/T0qDffKx+UdZV8G2wMbha53w3i
 VtOGhfXto/EL9sxRzGej6ogHdKztkEthVcYnGkE8FqWL0dVj51jJ95WYHOrAp+BjTrG4
 +dJoQnBxvI2yPnZxV7khFZn3IOIPbihvbNzvQKB3+Jsxu24qB23CsAooumtlAvqQUTGa
 YuADeMzrWui5bNNubBB0CDZYOxDcVr4V8HJ4yDUe/fD2I5gb0Xz9e1BrMLbZp+Y15I3P
 o1OA==
X-Gm-Message-State: AFqh2kpmXqhoNheI3UUCPL38pHessfddD0r+/CoI4MANTZerwlvM8ihU
 HMGRz4c58L3eVXIrbfb437R9ww==
X-Google-Smtp-Source: AMrXdXtuOSpDdMnApkPXT0SbSO1kQRU8kHKvM5oSqybXqyROEZhIyMZldgDeDRs7kZZCyr7dX965+g==
X-Received: by 2002:a17:906:3b01:b0:84d:4767:734 with SMTP id
 g1-20020a1709063b0100b0084d47670734mr19766732ejf.6.1674029820369; 
 Wed, 18 Jan 2023 00:17:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:16:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Wed, 18 Jan 2023 10:16:45 +0200
Message-Id: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/13] drm/bridge: lt9611: several fixes and
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

Changes since v2:
 - Rewrote mode_valid callback to be more explicit.

Changes since v1:
 - Fixed the double-DSI check to look for the lt9611->dsi1_node rather
   than lt9611->dsi1, modesetting happens before lt9611->dsi1 is set.

 - Added full dual-DSI support, properly enabling the 4k modes on RB3.

Dmitry Baryshkov (13):
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
  drm/bridge: lt9611: properly program the dual host mode

 drivers/gpu/drm/bridge/lontium-lt9611.c | 340 ++++++++++--------------
 1 file changed, 141 insertions(+), 199 deletions(-)

-- 
2.39.0

