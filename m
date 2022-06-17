Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2B54FC8A
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 19:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D4C10E437;
	Fri, 17 Jun 2022 17:55:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E61F10E3BB
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so8009062lfb.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
 b=MWAeruo9ft6VGDTpDJ/JYrC6pGzRDc06xBNkpVSKI1EHGYPeenIj1OxUfEASEvbGuu
 eqjhBrY3gLhlG/c/IzLBPBes3QLEaw6c6oSsBOQLN9W9fL+42W6WCidt6jDvUOCUzLpe
 S5jdY1e4UMcKCcxOo9G6mVTmpcTmWsxvp8F7vD1VQUyvAP4EYzMkpnfKG4o9OewcGBnD
 1sHHX4VgpZwDLNsKJ/IHpToP8pxxMwn2X2jcf1JVFBU247/6KtFpzL415t9awtKm3dLL
 tUpwmDQeiyezaCDsKOIPzHbYPBXbiTTz7jCqyck4BpUksdiD+7FzN69P1L4X6oCDJEx6
 FN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
 b=dsoXqcq6XLxyqqlSXSG3QZ9TEFzqM2QH8MOjJIRY86gxssTeHff9uWjUoxXdWrpzzJ
 bUg3mAZc3ozCfVskGl8RxTb2WbywnPr4T/xpPv5hBlAFPV1kIrs78YfIcUq+0+CVormo
 OnZ6EKkSDBXRD3WmeXfsoCkyL3oZ3kOkMXft34wLga8SK9wZFjEBAmS5n8MFY3BgHmIl
 fMTN02z/8I8J6f7fiGIrh2zkGuoI5AThBTsHy9XfM6okxPhLvPGNPDppChiqmIfVvkXF
 j0Je2jqg2QcXumTlfxHyf0iN2wHBXMNWD3OrNTF4lpyy3YGRjyipE8p7ZaMZfRkGBlP+
 h2IA==
X-Gm-Message-State: AJIora8/kFmSBQo6idaxV/tcZZfPRqgWfDrV4raY7rhfps9q+sJC8g0O
 5ToTFQcG4lbfOjNGK9vtacPk7w==
X-Google-Smtp-Source: AGRyM1vyrP7oq5/XG1m7rG9FImaNjM1DFc5qB2YeMbfXK3KMAkluqm7X0+FD8e/4eiZ/wJG3wSccWA==
X-Received: by 2002:a05:6512:702:b0:479:3bb1:8992 with SMTP id
 b2-20020a056512070200b004793bb18992mr6150820lfs.361.1655488539469; 
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 20:55:35 +0300
Message-Id: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/3] drm/msm: convet to
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

