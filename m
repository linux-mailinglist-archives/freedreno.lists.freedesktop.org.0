Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF54ECFA6
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 00:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3A610EB5E;
	Wed, 30 Mar 2022 22:30:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BAF10EB1F
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z12so24498389lfu.10
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
 b=SnVG0EEs4PG1+YDicQuYa216zYMYgevvP/UzMEUO22qY3OOxe0BF1b9XMBa/ecXQMh
 E/Bso4ecic0stommXyZiP+H33QQaVECpIvnEaT7QLZDJDvQn54ZSdQE5Gh44wK+M0+XH
 UhQihI/gx1RI9EQurSJavIsw5TIP1AFVkN8BpB3dp8EwG5V/GhENwNxmb+NUHdefMuGf
 ERgpQcbq/LboeRNj82U0koSs2YM4tPLxo2P8/vbJxeXH7NcCWdKqr5qVjUxIe7ZGLZGi
 EX+s+SwKHwTZsU87YNLBfv4L7mylnhcVIAn6mhX+s8wqMJFstI7V8Ew2vJPPCiXn7CTB
 qSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpqBTpUpCdXhEBEq/E7SmvSY4o1PiwCRJgZfj9SmfN0=;
 b=dOP1ZIhMCbrGOTHguuVamWtApIJGrmbd5b+SdavCbo4Kw9EdAmsKCF1n3WhmMQndf/
 pvyLB628FWhQ/hmCV3CgnesDZxN3v28tGAEFwTWeYyu9IykfijD08d55uujlPqQn3EF4
 Fvyhoc2vct6N6WPvBBUEN+4cKKaaVH6eJHXEw04ZyFK3fUmjkNQWMOGr693QQE3+ve+D
 7WfS+nL6XuYhB5MDWYRHE+WzVqYD93SoM8f47uN+Cktsn4cDRpWKXhCiOG3g+Tk4i8Cw
 /SB1JYdqCDFAG10hRbCi+1LVqooqNHcYwrjAB/HxwKfGtYuDJ12xzusVfacCVORJAFGR
 btdw==
X-Gm-Message-State: AOAM532iWPpQnP/I0RAxqVz2tw3S3UmPAhkDUNxU/cR8UwJDF77uqnn0
 Y83bMyhEaLVAmHQ/62WzjnjWDw==
X-Google-Smtp-Source: ABdhPJwGjBpbdhdnjRwao/4Ifr2JOjVvqOmqEQ9SfzzOCa3l5eyKcNUesclMb3AlyoajdCZM8CUH7Q==
X-Received: by 2002:a05:6512:31cb:b0:44a:1311:60e4 with SMTP id
 j11-20020a05651231cb00b0044a131160e4mr8488470lfe.521.1648679413241; 
 Wed, 30 Mar 2022 15:30:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Thu, 31 Mar 2022 01:30:08 +0300
Message-Id: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/4] drm/msm/dp: make
 dp_connector_mode_valid() more precise
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
than generic MODE_BAD in case the mode clock is higher than
DP_MAX_PIXEL_CLK_KHZ (675 MHz).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index a94c9b34f397..3225435fa81b 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -89,7 +89,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 	dp_disp = to_dp_connector(connector)->dp_display;
 
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_BAD;
+		return MODE_CLOCK_HIGH;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
-- 
2.35.1

