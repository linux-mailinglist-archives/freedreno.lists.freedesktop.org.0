Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D559CEBB
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD143113B87;
	Tue, 23 Aug 2022 02:44:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A145A05F9
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:43:59 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x15so11273471pfp.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=PynmO5Jk7dMLlFmc4BJabIpYsmxogYHpegMgoaOMSq4=;
 b=MabqGyxwHR/rSORTB7TeITLkNwTwRIAZ0fWVRA14qsIbhD91j0WkB+KTPJh+TjKtd2
 Kfa/Xj/wbblHUFxT3lmhHujC6EqGMMnjAQ3hmAZxYdBihPag2jQXaLyIJcrSAKvbZUEx
 3FHOEZdXgHO8p5RN4ENZM0QcmNDqOThrG57A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=PynmO5Jk7dMLlFmc4BJabIpYsmxogYHpegMgoaOMSq4=;
 b=sXeibgnwqO6UHaJaRrCpKB57fXbkhkZyycRBnk+CLbu6PViKUWvq5VBqLQief7iwod
 Ji54KbcG+Qf+OJ3taFXIahqamaQcjEhSCxrhaS403Hdcp2EohGPnaDNyAxZRCF5Hnt3q
 3sUX69dLRXkypl1x3xFZeacr6DCrzB0lZXLpyt1nSPKGJsKPxVBtd9EIqTW9EdrbXp8W
 fXjiJhYEJdViaX0zcIPyPE4ya1FRbz6Gk3vv9Ouv03pyAXuKxpnj1NxtoGOJKJslzBeS
 jgu+0U6h+nzd/cMdltoSwMBcfeQipGZ7UwlgOSq8lorbwX9oe8u5ZsJ7zjO51+PiVVF1
 92uQ==
X-Gm-Message-State: ACgBeo0UJYd8E76aMKqJnNmqsTJ8yRln1nczSLa2ZPVvQui7ry3CWIKb
 WloBPUBypeTcoGL/Qa140EMTLg==
X-Google-Smtp-Source: AA6agR72B2tpzoHRr2X1icCS5N1hJfZlnCktZgRksrhuGPX7UJF1L2xySUvV0LfAKMWPy7NvsdM88Q==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr8956523pff.44.1661222639316; 
 Mon, 22 Aug 2022 19:43:59 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:14dd:44db:a286:d093])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm9140538plh.286.2022.08.22.19.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 19:43:58 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Date: Mon, 22 Aug 2022 19:43:56 -0700
Message-Id: <20220823024356.783318-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Silence inconsistent indent warning
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, patches@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Build robots complain

 smatch warnings:
 drivers/gpu/drm/msm/dp/dp_link.c:969 dp_link_process_link_status_update() warn: inconsistent indenting

Fix it.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Fixes: ea530388e64b ("drm/msm/dp: skip checking LINK_STATUS_UPDATED bit")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 36f0af02749f..1620110806cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -965,8 +965,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
 	if (channel_eq_done && clock_recovery_done)
 		return -EINVAL;
 
-
-       return 0;
+	return 0;
 }
 
 /**

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
https://chromeos.dev

