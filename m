Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86A379E43
	for <lists+freedreno@lfdr.de>; Tue, 11 May 2021 06:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922326E9AB;
	Tue, 11 May 2021 04:20:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D86E9AB
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 04:20:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n184so17841749oia.12
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 21:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
 b=zH6hgGNYjGqj2IMIUj5mNl+3TVZadxNEV50zVtX+0J6nuVggTisVFFsYuN3EHs4u0z
 21UOgf2M3zYl7eB7JIStzDf4Q8V3hoMWES4S3L9PLuG5S3cAiueFXZJFnwDe/ozFoQ2F
 ocqEPPY9E4EiMsLr3PESgaSifyp4zDW6DbkcqDwr1On0rlb/Rw/G4tpEj8DPilF8EUVc
 TVIxN42CAf5ndDM677Hb92pXr+3bHwG9xi6MRrRG/xwgjvxWdkGlrfZL8mklS7tRiZZV
 LctmGTxJ8w34HuduKQPjX/POXOUVnkWrAqdYNAlPtsMbBGzMnni7B+f969XFI79k7a+5
 5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sAnreHKyEqLrxBWePiwhRu930iTUs8+45ufhMRReXo=;
 b=odqB6kuwH0HG68Dc7G9LElpsbMvvy39CQXZXtCkI1G6P7ykmQP9D7PvRMhoBPIKcJS
 HmPm7XybGmw8DNUyutk/iOdzbjH1HPfolxywAK/C9W4weeb68ZeIHn2PLnPQNgLisCdc
 XgGWZuG4jRzcNHMXqljTHT3STY5hfIDBYX8maEYy2A82vMkeLQJAt3Saj8Ixu+ozJ2hV
 fLyz68Y50mLHMq4vikZ4ecy5E4ng8GlvnzTohqq8x1JcIy4N7J0SlEOt974b9bNyHttE
 C04XLqBnfppsdOW3f/i1rE6bcBnIJSB3fwvI47VLbv0Pjgj9REBHnVV9T5aHS/Ksdm4q
 jkRQ==
X-Gm-Message-State: AOAM530CLHdieTgh6XUR28XoBsDPozjvL7oSaTw+fzaiKcy/QrCgu9+5
 Drdye7udLf7qelO/R0H+BWXDSA==
X-Google-Smtp-Source: ABdhPJwojnmqufg0lJ4akmfDWkkObUb4HRQ0v8GMtG0dAG2Vf9ooU4W4IGX+N8IzuFQ1r8r8SyJnsQ==
X-Received: by 2002:aca:d8d5:: with SMTP id p204mr1967717oig.151.1620706852170; 
 Mon, 10 May 2021 21:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:20:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Date: Mon, 10 May 2021 23:20:39 -0500
Message-Id: <20210511042043.592802-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The first patch in the series is somewhat unrelated to the support, but
simplifies reasoning and debugging of timing related issues.

The second patch introduces support for dealing with different register block
layouts, which is used in the forth patch to describe the hardware blocks found
in the SC8180x eDP block.

The third patch configures the INTF_CONFIG register, which carries the
configuration for widebus handling. As with the DPU the bootloader enables
widebus and we need to disable it, or implement support for adjusting the
timing.

Bjorn Andersson (4):
  drm/msm/dp: Simplify the mvid/nvid calculation
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Initialize the INTF_CONFIG register
  drm/msm/dp: Add support for SC8180x eDP

 drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
 4 files changed, 53 insertions(+), 77 deletions(-)

-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
