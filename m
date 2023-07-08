Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A63474BD89
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 15:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006E689CF6;
	Sat,  8 Jul 2023 13:00:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEBF10E0E4
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 13:00:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso4437924e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jul 2023 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
 b=D8z4Ss4KTOKvdJHHxs3LqjidCtsB6+HtTuJuIzgV8NBiJwLUgm6u0JFUvzx+LrB34i
 LTfPf+gdDvzE+zMAE1ZBiEl9Ce4tqP7Zyl3sSKfxKw7eRrYPRoqt3tXLt9PFv2sv9m9j
 NYLezds2faxQeiSeBjSiUGMWBnaoYLuFnPDsDLvpX8j6tSJpVlTTquHcMkBen6XpbY9d
 F82xfUcpyJ/29YUgWsHI+PBZ5FdyhUOfu1obaiL+NyGccdklBBWbh+nau4Nh+UmNvFXa
 JkcQvFvmFm+Ne4KgqYUQPL8tmYkCcXFduCfqbJE0ONc83ZYGaxndNQqfegtGjIP05lVU
 GFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dm1KjGkHlrKrzQJ/qXePV964b6OsIyDARoNzyXVIDWI=;
 b=H/nkdEmiPhk4hVCZELTIzrKipTS0hN4FQB+ECTvdhKgZDL4s5LZ77NVoXzKjo/Y7iO
 Bdega79D7lS5iZXqebsjdr4Q9b1+tPSDu3nSSlH0GK6vRL8sdm05fkekZfxjASYGYpp2
 A5BhM65pjGkegsHgnij2SnVB7yoN2AXUMZk1Mhhc8IgMtaERbUxbhAjxbc3PPnNaSH1l
 lX0nN01LmQ55+fo9MtsfymoLqozHcQOzYURcPqrE7iJQJREsKX38vnzdT8jVojh/gY25
 EelIvh+VVIgozR2VQpFXCEHyACumbjkEpReJ6RiU9KBhdl4gXDIs0ETN8wdvxul6P9rc
 EOFw==
X-Gm-Message-State: ABy/qLbLQx1f5qf6IPcOo0U9TCu4HNKsg++/TQsAzdkWp2dJtF6Gg/Vj
 g88YyaUgx7M1vzPlP3DTbwFXAA==
X-Google-Smtp-Source: APBJJlEeCtPsw5E/78MiWAsmEFeLoaOHSx9CtDtK6CnIsNnvgWYFUmlLt/2Tz4EYpAhCKMSZysqirw==
X-Received: by 2002:ac2:498e:0:b0:4fa:a0c3:efa1 with SMTP id
 f14-20020ac2498e000000b004faa0c3efa1mr5492354lfl.7.1688821241765; 
 Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l10-20020a19c20a000000b004fb96436ac7sm1003839lfc.250.2023.07.08.06.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 06:00:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 16:00:39 +0300
Message-Id: <20230708130039.1596599-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
References: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
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
2.40.1

