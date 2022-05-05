Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF651C146
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 15:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DC610E21B;
	Thu,  5 May 2022 13:50:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995510E1F9
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 13:50:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w19so7574370lfu.11
 for <freedreno@lists.freedesktop.org>; Thu, 05 May 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
 b=jYpTjc8C+5n8SykUBLJlcX5f4/GaOP6cofNjPFSWocIRskcsTJBKXn3aPUWYfj9ejM
 U0o0tNYhzJ24OB1Rfdisw6FWA/OiwTIjo1pVJyKqKIgw5KQ8503scj/bwx+0FoLZAsSU
 f8C2J/BFIz122GP0+cSOtixDfiIBQWM/5TqmXVTk6v8iv1477Lu1Ovh1EmQKvz8QQ4fA
 61mA+ykZrb+zZbseVcAbtUao6oxksh6pLzGGal+wb06aDuN7MPMuIS5aefWz3fIID0a7
 n+Lrr/z3RNnpg9plBf7SPpW/oQHW0y+Jp2HB0m8U7GDhig/z9d/z9j6TL3o+urvX28Pd
 rvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
 b=Cx9QC3+NlT/WAnNe2OPDfskrufdes/LdL2H9nDRjRB4/Q8wtXhB9GDbhhcL6PnJhNK
 nQT6TNwza8yqNn5AYZUGdIVCQ29L0coKs38rOOiKVcvixoCWbP6p42UQY7/QvT9ooR/i
 g3k1vAKVXWDhiS9X2+0pLre+9ELo/v41vyBf2xCSDGiRJ/NhUC2JAENl+DMwnK545SG+
 nYWQLhcku0+4VjJv+EpLLD35OOPcuh7+vdrAo6csOceQWqFDZavIXU5RHfAf0kRlJPuZ
 /nPGXb6rX7lR6l2L02qYl8cNcyBXGR1uY3irNSNzn9wIWUXIvZoreG1eQjubBF3I13Sg
 7szg==
X-Gm-Message-State: AOAM531nHCkS4pvAXu57dn5/VpQXiCpA4Lzjhf+dQlo4bjQO7ePNeCEB
 I/Q95gnb7Eowi4m/sprq2r3lcw==
X-Google-Smtp-Source: ABdhPJxk+A+USoTrmmhDNbDbzaJg/sCHtmKZabpJS2NcPJFPHS1t7xOecFr/5FjS9oNdhmox/ahsPA==
X-Received: by 2002:a05:6512:158c:b0:473:9d87:aa23 with SMTP id
 bp12-20020a056512158c00b004739d87aa23mr12785524lfb.409.1651758609431; 
 Thu, 05 May 2022 06:50:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  5 May 2022 16:50:06 +0300
Message-Id: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm/mpd4: get rid of struct
 mdp4_platform_config
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

The struct mdp4_platform_config is a remnant from pre-DT times. It
serves no particular purpose nowadays. So let's get rid of it.

Dmitry Baryshkov (2):
  drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
  drm/msm/mdp4: get rid of struct mdp4_platform_config

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 29 ++++++++----------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  6 -----
 2 files changed, 10 insertions(+), 25 deletions(-)

-- 
2.35.1

