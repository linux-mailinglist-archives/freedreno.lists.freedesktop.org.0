Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E15500CE
	for <lists+freedreno@lfdr.de>; Sat, 18 Jun 2022 01:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B3E10F6FC;
	Fri, 17 Jun 2022 23:33:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7B10F813
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 23:33:32 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t25so9018083lfg.7
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CaP5bgS0QD73xPUoM1uM1kXmd5Vk1wJNrJjpQLUJ/28=;
 b=pjZKStGo7TD50nyBf0aDQm+TLMAtaE8Z982ngVCmsp7x02CTDkRb5uUswFYGoCB2+I
 ggD5aNuf2pxgFZj5GMD3r9wXwnpoOP2E01nuX2az5tN4rBnz+c1DRxr+Vjgg0E5Vzxf9
 YjqEN2wJyYqTBdBJ2JYVEBk7tt+SG4nMRy6jcTDY65n6UPZEZlnrIKFBUnL6LFjamajn
 Kk+ZCFFBSVSM1ijq6tgRSLEd1eQT1eRWwberNJ/CIKdoBx8hqMP+e+9I1oc7U369+TJ4
 +5yxrmVxydPuKkopdyGKNZd++DF44xWGqyNSs7jg6SnCdKcAHThHvyv92C3TYpRFlv1v
 qGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CaP5bgS0QD73xPUoM1uM1kXmd5Vk1wJNrJjpQLUJ/28=;
 b=ZEhIHyr/mGHEbjtOwQK4x/jIqZzArI7qPC3Ks71NjYP8SzNpEIhk92gJ7S6xqbnbtR
 7301opjDcWVGkVgPfg4OMdbp+S78a0ZnT7KpJhScbYpi5kqtPZMWt2aiksfpRO0c/Aq2
 p1Oy2NbjJpVZWhPtjhJEdNmGHOoE6xBK7LKF0iMJ4h6Vca0vohzGfcxunZftpkJuwCkH
 OEi6g7hoj95+8Vkz7+GDEeXlDmYeWm5Lw1uOK0H5Xdsv1fM36G/dZjIfxNmujgxqDOE4
 ynbDIqSm3Cv3pBC1SRVwWrRax+knyJNqqzsCZvcMKtbh/IuFgxHxUTLSdhshQRmv/fyo
 hE6Q==
X-Gm-Message-State: AJIora/VuK612n6/Rnm8L85qxWOwBB8dnQiIibP+znYrdJju3V3mD1gy
 9EB1EFJYybOj/eLEX6WU8bAuPA==
X-Google-Smtp-Source: AGRyM1vUSRm12vj+FNKm2kl9iMOQcTSrqSSXRfdeNAZWPdv7BC2b+s2spIDjm3d0YYYfv7ys131gzQ==
X-Received: by 2002:ac2:5150:0:b0:479:119d:5ba6 with SMTP id
 q16-20020ac25150000000b00479119d5ba6mr6863644lfd.507.1655508810773; 
 Fri, 17 Jun 2022 16:33:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:33:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Jun 2022 02:33:24 +0300
Message-Id: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 0/4] drm/msm: convet to
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

Changes since v5:
 - Clean up the event_thread->worker in case of an error to fix possible
   oops in msm_drm_uninit().

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


Dmitry Baryshkov (4):
  drm/msm: clean event_thread->worker in case of an error
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

