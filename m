Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289C6A2CBE
	for <lists+freedreno@lfdr.de>; Sun, 26 Feb 2023 01:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E883A10E647;
	Sun, 26 Feb 2023 00:15:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FD910E2AB
 for <freedreno@lists.freedesktop.org>; Sun, 26 Feb 2023 00:15:44 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k14so3957541lfj.7
 for <freedreno@lists.freedesktop.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
 b=DS7ZpMlF5Ik4nba/RbyZB23Lz0FBFYDvyY+eDE+gM9Rn/bn6cLnpb5qh8KqN6iOb/R
 lCTBiWgw9uqkAxAGbpaS1ZYRnFmqHvRJgWTq2z8yZb0xNTtnUmtzpggqknFySmSvI7iH
 YdyXmB2xhd3sMAvN2/RGief0ZnQwpHdRpc1Fp5ycRUJ1Wp0uDgHmczLeBdM6+U3CO9tt
 0Qo89Fkw63SSAcD08jf0brF7LjnhPdMV1O+exyOY90O5GVmVtn4XNVUPRBIDT4B7O43f
 MKijjws1ClnBHLeekq2VDNAcF6s7NfmGoocp5et0aA3ClgVNZQMsMP+kfMdczK6cVuir
 yvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
 b=IBM2aarF2Tu9vFNfQcdtTWB+aOWPdFUoDxqvN3HeV5OZXnChlq/NSKMoKhDcmv5njh
 3fajCwDoqw7KXffi7ZFm43Tdy42aTTLfoGrDASClzqJmagFQYfECO96D9R/AZbvDbbey
 xFP4ChCwetdYb4ywDoVcLwPg52BlNn/Wxpr3ieuVzPRCIl9TO0ufgxYSsB/v/KEBsTme
 Zil76sdtBkyvvrK8bGi5Q/7yYhc6J7kAc8hIRssrSxXE+1tCqyuTOz5fMTdyoMAtUZAt
 vCD6oYXag4h5yEEwPhwYFvBIm+RaCl+LOpil9yk/mhGPWHsCjm6e1B1KI4DXYa4I4OIK
 LLnQ==
X-Gm-Message-State: AO0yUKXcb0rhaGIuLJSbTHCS5wazOtq0h/WfzkNOTsJ+hHj1HZG66aUT
 Deh1QOBdefOnG1LV8P0wxndtuQ==
X-Google-Smtp-Source: AK7set84D+a6dBvLKpC3e3cAYiAOCQNOFFe3/gJzzZtj14ixvbmkoGmCwgs9JNq7d+ShRIqGblj0bg==
X-Received: by 2002:ac2:44d4:0:b0:4d8:8af4:3b2c with SMTP id
 d20-20020ac244d4000000b004d88af43b2cmr6410561lfm.68.1677370542439; 
 Sat, 25 Feb 2023 16:15:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 16:15:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 26 Feb 2023 02:15:39 +0200
Message-Id: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/msm: rework msm_parse_deps() and
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com

Changes since v1:
- Restored dumping of ring->id in trace_msm_gpu_submit (requested by Rob
  Clark)

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 201 ++++++++++++++-------------
 1 file changed, 108 insertions(+), 93 deletions(-)

-- 
2.39.1

