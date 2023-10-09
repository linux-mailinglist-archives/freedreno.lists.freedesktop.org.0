Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE17BE792
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED810E297;
	Mon,  9 Oct 2023 17:18:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0FF10E28B
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:18:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso60856551fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871881; x=1697476681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zu2R71bsRjtY+DvwxAeRqhKMlPb8WHWJLqI/9lGlnIE=;
 b=gspGC0EMmHHCSTvxWJdOmFrBHQvDqI1JOGqcV5gZTqejPVrJlti6PkUVDGyutx8jtI
 24a4uHLVTCqpWzVr+QwWvskjAGSoEjKz20WXgBo7rUBpSENOaXZ31C4bTBDEgDOGbVMJ
 PlGL+qWN2au6yfCZk+EHoVWRiYzTjOwuUybAE3tSSmupdo5DFeV+qz4RmyJOnisEvKD5
 MIh/WVw3wt/3Vv2dWmYSG/FRCQwYn5n+SS8EbWy4zHddF+y+C2Wgye2mNEPhiZRe7cMK
 feZbgUyeSFJdUHe/rrdRD7BIB6yn39yBp6+rzZChTUW8nwZdxvKIP8+Tfu0RQnUNfwwd
 7nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871881; x=1697476681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zu2R71bsRjtY+DvwxAeRqhKMlPb8WHWJLqI/9lGlnIE=;
 b=LFZummKto4Fp+4XHHngr4i8lW61q0eKsIVWd1vK/bSOMJY611gSdxXd7Pi2bT5sfZG
 RQscMIzlCpWKTrT8xarEXcJpf0CLDYoHycMNAtSDMGvEPpIv7EuErTPb4emZnY6PllGp
 EpNh67TMxsU/AlU6fnUMwKIK7c6ex4h6FE1aO4rKnr1LLB0Bhniettkz/4vbR1lJmyUR
 7XRNTg5AnaxjhrCrGyiSqRzBGtnvNw3wlH8/63uGFjTBTRommsm7a5zzhUX3hNOBm11c
 aKx7bIp3PCdt7En682i5lm70jWBBH4b+5rypmy/NkqCsLDkEoIdFLhkVj3u4y856Be6h
 R3zQ==
X-Gm-Message-State: AOJu0YwqHLwcrI/UCxuj0FKCgzv509QlCpnM/5/VPWJz8CSKWOXn6yxB
 81PRVJTuAp6jYnPoTyyR+0dk//4WOLtwWwZDbSwUEw==
X-Google-Smtp-Source: AGHT+IHkjsfGPBI0OFfLwOC0eYNMzLTLpB/vFXBlsxYKK6GxOHao9KedFpYz+W9ES7FNvr2C0Y6ctA==
X-Received: by 2002:a2e:7c15:0:b0:2bc:b884:c9be with SMTP id
 x21-20020a2e7c15000000b002bcb884c9bemr15098772ljc.30.1696871880986; 
 Mon, 09 Oct 2023 10:18:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:18:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:17:56 +0300
Message-Id: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH 0/4] drm/msm/dpu: enable writeback on the
 other platforms
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

I was not able to test it on my own, this is a call for testing for the
owners of these platforms. The git version of modetest now fully
supports writeback.

Compile libdrm/modetest from git version, run modetest -ac to determine
the writeback connector, cat /sys/kernel/debug/dri/0/state to determine
spare CRTC and plane, then run something like:

modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768

where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.

Then press Enter and check the test.d file for the raw image dump.

Dependencies: https://patchwork.freedesktop.org/series/124832/

Dmitry Baryshkov (4):
  drm/msm/dpu: enable writeback on SM8150
  drm/msm/dpu: enable writeback on SC8108X
  drm/msm/dpu: enable writeback on SM6125
  drm/msm/dpu: enable writeback on SM6350

 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.39.2

