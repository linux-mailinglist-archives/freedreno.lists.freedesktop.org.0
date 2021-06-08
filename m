Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64293A0439
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 21:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486616EAAE;
	Tue,  8 Jun 2021 19:55:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21596E5B6
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 19:55:32 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id i68so17874798qke.3
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
 b=tl6qBfeR1ctMdKOjD5T7yqHao2tzBYPwBZ6V7bhuPFKO/eH0NCRXEHAZNCBXm21vh6
 y+Jo6Lh2RnmrDGBcqsjKAkzFJkxr7aCjm19n/+UXJWae4U8zd3GMNLBODNvdGNIICjan
 Wk01zjyEh80E5jQGbtt4eSMWfBMj5BCcLPr4/vsqVc0SFWUjvYYTR9eqwatQ4qyUsDYL
 sxqIeBRVaLxnIVC4Ae/NGANFJ25uT7q1kEcFs/0s6XMesfA4z/g4NGVZz7hBQ3g+TxFz
 vHekfmbcapwt4zasp8IASP5xmqq0xOkziXoyPB9saT/TMxZVUKM94a6nnAJqepFv06za
 AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
 b=nN4O7ht1TiWiDvnhqfZsKENqkddev3+7zkimcCE3U+woS96ySZiLTC0xNDnCuzDBgY
 NTGIXhhKcsvU+b20qtzgqNQD1iFdj1yN/wpbUzOdvji1Gh1CuoTbs6rQn6H8VyILZG6L
 k4Uu3cgEYqHJBFGoZfvFo9Cm//7fYbrjn4j94GPSZDUqcoH+FNg5RV0nt98z9rI+oiHY
 l4afg/YaBXPhkLKf+H4WfBqLjZuPpIo9ytPJtSOHFpWNmD0a7kEKNfMytuv2wK0BN+qA
 YdfMEdk4kqJ55RFpWo8TuVPXtX63v1OqjFA/dqXCe3N0D5FjwzfJc/ACnwEF0tsw6r9I
 j1ZQ==
X-Gm-Message-State: AOAM533XBJQbHRFvcfTyHPeRCo7XTXWy+BFkFdeVwbGy5oJmoo/rmV1I
 HxYqz7b3tZG3PBs21tpm89GK3vvumBNvrCnYr4U7DA==
X-Google-Smtp-Source: ABdhPJxCiMcEk4rEfSFxoc9MLYPAFpeFQHE1XQnjKYvFYU9dDovhkcdD8gGzWd5X3y+DjjX9qqPZtw==
X-Received: by 2002:a37:d58:: with SMTP id 85mr20317382qkn.414.1623182131919; 
 Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  8 Jun 2021 15:53:26 -0400
Message-Id: <20210608195342.18269-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/3] drm/msm/dsi: support CPHY mode for 7nm
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
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Swapnil Jakhade <sjakhade@cadence.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

v3:
 - yaml bindings
 - changed binding to "phy-mode = <PHY_TYPE_DSI_CPHY>;"

Jonathan Marek (3):
  dt-bindings: msm: dsi: add missing 7nm bindings
  dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
  drm/msm/dsi: support CPHY mode for 7nm pll/phy

 .../bindings/display/msm/dsi-phy-7nm.yaml     |  70 +++++++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  49 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 145 ++++++++++++------
 include/dt-bindings/phy/phy.h                 |   2 +
 7 files changed, 258 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
