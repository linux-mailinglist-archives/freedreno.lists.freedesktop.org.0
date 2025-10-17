Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D075ABEB6A1
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 21:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6F710E199;
	Fri, 17 Oct 2025 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kvx++sdD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888D10E199
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 19:59:54 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-368348d30e0so21895141fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731192; x=1761335992; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
 b=Kvx++sdDkFRmApQUtn+grz/wJWkS4pvcFJaQGhTV1ytK74BLyI0SI85VpxHkQUCHg7
 KT4UDMBjeknPhHT9b3hQl4MLo5nYwVq8/1M3Gqc5rp6YYeA6RuyYVPeD40GO8x7Dp6N7
 wCeo2gvnFBJWk7ca37+LXVWcI4GArtXqnhyDpeID1q/LDuoWQjQlE/kY0dHAP8o0UWYM
 C8amIi3fJ5byaOVw+R6vW4JGlXLSDikgV1blW5oml0+0uIP8Lstu5pTvrfm0mmFbMsLD
 UqFvuCTeEv3BNdp+H+0B+2cs6BE2BgtZCfqutDcGA14H8h38qDOkt+2zPoFMWXjcUdtS
 meJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731192; x=1761335992;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
 b=lOEnaKJbttCdp8iK+mqkztejXbtBydaWg8A5dJf2F0CXw5o011wXvQ+3C3lOZyXz1c
 YTmje8ZIiPNvXLlvzYgGeh8tzXJiZlsvokbK5rv69L36sD1FD7baX7b9V7ylvzlTgTP4
 GKMjmjnVXzkQYyhusGjjLoXwHLZjzBvV4mzVHDJURLQ8VK12WAThp23hOGECcAtkE7i0
 0+VNv6bmFA6fTZfyMG5YXB/AWCQDhKrrfUYiRv8IMAyqrhgx3LH502RDxf5ycTowfqP2
 D4HuMBP3uZ3qlPqKCfA3t3y2EEs6quztvEIakm3L3kWfaHkGJX22X2P9DFdCqdfIu+MC
 MQQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1642r7U9FwIM4wrtg/CYVk/eBdPhZmVlXH7iE0lvyTzBextshikm9g78Ep4iyfWiCHmxvSOFzuD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHfLDfd+nAoW304BTlkz/U6ZiOr2Cl6q3Liz5HWOMlNDlAcpzx
 Qgu79ubcdcapxX3Uy5cdKLnjlvd8ahy5AQeyVvaC0OSWWhNTEabMeGRK
X-Gm-Gg: ASbGncuUa2+ShQGRRqED7I+dJ5V9jOcZUC0PqKke7r1KwnRH9iYJXO5Mjnc3J14qsxp
 QfdrZmoaIhgqito+ObbfEKPAH8oO+1v7E2OtNWOugEIS02h3Dl3ZSedJscBuxSV89nuZEU1GYe1
 X/Si5Ulf0Kt5QtEDHuKQpPQK6d8DYqaZKx3D5qlJifzfJkKI5mEdQp74LSOmSZQ4j5wLM7YDBKS
 2sJQEJm9VnitY3NlizsUSxSvtjJGPZMUk5V1YtJKtVYhcp3qOAr+os6uN+xVSvUnLyGIVxK8F6R
 HqyrTx02muNOEabLi4LzMrcNHr/kq3vkYarcSmQd+Jfjgp5gD7imQX3JENj1lMzCejgQ3p9L8vE
 /gTqzpckjEV5wQ0E/KobLJ8+1Lchn3/qMQ06nbslvg04tIXAqr4V1yUNO4iy4bFI5WB/ojZQb9Q
 avJyYgsGmoQDERwU3FW1hFZpvN01gKT8QAE1CypChUuPoKxVzK+kScnIJryF7Qew==
X-Google-Smtp-Source: AGHT+IHzKo3kQw6iuMExqSQ6fFZYvK2nL63bBWgR7byM2mBCBlbduwkLkF6/MliA8xn5+NautTf/5Q==
X-Received: by 2002:a2e:ab89:0:b0:335:40e6:d054 with SMTP id
 38308e7fff4ca-37797a8ec26mr16180021fa.43.1760731191742; 
 Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 0/6] drm/msm/dpu: Fixes for virtual planes and 1.x features
Date: Fri, 17 Oct 2025 19:58:34 +0000
Message-Id: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuf8mgC/x3LQQqAIBBA0avIrBvQ0JKuEi1Kp5qNiVIE4t2Tl
 o/PL5ApMWWYRIFED2e+QoPqBLhzDQch+2boZW+UVANuGn28ceeXMjqrR6ctSTIe2hIT/aEd81L
 rB2Zs+NleAAAA
X-Change-ID: 20251016-b4-dpu-fixes-c847c48e0e5d
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

This patch series fix some issues found during testing on MDSS v1.16.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
 4 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 6f3b6e91f7201e248d83232538db14d30100e9c7
change-id: 20251016-b4-dpu-fixes-c847c48e0e5d

Best regards,
-- 
Vladimir Lypak <vladimir.lypak@gmail.com>

