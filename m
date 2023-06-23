Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858873AE62
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 03:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EAC10E5D0;
	Fri, 23 Jun 2023 01:37:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182610E5CC
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 01:37:35 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso12969e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 18:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687484253; x=1690076253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4BYdFvvxG+q/HmC6ELTHeulur76vgi4GiOcatnZ7Ts=;
 b=rVMZDIFizYvJqXw8bslYCOuxhjcqXMKNc5rip2nyUCYNrjKtzirS/TPsveCjySQeNP
 x9Hf2LRweSdpMQcpOUZ2cXgXaIYUQCSrNZrf8/Iah0x4jpd2akzxBdx2xLa0LjsKq8O/
 tcfld64UhpyMR13jOW2ccgV0T2VPAmoeCrqkarrUOFMs6iwYT76dBR/4WOXuSUy9JQ+z
 o8w/YeNwDdT5gFoo4OHFlCVu5i+ApDlDNO3Taqii6Hml+vdsTV6IXuwGuMRRZ7Ejvg2L
 9B9kqesJY7PONVtXQ7D+Ur7B6T47VRH8BZa2qeVhglIi1FgUs/e6ZdwP3ucuVpRUUvJ0
 LrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687484253; x=1690076253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q4BYdFvvxG+q/HmC6ELTHeulur76vgi4GiOcatnZ7Ts=;
 b=fjDx7dhMB5EExycD5kHhhiAX6QG/ve9QG1KPfGwV/j0UFOh0gihrDBlSlneev3V7nm
 wD1qc5WL1KBRC2OeTGkNjNBprcImXgHc7sEztPeC5WCUD3w6w2M8V9oQSR5D0FqA5KYZ
 KXrKUImDCrKLZ24wTjm90RZ1vxDi10TdGd19RFIDaYJ3T0DaOdEK82jjAA0165uRO9gJ
 g9Pvnu8PXUdS3G9zkuwg4TKsvXXc7DtzM1+l5xmSI9qKOtkpIy5QSJpulktFeR/pFpAd
 QwoULG1CEink4ioT4+V1f3NjVq5CvnYO8BIa0HsvMehxwv4PNtT166Gm8taioE5BMI14
 moSw==
X-Gm-Message-State: AC+VfDx0VO5inS6iqyHVYP7xa8GiK3G+rLoiv4cT8YGmsO0d0HthOSBS
 FhLQ/z3Rq5P4BcIwwxfMdrLSTQ==
X-Google-Smtp-Source: ACHHUZ6GhFGf2rw6svgbgnjA1AT61SNYoOgZFET7N1jwrRjd6LzVJaVPzMjq77aEfIvAw5/YkTKUow==
X-Received: by 2002:a19:ab12:0:b0:4f8:6aec:1a7b with SMTP id
 u18-20020a19ab12000000b004f86aec1a7bmr8327312lfe.67.1687484253354; 
 Thu, 22 Jun 2023 18:37:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b004f252003071sm1290984lfn.37.2023.06.22.18.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 18:37:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 23 Jun 2023 04:37:31 +0300
Message-Id: <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..dd2f89ada043 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -517,12 +517,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.base = 0x100, .len = 0x100},
+	.enc = {.base = 0x100, .len = 0x9c},
 	.ctl = {.base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.base = 0x200, .len = 0x100},
+	.enc = {.base = 0x200, .len = 0x9c},
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-- 
2.39.2

