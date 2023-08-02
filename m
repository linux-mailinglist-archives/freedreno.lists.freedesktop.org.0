Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911076D6EE
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 20:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6F10E56A;
	Wed,  2 Aug 2023 18:37:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371DE10E566
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 18:37:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so1836391fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691001418; x=1691606218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtnOSZ3n2/CymjBqeJkQ4cRZMCsGC/V1KtdFyH5+HU4=;
 b=HTHt+GQw19CduXQ997U6O6LHXJ0/5ydlTWhAhTfMCTlYn8UnXqmkuvVbBECJ9Laqsi
 hoX3S9N6rAfx3YvsKvSbt/CrJBJSIJBGE9BkH1lJHPT4l23P3A2TfiNTvE8Y13FFbDjJ
 r1uIjVZFEHPvpdRBDDXtp63vsW41AclSz0sLyG0u1jpcHvnqzz9Q9wSKAnKu8HMbxlQt
 NZdjAD2cI/EPL1tBylho/14ohGt+bTfzbKfqoNUZ9cTVk9N1MmCIMy1R/B4ug0+p++b7
 H+D3dXei+diDwKjhL0DjID4dlqxbFSSlmeM78ZLPUajz/odI5xz1JIW7oRWq4OuPHLDw
 8v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691001418; x=1691606218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtnOSZ3n2/CymjBqeJkQ4cRZMCsGC/V1KtdFyH5+HU4=;
 b=Pzg6NlFmbd3jP/scv0LptEcCT/7sHIizu7MoTSEhedaTnv04eDBaODyLWhYuYBt6ND
 Muzp+fwD3W6fX9DVrdbb1ruAB1mp+GzNGeITB4xy7YVF2/xEA89ifEloe9kRVZMeB1dl
 cq4wrDZdW+ojK7iEDwuM9n7Oensa4TWOtVXb4aiAOTyXG+i6GG5pOIfFalihua2+t5pL
 MNxCY+pY3tk3py9PVALWiB3jo7/HQLT1kIKfmMtkDvOtujtet56pgPYRQFEcIJFsx/rv
 HM6F9noz5KMZYisO1rRi+bgnc3P6b6j4BNe3Y8SQsJ0c/X+E/z2hMA7WpvIN96hdN0qB
 aj0w==
X-Gm-Message-State: ABy/qLbT2bpmuYGDtQWEO4Eh597eJMUI0/d8EZXjKZ1nhyX8VJqEC7Nx
 Zd/NX1Pk1AJHKQTdDW03SaKIjA==
X-Google-Smtp-Source: APBJJlEO9/nyUU2Mk3sSMr7Vvaf2bfj3p1EarkZ97421u+6v1iwV9IAMGoD65g4ZUgZFVJmxj6miyA==
X-Received: by 2002:a2e:9bc3:0:b0:2b6:fa60:85a1 with SMTP id
 w3-20020a2e9bc3000000b002b6fa6085a1mr5960940ljj.21.1691001417728; 
 Wed, 02 Aug 2023 11:36:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a2e3a05000000b002b94b355527sm3682821lja.32.2023.08.02.11.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 11:36:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed,  2 Aug 2023 21:36:55 +0300
Message-Id: <20230802183655.4188640-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock
 length
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

Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
0x100, while the actual length is 0x9c (last register having offset 0x98).
Reduce subblock length to remove the empty register space from being
dumped.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Rebased on top of the catalog changes

---

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..f1bac5e88249 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -456,12 +456,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
+	.enc = {.name = "enc", .base = 0x100, .len = 0x9c},
 	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
+	.enc = {.name = "enc", .base = 0x200, .len = 0x9c},
 	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
 };
 
-- 
2.39.2

