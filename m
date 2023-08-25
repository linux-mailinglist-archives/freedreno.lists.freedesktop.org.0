Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC978922B
	for <lists+freedreno@lfdr.de>; Sat, 26 Aug 2023 01:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186FC10E16A;
	Fri, 25 Aug 2023 23:01:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86610E16A
 for <freedreno@lists.freedesktop.org>; Fri, 25 Aug 2023 23:01:13 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso9492095ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Aug 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693004473; x=1693609273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
 b=jhsR+9LbG+Ou958P7E+9XQk3NWBxZyvL08H58dOJFMpUbywkYDZuTJiRYqvl6aRWuZ
 ZWu9s/VR8KOtt4TmPta7k9Ii0sbMJEWVEX92p3BZ5Q3axWxD0EJaGZ+Q2g5QflyiOCdz
 K6TFEGZnXS0pu/yaXvvYJN1OTOVbmRLoP1Lcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693004473; x=1693609273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
 b=ZlE/MbjptaX9sTgIaJzTlxkOs0JF2bsgLrRlofVTLBx30p5dvimuQq9pz0aeRyysCc
 g1BvrRzm+APAeC1Jyu/ub6bfKZdyaS6OUv9bRqRlT0M56lvPWqzClgzMxEKYBECH116h
 CioK33p0ZuE6fwcGOLDE9Y/310sJjUw+2FRjEvRsg0EDEOyl7KwKlOT5oU+yY5MJ95Nq
 PHunjaj7/FXM2T9xEtnz7kxNpFw86TPSdkcKiX/UFrwYV4zR9Mah6dAs3RHOx2QNgbOt
 tJOhcdYbtwyniMe0ib4hrIRDEdb+HShMy1hpOYegBE+aCZmZS5hvajh8kuUwwVVHqX+g
 v+BA==
X-Gm-Message-State: AOJu0YxaPkK756B7uvyXirjWK8ZnSdZaZ/164lRKIUZNgjfISJy4cTy1
 4pQ0UOgLIViCoGAAOCOX4P0JCw==
X-Google-Smtp-Source: AGHT+IFzWclzxaj4YjkShuNK7rHT+Q1ZnPtkApoHCwgpQ4ybP7Ay3vwlvDyjy6qd5fa/B4Eoo/zG4Q==
X-Received: by 2002:a17:903:32c6:b0:1c0:a8cb:b61d with SMTP id
 i6-20020a17090332c600b001c0a8cbb61dmr11484872plr.34.1693004472806; 
 Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d711:d7a0:fa61:8f24])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709027e8c00b001bf044dc1a6sm2330059pla.39.2023.08.25.16.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Aug 2023 16:01:08 -0700
Message-ID: <20230825230109.2264345-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Add newlines to debug printks
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These debug printks are missing newlines, causing drm debug logs to be
hard to read. Add newlines so that the messages are on their own line.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 42427129acea..6375daaeb98e 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 	} else if (dp_link_read_psr_error_status(link)) {
 		DRM_ERROR("PSR IRQ_HPD received\n");
 	} else if (dp_link_psr_capability_changed(link)) {
-		drm_dbg_dp(link->drm_dev, "PSR Capability changed");
+		drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
@@ -1107,7 +1107,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 		}
 	}
 
-	drm_dbg_dp(link->drm_dev, "sink request=%#x",
+	drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
 				dp_link->sink_request);
 	return ret;
 }

base-commit: 706a741595047797872e669b3101429ab8d378ef
-- 
https://chromeos.dev

