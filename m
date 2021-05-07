Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43E376BA4
	for <lists+freedreno@lfdr.de>; Fri,  7 May 2021 23:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2206EE92;
	Fri,  7 May 2021 21:25:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD96EE7F
 for <freedreno@lists.freedesktop.org>; Fri,  7 May 2021 21:25:07 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id i14so8299405pgk.5
 for <freedreno@lists.freedesktop.org>; Fri, 07 May 2021 14:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
 b=ReDI50O4p6XG7KYhP06LRbAWuvZbFoPiydm8iaQ0lbFendfkj5D12q3t4o8Tjq3+XQ
 45Sn3Xz3HB+4fOLjk25u0rJcdrmMMw3B5OOy77dyA72ufIy0vXm1BWyyIVy/kto58mO+
 9byAgPEYPR1V4rWSn2F3s39QJYpw6TrbM5SZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTG2OfOuQUejFlO2ocmSjc3xkounpxNXjXzbmWWcXQ4=;
 b=UkP/2FWRC6GMaH7ayAs/z+8isKUoFEHBvloUA6VS2EfB/zKScokExzYA34sbOcI3k0
 TGWW06dPRq+vhpn0TnASCrngGDWdiTG8iih+kmGCE2S+H/BKCjGY/GsTBsbjU+nRyiSx
 QZcK2rR4eaDQlAlcDR9nP7ztpz1T78/4GgEMmGqNyko3U1pZoMfREqhcjiAv7wg8dC0l
 IjaYTiscUHzDkVozdrjt2OA8URHy7cZZjiVKbuDZXmVL97RGdsSNyM13wZvujFdPlWzQ
 Q/60l3z9yM0gNeQI/Ith6V5cmv+XVoMJoLhStbrFISFVizABkRYCZ3I9YST45oBplCUr
 FDaw==
X-Gm-Message-State: AOAM5325gZDnzka2Dy0GrM1Icaq5zf6xjFZYEaa7VDZqIV+NAkbFiMoM
 4hjmm6d9Pq2xv1laJL8Y2mRcqQ==
X-Google-Smtp-Source: ABdhPJxXqi4S16zzZRUDmrs4PpXoCn4oLa/reeq8qjeKTY4CE/QCv/tBLRMZb5MLVWo20hYp/3coDQ==
X-Received: by 2002:aa7:8e85:0:b029:28f:2620:957e with SMTP id
 a5-20020aa78e850000b029028f2620957emr12473932pfr.40.1620422707177; 
 Fri, 07 May 2021 14:25:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:06 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri,  7 May 2021 14:25:02 -0700
Message-Id: <20210507212505.1224111-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/3] drm/msm/dp: Simplify aux code
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Here's a few patches that simplify the aux handling code and bubble up
timeouts and nacks to the upper DRM layers. The goal is to get DRM to
know that the other side isn't there or that there's been a timeout,
instead of saying that everything is fine and putting some error message
into the logs.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>

Stephen Boyd (3):
  drm/msm/dp: Simplify aux irq handling code
  drm/msm/dp: Shrink locking area of dp_aux_transfer()
  drm/msm/dp: Handle aux timeouts, nacks, defers

 drivers/gpu/drm/msm/dp/dp_aux.c     | 181 ++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_aux.h     |   8 --
 drivers/gpu/drm/msm/dp/dp_catalog.c |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 4 files changed, 80 insertions(+), 113 deletions(-)


base-commit: 51595e3b4943b0079638b2657f603cf5c8ea3a66
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
