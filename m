Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B06CCF1E
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 02:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B7F10E345;
	Wed, 29 Mar 2023 00:55:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8610E044
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 00:55:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a21so7255321ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680051332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wspEvGhw3Ov/MaCptFOSLj1uP8AL5mjsZccbIYoFgs0=;
 b=qccSE5gDPyXWQOFV9gcvApZCxxiV5PsgFUrXDDldrH9yUic0hXBWom2Nrksb/ElU/O
 mTcNAQuRvcMhT3kfhyzFGb7WKrc3h2sbb0b46+HPWilPrM2kDsL0ZCx67YNcuwQPizkW
 v5MJxSkOrcf+EoI7HmXccn4vMfv6zbZu/yICCEoAtCtNGbMbhCW3gXcqAsHgSuMrI3Ae
 Rn5ouRGyQPOhczXKlht4vEEMspMjzNp72HgKC/JVgqYbZwiKXnTfQebbAeQePzRR2p0W
 YDpL83KibbT/IiflDxguDxNAjk/hoq1+pY2KPinIJS5rUTnlVeNPeNSMeGGAIEYnHOO4
 UYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680051332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wspEvGhw3Ov/MaCptFOSLj1uP8AL5mjsZccbIYoFgs0=;
 b=tyPZQGwUxqyjc7BagIS2sfQD4w/uGLalc+xDDKhzqCvQdYX2v85h3sprQJCspMlyM5
 IH7Z4GBHjdnqJh9XuxmfUoPGx9pmkn4kq2LirTB1c7DoJH93JNBPGCigyfb6Ob4Mklef
 SNJnEbHxjZ+QMAFTIprT1NL3p8NWWwp/FfZQipD8MongS9tgRcjPagks5rf6OMpXIJv+
 V6dQnVNLhV3ShDKjf4S/hULVS0eZwXCpVXbU8U7gq7LIu8vcn6hoEMGwnWAEA6VLn9FJ
 Jaon/PDonhywHRD0INnV9vAPwBy1RlT2wNJebS6dqlepFpFBvxg9prK84JOEFcn7mIKk
 ZSNg==
X-Gm-Message-State: AAQBX9erQYGTkzBvflCBEpaL86ylCbfzwb3WtnUYIBUyhH6log4v4V/p
 +rhvVqYUVkM+/FaicGsaPFdTYQ==
X-Google-Smtp-Source: AKy350azZ/8o/Tfo8luMhUstYP4ruMWmp+d9Nn0NFdeIy1LT1RDnDdV1l+BtCvu6KKGWHWJfb+4V7g==
X-Received: by 2002:a05:651c:22e:b0:299:ac68:4806 with SMTP id
 z14-20020a05651c022e00b00299ac684806mr5371715ljn.9.1680051331751; 
 Tue, 28 Mar 2023 17:55:31 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2e9804000000b002a03f9ffecesm3007181ljj.89.2023.03.28.17.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 17:55:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 29 Mar 2023 03:55:28 +0300
Message-Id: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/2] drm/msm: rework msm_parse_deps() and
 msm_parse_post_deps()
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

Depenencies: [1], [2]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com
[2] https://patchwork.freedesktop.org/patch/524090/?series=114362&rev=1

Changes since v2:
- Rebased on top of [2], which is a nice cleanup

Changes since v1:
- Restored dumping of ring->id in trace_msm_gpu_submit (requested by Rob
  Clark)

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 191 +++++++++++++++------------
 1 file changed, 103 insertions(+), 88 deletions(-)

-- 
2.39.2

