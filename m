Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0837FC45
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 19:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA396ED91;
	Thu, 13 May 2021 17:17:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A38B6ED90
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 17:17:39 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o27so26203254qkj.9
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WG0R1210n0jTNjQDS6goCg7eMSMJrn7+n/wli9p3uE=;
 b=a7WGuaOMXcdyVbHS1oMtsfrUeHQJr5oaOtSUSS8iouy29cPevPdc+8W0XA+vksHIDi
 Zm8VeBJ/2aa0zQSwnxPK1+lFXabRRW8S9gUyxrdsir0JPTGoQyYzItinXzZ+KFcV5T8V
 R5zFT4xsDcG6rP6fh2FWihojqgOORH6V6XzdU4GzV1bMfwrFJNRO9z949T22p6j/mCjy
 TSI5Ep0DnBYHasjwZHxKm2TePX171Y3CMollCPSJL6Z+E22bv/cMFYG2QQZNLBYO3FEw
 6pDUNzzqnQxdWqzSeu/QcRN6/2twVbIZLKnYg7A4f3HtegNlibW6a5cIauts/lLBcYr1
 yQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WG0R1210n0jTNjQDS6goCg7eMSMJrn7+n/wli9p3uE=;
 b=LPy5wRNp1xrCYzpHMGyoq4p7FT3esXfzx4pRVVQ7oU53jLRmSwn7gaaNYWC9greBHU
 lu5HndFLF7cpkK8dH6xFznRGmvd4tJWUYb8UJm/xiDW5dsZiN60EHJNaTDcp2N86zNMj
 BalpMh0AvVGGJLCoQ8CPZhjt7njO1rCsKR+uxaEt5Z/vgWhOceC8Mr9cbTKbWZGb3xZJ
 ijP4vK51m1x/sJc0dl4WLQ0Ea+7Uqgn81UDsFJ3l5gF1jdxj06PbsmE3zZzdiFgXSq3N
 fgz/lG6ZBKgChKgv9DVTQM0L28h1syx3jT+xpiHr2zzwJYvk8viY3v0QX28j7v6OCcBb
 K5qQ==
X-Gm-Message-State: AOAM530I42ogHKYR69reaO3AoQK3EOIVG9u1Z5TbxQsLnDRdhcLY/exJ
 z1+WSCfrr79hHEFh8k+2/bcTduAmP20BgXAx
X-Google-Smtp-Source: ABdhPJwp93NLEhRkl5ZJqxvch8hiavkKa9Ms6pYFfYpvTzCXyNoiML+6spdv3qCly1s5rKn3cnni9w==
X-Received: by 2002:a05:620a:1201:: with SMTP id
 u1mr40175153qkj.80.1620926257971; 
 Thu, 13 May 2021 10:17:37 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:17:37 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 13 May 2021 13:13:58 -0400
Message-Id: <20210513171431.18632-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/8] drm/msm/a6xx: fix incorrectly set
 uavflagprd_inv field for A650
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Value was shifted in the wrong direction, resulting in the field always
being zero, which is incorrect for A650.

Fixes: d0bac4e9cd66 ("drm/msm/a6xx: set ubwc config for A640 and A650")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727d111a413f..45a6a0fce7d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -489,7 +489,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv >> 4 | lower_bit << 1);
+		uavflagprd_inv << 4 | lower_bit << 1);
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
 }
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
