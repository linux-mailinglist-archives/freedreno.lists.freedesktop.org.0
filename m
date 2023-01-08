Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36C6616E1
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 17:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417EA10E05E;
	Sun,  8 Jan 2023 16:57:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8633410E05E
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 16:56:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j17so9544175lfr.3
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
 b=uYauKdgwq2husrEqlbthANQI+mK+yFDi8k3sa0byDLOOm+6NyM/tTVNf0gooCDRvHh
 TreprhmfQ6gm1B340FRGqx4ILphCrkz+5EeRV4ds91FpVi+31sN6Zi+COdCxf+U/6k5C
 2QUn6q5Y5+f7phN5GgGVAj2AHxJu/kepcl3lDu7/jmXMK20+vpUqaN6ITOz+vyA6f/xW
 GIAyIECVGh2FA6NqaiOB0I+NQSDktLdnks6obnsGLQLVx0QLkTv73+CNPnzmN+BNWlY4
 g7jBtiXgDA17+YtIntY+3KWaoT/MnV+T3nLGi7RzMCm0VOH3zLYyotu+qAST257Nobdv
 x7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+gZSEXgo3d9wOINWDK6xDs3+kicBr/DPouYqs1r8x0=;
 b=6OPXDoo/p9/2dGm9fNNgfYVVjv9SoTsEbQAWJ6ElO4EUJNvpW7FEoR4sMveSJRO/X1
 FCo4LeLC9iie0PqHZuufddFuAzKc4bcth4YKTBy3XgmjFU3nxdOLmARuqN0r4te2JGYO
 d8FWPay0yg886sW0RkW8L8R6IcU3VHEuKIyS0QxVzkH66m/4C2iyuEVLPCkvobokYLGL
 Dg0g5Jv9akL/8wLi3Xk8yrEozTLTti1Dmr38rZytwPxMDLJOJH7R/xd/1jsz891hBWpE
 u7sDSRhM6kKsIeXrJRXzU2q5Ul8nXj1ZURSpDgMqQ5NnO1NQBqoAJ2rHoD3Q/xjFcY1K
 9How==
X-Gm-Message-State: AFqh2ko82fzim5nSO/o+cEiwksgYGjNlaapWr8yKiMh28mEAupOBQ1I1
 5GBb/6AZdITb5KbtWQfDagS+LQ==
X-Google-Smtp-Source: AMrXdXtmsgU+7bRE7IrRO3c8IZ4YXWbGiOa2nHIZQcjxsFyGPcOy9ExkJhV3ACmWtJvJnAMZ07mZQw==
X-Received: by 2002:ac2:5088:0:b0:4b5:688e:ee10 with SMTP id
 f8-20020ac25088000000b004b5688eee10mr18367932lfm.16.1673197017690; 
 Sun, 08 Jan 2023 08:56:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:56:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Date: Sun,  8 Jan 2023 18:56:43 +0200
Message-Id: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 00/13] drm/bridge: lt9611: several fixes and
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

 drivers/gpu/drm/bridge/lontium-lt9611.c | 332 ++++++++++--------------
 1 file changed, 133 insertions(+), 199 deletions(-)

-- 
2.39.0

