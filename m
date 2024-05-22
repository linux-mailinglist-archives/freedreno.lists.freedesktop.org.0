Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1428CBF83
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 12:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286BF10F4C6;
	Wed, 22 May 2024 10:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lOZQwGu1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CACA10F4B5
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 10:51:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso6913989e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375061; x=1716979861; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
 b=lOZQwGu1wW/U1zLnGbjZFlRNdDmeBFjn+iDhXC7ZPmoe5M28mfvdv5AMcUgH3vm0PP
 w3/jGqDRmpWVjosqYRpwKmaa3/1G7IvxDn4YP7X6TDx3EoB9DA1KzCyyWmeJlpoV6038
 CI0Ouke8MBnNmAGgocZc0jXyRLOEFWeQ+GgNi4EN3nSZCghsNTXM6o4zc89pZIqTnmoH
 pIbdRhx9Oz77mN22wZcL6hBMQw/VNZ05Hwx05KIu50h/TETKVJ1riAD/CtBsmY/9WekN
 L5S4NVddBlv0RuJ2+1fmdFAKdbgJ1pkEmfqjcMldGB2BGVikdHSPTGSnJxGa0z7xSocF
 1dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375061; x=1716979861;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cpewU7AgCBeUcebhA/squE/VnkWqKDOhJWxtD0Wziw=;
 b=U3RufIg9mTKLu/b64KVsVgD/qiTp145huANX51kxrqvONUjRxOb6q5mTQAoZeBSr3y
 7CCDQYLO4sZDu5UFhs1gqoODQXv0Tmage/tKiBjc3uBYq6/BzpfIYiStfm62gQb5KCzv
 Ts9anQvs2QLOgRCpT8phBp9PGvzM8GTM34hwMcXybK9rk3EAhQNpS9xtEoUnNNesDbeX
 vqB3qB7RIIgNELkiYJuyJkbG+XQf/pQ7hfYpHvOY//XryBPVS4BTOyvJPE+5LKBeQC5r
 zjOvfzGbniwy+b6FizCdRtsF3bNiwmBeTWUR5/vYiGog1c3YppCU1+r89uDoD1KJcD1D
 YY2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoYN0Mi/vHPUXC7/vSONccIEhIpNdUuqN5FMpblL2TFfOikd0KuWVI8nRJ+ALH+SXNosuiFIssyvjmT/dnMy+hwxkBdRTU1Fpbra7WLgK1
X-Gm-Message-State: AOJu0Ywzr987ylKuEtWiApuloOhB1YEaEe0sV/A36lcZcKPs/8zpDwqV
 V0E5sfNLYHnA85AAXRtKiPOqP/NG7wTT0T+drv1ZYKi9RnGHR/8GCHG3Y6hKrvI=
X-Google-Smtp-Source: AGHT+IHA746vcyQKIF6ARQUrKclZUZ17SOeurs4Y7bb5zbXhpahNcHMlhYUZc1enWJkGEceoCKPVVA==
X-Received: by 2002:a05:6512:2030:b0:51d:1d42:3eef with SMTP id
 2adb3069b0e04-526bf82d08bmr1528410e87.29.1716375061315; 
 Wed, 22 May 2024 03:51:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:56 +0300
Subject: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v9IgZbEVIzCU//v+7Xjr4VR0vD49EBefgZxRpj3Zixc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PZtDbcPARHAK4vTPyxmPCjneihSIWI/DGZ
 yc1CddrMImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1QuwB/9C68k51MnziXzY9cD980CHlYfmEBZfzN3HRPuRudP0j0YzyHWgbm6wN+ZIQY4jaqGVNXV
 4T6y6ytqk8N1gNtMxki5EfrFIiQDKRYxXyAYrRgiTzzjI0g6vBAThzSgKlJwXnBzu3LZJ0rNPBD
 gRrFHl1GehF5mJ64QLav5u/c5z7EuAX5ElXSH0DjRsfdnMsGeTyD73KCyNw94bk7XeeGKf6R/bU
 6k5iRyb6YQLYbv3Nkgy173dvexu7PNVkL6FDi3yKAUfCG+i9b0RlqKDbYT8r+VfvR3bMX+n5dt5
 wCrGSQLNLCj7cHogLW0nFCKGhkFBzo3TPJ2i9qjyMejciR3l
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 3c6121c57b01..fb99328107dd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);

-- 
2.39.2

