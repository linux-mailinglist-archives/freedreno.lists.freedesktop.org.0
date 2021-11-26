Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0345E467
	for <lists+freedreno@lfdr.de>; Fri, 26 Nov 2021 03:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBB96E43F;
	Fri, 26 Nov 2021 02:26:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898E6E43F
 for <freedreno@lists.freedesktop.org>; Fri, 26 Nov 2021 02:26:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id v15so15921531ljc.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 18:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQF2Q4CByYkmE+9PKH/2TGs700NnX/meUb70h19yGEw=;
 b=C2J0hJQpmmy8M6PjZ9Tyq50TwtTglJhSGIOrDUjhG1Qft6pkxIa505quo8iDNu+QQk
 jZ31N5V49AF52v1HS4pBLaP5XcPr5qoM1K8qEjYd5ed5+x+cBIFiJaIYxPxPoY37UGpk
 Hj6oWjPR+Zu2gUIN06d75FBpNCbahIwtRT9BBFza8KbHpXThRLsVEXRd45Zae/+1A8ru
 tW/LQ+2QKZNLuPlTW1cSG3Rjww5dlsmVOYvACRgQrsJ1GtKKpN9uZOp/5xr0loSSARzX
 xt8xIKmvtWezmr0xMT7udS+ALNtuo8OYjMymJ/avB11drUlQ+WdospJDSJnpyh8OrKe2
 QdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQF2Q4CByYkmE+9PKH/2TGs700NnX/meUb70h19yGEw=;
 b=YTmZhlva70ZM+C39MmST8oLYvY4GHJuE3623V3QsxzorBeN3UgkBt19MrxkFxhwmD6
 10cC5NZT2BS/gbE+8QYkYyKBnAyVyPrlYPq1ViFWo9RtGh7MwHRsFZanDfzhFQMUB2LM
 zc287TXNpV+hU3ceoxBh9mAcTuKAYsYo1zJ8cl3bCN7nVVBbl2HdzM96nkww9N08pW/k
 7NdNQVuXNOrdUOLfFukpgk3/QQ9us9gFTceWRsmumovBI12OqBMzwnbzwlDpkWOMVhzN
 raITg8zHd6+kW/U3RRGgZyNRqxiqe3uUb+75ltgL8CcgMqXgA4VEJotxiB0ulHomgJMw
 qwCw==
X-Gm-Message-State: AOAM530kvkdTm+JG/uVqj5dBha1rdOgIpyYWJr076N+t98iRDk8RoEbi
 jo7Mtw/OSBOQLxRQu77Qhbaf4ICeKxij8A==
X-Google-Smtp-Source: ABdhPJwRKHBvg4FtsXtNF85arqrAWVrg6oah6JGnIyZ5Sgl3niE4/VFYBKWJrWZp+CWaruu2sRaSBg==
X-Received: by 2002:a05:651c:324:: with SMTP id
 b4mr28123306ljp.188.1637893604814; 
 Thu, 25 Nov 2021 18:26:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 26 Nov 2021 05:26:39 +0300
Message-Id: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/3] drm/msm/dpu: simplify RM code
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at fix, drop the lm_max_width from the RM and fix the
indexing of VBIF in the dpu_kms.

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

The following changes since commit e4840d537c2c6b1189d4de16ee0f4820e069dcea:

  drm/msm: Do hw_init() before capturing GPU state (2021-11-22 10:45:55 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-rm-clean-3

for you to fetch changes up to 3ad9c16d1c1e010abe72ff943f8de25b64968789:

  drm/msm/dpu: drop unused lm_max_width from RM (2021-11-25 11:47:40 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: consistently index dpu_kms->hw_vbif
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: drop unused lm_max_width from RM

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  36 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  26 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 104 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   6 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   8 +-
 10 files changed, 32 insertions(+), 187 deletions(-)


