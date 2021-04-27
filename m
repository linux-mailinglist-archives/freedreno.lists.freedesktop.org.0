Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A8F36BC87
	for <lists+freedreno@lfdr.de>; Tue, 27 Apr 2021 02:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CF6E1BB;
	Tue, 27 Apr 2021 00:18:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C606E185
 for <freedreno@lists.freedesktop.org>; Tue, 27 Apr 2021 00:18:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id n138so91118695lfa.3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Apr 2021 17:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pyVIHOwP3C4yhDRD5vW+wL3hfJcT2qqyYEtguOUdLeo=;
 b=HEUzG7cLWHPmyhXWxkjwKsUmD2Y553flJc5Cl+8XnD/j0pFMe1gHrk7w5KiivdXpfY
 4QWMwTfHLofC0tl5PiCAz5j7N3agfqRqmF8bZ4pUZ8VexOL23JEITw/jM0Ie1kaTHV5j
 /cHNt3lqcNDy45mQRbO3oS4aCepXWp6/psJBMTrnYbpaaujwmPz/YK4PjWBMfaAX4nE/
 YaDkBh6IQYGimhq6EQWWflBjvcM0X6xV8j1kedrLGiPwnhMIuhMLctqRtOnKG6AHqmLp
 66EDeJXASJ+Nei71WwhI5Q0OyTXK4QxqwQ2ZrFKWmpxZPtntMu6f7J2zhx/ItsqF1kdT
 I5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pyVIHOwP3C4yhDRD5vW+wL3hfJcT2qqyYEtguOUdLeo=;
 b=FztxJt+axdNytJ8W/ABo3Ey+Zee6SJ31ROP2Lapywg0GywDbQXOe6tU4a07gKlzzLz
 CW1k2d2i/JdrXPiwTQMg+6hcXDrLZHAbkBHpfuIV3h4JzuYuNvSRQSfTCTSb2s5GQ5Ni
 zB4wMG8IAgE+NDtQashxbj3unr6fQLnqqzb20qiVOXL9L7VO67TkS2hLkohpDgvjj0+k
 +/W+fdzg1Sn2bJerlri8yoUbG8u5NhxMmDpCZ0ZeWL5D6wGb2ofxOXvwXo7z1gNeu+bb
 q9cFEe+HINmkaa1dhcnDzGQUu7X6HjiLRPJyR/JuwcTyxtESjgD3C7b4KdDd1M/SX95Z
 HXpQ==
X-Gm-Message-State: AOAM5304YUscGQHn2s3m9LSWHsr3hdy5uPiEHe1mWJ9erzrBPU6jFpm7
 YWTJoWrqV7ht1BF/GB3kyvHb2Q==
X-Google-Smtp-Source: ABdhPJwXwV9rUWZAKxG3qI1LphsTXd/PBKChmF56CmO/pfco0kRq8n7VYwUiuoorB8VYTGzOnm3K1Q==
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1944907lfy.117.1619482710265; 
 Mon, 26 Apr 2021 17:18:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d15sm1555100lfn.7.2021.04.26.17.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 17:18:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 27 Apr 2021 03:18:24 +0300
Message-Id: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/4] drm/msm: improve register snapshotting
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rework MSM coredump support: add DSI PHY registers, simplify
snapshotting code.

Changes since v1:
 - Readd mutex serializing register snapshot calls

 - Add DSI PHY register dumping support

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct
      drm/msm: get rid of msm_iomap_size
      drm/msm/dsi: add DSI PHY registers to snapshot data

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 90 +++++++----------------
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
 drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |  5 +-
 drivers/gpu/drm/msm/dsi/dsi.h                     |  5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                | 11 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c             | 31 +++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h             |  4 +
 drivers/gpu/drm/msm/msm_drv.c                     | 27 +++----
 drivers/gpu/drm/msm/msm_drv.h                     |  6 +-
 drivers/gpu/drm/msm/msm_kms.h                     |  8 +-
 13 files changed, 97 insertions(+), 142 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
