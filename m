Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447BA563C9
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 10:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63810EB1F;
	Fri,  7 Mar 2025 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Snz8R4Ua";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65C210EB21
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 09:29:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso9797205e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 01:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741339783; x=1741944583; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
 b=Snz8R4UaxBECry1YzNMz9ixbv6sb0fI3xp1jw+9/gyvcg29flM/5CAlrS7CnRPDXlR
 AfxHHlwkr/h+vE1uaoFtx3iXaTtr7uazU8e3SjK0oS4T8h0n9JX/HB0oj5msvzah2Yt/
 VYI5LNvnhdI6C25dwyaoN3nF+eLDgr20pRQcVlJofYj+btVLC3JWD4WrQWeZYZKgJu3m
 0yDYeMKFMsv+jojpMlCVYDZQJqrfR7PWatb2l+l9tSHQhj5F0RYzFZnEX+WWq1ZKXYQR
 7NoTdRrZg2lBZQ3P+Tq0TIsCLcDckSZiNYx6/wRDEowkK4oiylvdhnhrUaqLjoGKmogM
 tQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339783; x=1741944583;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
 b=CuwjmEypyaA7vNXwUuaNNLrH/4sVbM7kV9BXTm8YxeiHbEHpMNRLhVVdxaBHhPs0Tr
 iLlFXCfLS4oqedyCxTXy3AuipDFhOZt8kviDolbiBoYDKil1Qj3CVDLodIyjT4NHsp0q
 PzHf6fWV+cJRuUN7SwUV6BJOK/P9hPwR5O1+qP8M2/R/gErDWavFktcKtmmPXlZUo5vU
 y2Ksj24g86W0RpslHPtldD4eIYPhUjGiIKuu3PNDUBoRMSYlzk+8KmBkQY+xr7dPvZO9
 v2zuUPpgTK7/qVkA+TQ4Cnmhdg0soIY5KO2/+ApsP7HvdMkCYArwcwHRu23tZJ22R/S3
 wjFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNEYBjngvylu/dqnWkPweumynu2vNgoe/cX50N5hylSRZewvNDTUv9OZDoHVAen0tLSDakeWkOsRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz8dMy5vNm88iezxuWtjGATAdo/cx5B+dMEhSnP1IYHxwmFVCM
 gcSZR40AfUNKPSqXF6guu0ISPRqfNrEixUR8JGMcTTanOx8T3nn5laL0T7MWEDM=
X-Gm-Gg: ASbGncvMMFxP56QeoGX3RaQ0vS9xcPD3sq99s9HWV+us5skTC+HRXzZy/ZidcjOlfwp
 8vxSmso8WL2h3dnhxtW+rm5SSiQG098+njOAYuacGYD4DnXbmk98JiobbaeluE9pcRJlZ8pIxKc
 LsphBOYGtJmdTIjM9vcY09YhPsdmBOh4lCriTd21HM6MEDrEl5wdaL6sTBO0EkvZHG4LUoywz9h
 ybHP7TrFbmC3JDD9QdTn8FDpabm6L4qKJan7sDNwPZ3FJBkoSPAEmR5ZTKOe79+r79u1JsPFlm2
 EXmFOKaKo5h0BBKIJIUoGNDl3FNEDCfti/bBuy6ZNIfIXPmDfg==
X-Google-Smtp-Source: AGHT+IG1aeOLiht/Zk+dJWxQiJtrE01AKe/jCJ9h6AR4ika6O/iJj47hJhtKgYXJCT1ozzCGM9Qjxg==
X-Received: by 2002:a05:6000:2c6:b0:391:31f2:b99e with SMTP id
 ffacd0b85a97d-39132d1fc45mr1723216f8f.2.1741339783348; 
 Fri, 07 Mar 2025 01:29:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e3250sm4783347f8f.61.2025.03.07.01.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:29:42 -0800 (PST)
Date: Fri, 7 Mar 2025 12:29:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

After the loop there is a check for whether "wb_encoder" has been set
to non-NULL, however it was never set to NULL.  Initialize it to NULL.

Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0a062d6fa3b..ff6f5c5303d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -956,7 +956,7 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
-	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
+	struct drm_encoder *rt_encoder = NULL, *wb_encoder = NULL;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	/* Find encoder for real time display */
-- 
2.47.2

