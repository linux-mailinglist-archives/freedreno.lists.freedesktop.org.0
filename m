Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1687A007
	for <lists+freedreno@lfdr.de>; Wed, 13 Mar 2024 01:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E445610F3E5;
	Wed, 13 Mar 2024 00:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nhBftxKP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99AA10F459
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 00:13:57 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ddcec424a6so187385ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710288837; x=1710893637;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=roioUGnaxY6AvjIUwtL2u9LanxRAGecYCXou90dLIu4=;
 b=nhBftxKP14Px4+BBEzBU+o8Zrme3AgMdTg+fYFNe3HRdZebJpC4ooZopU/JVdovw2T
 OVpnduMtKczBidQ6SFc8QFX4zHPQ18GEGZ8hu5Y/kqkDXtuvdUM8QPyH2kUXFphLhmxH
 RNILB7/kCRl2FwB8c8ndv+mvjF4e5lxCsJw9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710288837; x=1710893637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=roioUGnaxY6AvjIUwtL2u9LanxRAGecYCXou90dLIu4=;
 b=C8xzHazP0tWw+/SeQs+F5yOP6nHCxEk//Yp/FMnv2pzwuX6tKsek68QFDvwWrsEe7h
 9juKYFo48b+hWsDwP6WuBHRn1cPIt5+RjUZmJPCTBPvaO+ShCb7eCEhCfx8BsaoqBG9G
 whkKjPCopt0qB/88fXnogSKkJ99uXtEQTiGXbdtz1YLgouqmtv3Vbw/pf+2vbTR6zV2R
 vC8LbOwpgHv6IOrhTImmvvwFcSo++8X8Ezr8xJ/QIoECzMz0JRczjQktjKtra+/VJWKm
 Vm0el9vwOhXqXk1lCD6QRGBfISbm3TDzZb1ocwOEOZa5jQhlMtUXODIhyzktDtRDDQk5
 8GAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDcqBMSY6gNjcEevy9qsJ5azVDtX+WAxYZ/+Yuwcx9O7XXRUZDVBDDBi3tGyBT2DTb+6MljeCWPWSZIMte0mJOk9lUjV2s4am4c+ERfBsD
X-Gm-Message-State: AOJu0YwG3k1yUOFjMyFFYkIgspJVAegRIjYNi+x5eE9iVjAbgUwglZuE
 SEEwHmO2ydg7qzBtagik4dIkquIoszpywrtLStyGfLdO4aVS3OMREo10oOZI7Q==
X-Google-Smtp-Source: AGHT+IG58PN3ouLt4+V6o22EJ3ezJVOTQSf28+tSjOkyWRU31OXa8iIFliZtabjLxDQCMZq9cqjRsA==
X-Received: by 2002:a17:902:c947:b0:1dd:8daf:99b2 with SMTP id
 i7-20020a170902c94700b001dd8daf99b2mr9535150pla.13.1710288837058; 
 Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f8dd:895c:e876:6edb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 17:13:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/msm/dp: Improve DP AUX transfer vs. HPD interactions
Date: Tue, 12 Mar 2024 17:13:15 -0700
Message-ID: <20240313001345.2623074-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


The main goal of this patch series is to avoid problems running
"fwupd" on Qualcomm devices. Right now several of the plugins used
with fwupd try talking over all DP AUX busses and this results in a
very long timeout on Qualcomm devices.

As part of fixing this, I noticed a case where the MSM DP code wasn't
respecing the timeout properly when asked to wait for HPD. I also
noticed that, now that we've implemented wait_hpd_asserted(), we no
longer need the long hardcoded timeout / special cse for eDP in the
AUX transfer function.

NOTE: I no longer have any hardware setup that uses this driver for
eDP so I've only tested the DP case. The eDP changes are
straightforward so hopefully there are no problems there.


Douglas Anderson (3):
  drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
  drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
  drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer

 drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++-------------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 ++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 +++-
 3 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

