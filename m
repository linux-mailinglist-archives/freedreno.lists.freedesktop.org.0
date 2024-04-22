Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C68AD750
	for <lists+freedreno@lfdr.de>; Tue, 23 Apr 2024 00:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054E8112DF5;
	Mon, 22 Apr 2024 22:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cOLG8IWF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC89112DF6
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 22:37:11 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5193363d255so6589984e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Apr 2024 15:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713825430; x=1714430230; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ohFmgglIcQlxE3MPNy1+YrogD02CaIJJKPILpDHEK2E=;
 b=cOLG8IWFfcdpGRkWrkPJHgUIEiaaEuvx+lDk6mza0YsuvBrdRuaX8mNextxumn1yB2
 Tl0TooNTwP+f2ZZBqvC/is3DEF5GDDjgNofCIRYPPgb1NZ8qoS+GfrBYH3sCkwbyg7Oc
 vHha4ic3Fw0U1y6WoRJB62LYBo2Bg1OIySsvWEFStgdxRdlL/2GrQSCIqG8xFZNQVOxl
 l1G5LWHiSyhk2OnHJxxBsJk2eCC5SHTcAsLdCIwNxEMbHFFTXLYBNkb8ynPpAFtwsqR4
 4Dq2vhI0x/sbtYpyyQx9+ViMMrratmOFkLDI3itz9679xQtRwlho+l0qYblvcGstJjiH
 F3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713825430; x=1714430230;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohFmgglIcQlxE3MPNy1+YrogD02CaIJJKPILpDHEK2E=;
 b=DCsfbFau4dAkQPAsX5ZAUTMTipPlvPR4OZuOwh+Izfp78Y+yC5CWtO0It7d08iElIm
 4yZb1Y59tNpfEI9D6TieAllOq9PJx93+5pvM5OAZg+RJNu+1zIhlJ6Mx5i/ivwo8nlPY
 2YONKnNbqU7PwMI6IqsTzU/Rmd8D2MYdS+pJg0kp0JQWu99VYFaGU47OkCn06M6uZo0a
 ZVArywaQ7Mw4ciwxJjwNvjRQOA/xsLL1Keh57Nie/7GMpEGhqIKfG/8lgYp3g2MFF84q
 JarLP2E4KsZ+cMM3ZEPRAK3lcT3qcbjAzL8KIQPpi0jhEc5jDjo47Vzs5+Vpie35ihCh
 ydkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN3Brn8TcHc5/bw52qEH5/BCSr/G6/roIu4SUbhD/Lmf2XCHukUSXkVDEXQu+28JAFkIGTwvMhxhwnXciaxjzgT6KgPRyjaB29dodfE8nl
X-Gm-Message-State: AOJu0Yw4mls3AwbuLmuC6tH4yRJh5o/x2j+wiYxlOd/u3wGcx3ITftOM
 UfBW4xDhtss15kfqFuwD+fau0VZ7pc+z6noYdxmxsyEkjwCkuc0gd6CGd/Awi0s=
X-Google-Smtp-Source: AGHT+IE3m5uOC+ZmUmnZKf0riA6458/IhT/zPbv8SmhhSaid1ucuuBTYN37T3Pzrf8uaJHQYmrV0OA==
X-Received: by 2002:a19:381a:0:b0:515:cfaf:737 with SMTP id
 f26-20020a19381a000000b00515cfaf0737mr6928150lfa.9.1713825429819; 
 Mon, 22 Apr 2024 15:37:09 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 r3-20020ac25f83000000b00513c4e41140sm1841271lfe.204.2024.04.22.15.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:37:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Remove more useless wrappers
Date: Tue, 23 Apr 2024 00:36:58 +0200
Message-Id: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvmJmYC/x3MWwqAIBBA0a3EfCfkA4q2EhFpUw3kA60Iwr0nf
 Z6Pe19IGAkT9NULEW9K5F0Brysw++w2ZLQUg2iEapSQ7PSBDLPJTubA2V2BaYmq1aZTnC9QuhB
 xped/DmPOH+Q0mQBjAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

Shaving off some cruft

obj files seem to be identical pre and post cleanup which is always
a good sign

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/dsi: Remove dsi_phy_read/write()
      drm/msm/dsi: Remove dsi_phy_write_[un]delay()

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   5 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 273 +++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 218 ++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 109 ++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 305 +++++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 205 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 320 ++++++++++++------------
 7 files changed, 699 insertions(+), 736 deletions(-)
---
base-commit: 33edc5592466996fe9610efc712da0a3539027ae
change-id: 20240423-topic-msm_cleanup-b3e47bc8411d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

