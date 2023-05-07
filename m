Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41156F9B44
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 22:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036F710E028;
	Sun,  7 May 2023 20:12:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDE910E028
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 20:12:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac7f53ae44so42076461fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683490339; x=1686082339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/6AzpdlSyT2u/DnJHcJ/Uua4yjnwn+cYMZI+Ho5YM0=;
 b=IMDFGq2wAGGD8tAQ4XxBVTRUqSkb+NVXsrdR5L3Jgb7FfzWMx1m0DUnOcXdsxTCa4S
 RSYCSadzQmSeqFpH8+2Kntv/R0Q8lTtWm4205FATqc5it3p/kxmw3QrnW8q53qpEE2ei
 0/NaZlRMhtwTzOc0sb25l9Xya7XXB4IKdK1peX5qCUsXGfAYbuQ3YnmcQfylNZLPVNsl
 9tro+mDgcx8GRRSzuzeYro2dalipORjhlqxs1W38RYOC9D8Mv2b6k+iFeunC5qBg5ziX
 MD2sFUfGzOn2IxaIbDK02osz67D94bgZ6Z6S5wenFNfRwsX0NNCeCnnP+LyT3yODMG62
 bmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683490339; x=1686082339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/6AzpdlSyT2u/DnJHcJ/Uua4yjnwn+cYMZI+Ho5YM0=;
 b=hsPJTC5Q6J2jXjecsRaYFDmnbE5OQ+/IzCJ9ztdRX0LpCskew8fAkbc5ENUSx9M4tf
 m/hzoFGjvC2cFAps0ds0HY3gEkYhtB0FuB6aonKSDJZDzSsKdEwsz0y5yt2D/E595Pfm
 N5HoaHgPeHMrfpo/fY+GTKnoQTp0svnSAUelbYGndYm6CV7bKQ3tEzQtTqJWZq79v7GH
 nGLoWpIkwznqtgsfGa/emet3Eyg7Kfdwh6R1tjSCS1aT0XXqo6ZUPujfHP3p2v2W+T15
 jEG+eDfF6syW5ihgMrBBVRwIg4Jg5zs5Wqbkft6d31l3g/Lge+Dk3M9/j6warQyD1Q4q
 wGFA==
X-Gm-Message-State: AC+VfDyKAFcOudMDnSa3sKaAg4UhrqLQTH8oPQhblzQNCyMrll1u6gJl
 T5JxSmiHh32RJ8+LJUxXsw2ZLQ==
X-Google-Smtp-Source: ACHHUZ4/hD931uwZc8408LWyMq2qyx8mNfsSRodp6QnULqL8JaYg54nQGXh+xSV3tnWvfjuaICEEmQ==
X-Received: by 2002:a2e:9990:0:b0:2a8:c32d:1238 with SMTP id
 w16-20020a2e9990000000b002a8c32d1238mr2356176lji.15.1683490339563; 
 Sun, 07 May 2023 13:12:19 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f5-20020a2e3805000000b002ac74f5f022sm916522lja.0.2023.05.07.13.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  7 May 2023 23:12:15 +0300
Message-Id: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/bridge: display-connector: add external
 supply support
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some devices the 5V pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. The dp-connector
for such usecases provides dp-pwr supply support. Follow this example
and make hdmi-connector support the hdmi-pwr supply.

Dmitry Baryshkov (3):
  dt-bindings: display: hdmi-connector: add hdmi-pwr supply
  drm/bridge: display-connector: rename dp_pwr to connector_pwr
  drm/bridge: display-connector: handle hdmi-pwr supply

 .../display/connector/hdmi-connector.yaml     |  3 ++
 drivers/gpu/drm/bridge/display-connector.c    | 51 +++++++++++++------
 2 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.39.2

