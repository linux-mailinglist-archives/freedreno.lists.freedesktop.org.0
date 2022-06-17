Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4954FD58
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 21:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AA110E11D;
	Fri, 17 Jun 2022 19:14:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8356910E066
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 19:14:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a2so8295607lfg.5
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jb2LzNHs/uQixr8x1n5mvdFFvqrNyRBvkNqvNWM7FA0=;
 b=Gcf9ZBMjFlTkayZYLXWPIyF5eKelbU9iEv+nXXeSqiSo4y6up80jUzSFstdWyRPax+
 rqTE3TnZzX1HPx2OvZrB+gqZuZa55CsmdWjP9BQOGLQH0yuu8Gfip0PWtoH2cCjxCoSY
 M5M/P7EOzYs51h1UZofOa6utoSmXjmY9vaEVEmCW7X0GwMbFBcQZYZBz5iI0fjhPxnyz
 pOTme3AsB7eOiatzeHtRUgWe9fu8d83dYWodUq5nCzsp/aS0z41lkFDltDgdDvTtUgBs
 3hM1E95dNpReUe9jpvHeP7PC1LRcKtmkScTl12Mjg1SfNrWaXTEf3CixKHVn+/UY52mk
 rgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jb2LzNHs/uQixr8x1n5mvdFFvqrNyRBvkNqvNWM7FA0=;
 b=u5shJffhSce86TeGC922ZlD7z/cymtN649aHirrLOq6zBHBkYHd3N82FDR2WoIZim7
 NBYNi90TgovynDVH/uTY1MZ17gn0bzPDuGFMkcoXQ93flYl/MHIA3lWgMFgYzcRGi/vj
 oOSklJUjuyH1FsH2VmQlvKDGtK6MlkcoFAcx0dtZ2qqAfbHL6y0NbNY6c9OJWJs7hHei
 g9O4titSd/6agd8hjSmts71QNzOo2LQsZycmpYBsIFVcnKVGoVOsTixtmhTpBHBhduft
 9LheQyjScKCwtzDZR6srOBQCvpyHIBXQGDzeSZUUWUZTGW1cHmHID8Nbt7QrvZhYB2xW
 aQtw==
X-Gm-Message-State: AJIora96XNKBHOwRMX3L3ZyCLvZF5bsqOYa1cGH1Qgb+CdYjR84q+3ai
 PTZVlPPWiqPHeNmK8XvYrV6Kgw==
X-Google-Smtp-Source: AGRyM1sYkar+S/iJLtfnp1Gq2Pu7zvO8UZFuFUKb+8M0kB+OVn5hr5c0/oIWEg7OnMYmdiWMpk7j1g==
X-Received: by 2002:a05:6512:151d:b0:47d:de8d:f4bd with SMTP id
 bq29-20020a056512151d00b0047dde8df4bdmr6507816lfb.552.1655493270803; 
 Fri, 17 Jun 2022 12:14:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:14:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 22:14:26 +0300
Message-Id: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 0/3] drm/msm: convet to
 drm_crtc_handle_vblank()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patchseries replaces drm_handle_vblank() with
drm_crtc_handle_vblank(). As a bonus result of this conversion it is
possible to drop the stored array of allocated CRTCs and use the core
CRTC iterators.

Changes since v4:
 - Removed the duplicate word 'duplicate' from the last patch'es commit
   message (noticed by Abhinav).

Changes since v3:
 - In msm_drm_init simplify the code by using an interim var for the
   event thread itself rather than just the index (suggested by Abhinav)

Changes since v2;
 - none (sent by mistake)

Changes since v1;
 - fixed uninitialized var access (LTP Robot)

Dmitry Baryshkov (3):
  drm/msm/mdp4: convert to drm_crtc_handle_vblank()
  drm/msm/mdp5: convert to drm_crtc_handle_vblank()
  drm/msm: stop storing the array of CRTCs in struct msm_drm_private

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +-
 7 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.35.1

