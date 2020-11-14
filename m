Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E32B2DD8
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 16:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC486E931;
	Sat, 14 Nov 2020 15:21:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5956E930
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:14 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t191so12459517qka.4
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=tAvkwqI5UxVZLosgiy2dth1kE1mcObUnNjCIF6g213uhCAWBHnRRh5fpxcrgw4xb3v
 FZ7NpmkKli8Co1oMfBaarPj3K76JK44Ml1lkgtKkBh09QtZQ3+zfv1uswWhXd61y4bQE
 j/X998FoLQ84iWpWlrUVOo/Q3OBuKZs9cqij5UWCtakg6o/hSjfI+DtG0TBdUATP99z1
 gRiqRqcuyqK46TknWsQIXmrU0QiaF+mSHY13qSlOKkOoJQg6DbBkqlrPmB0OQzbY/isO
 +v33fhTuN3YUdRVIzPhPZJQDAlEazj2T3f5zJHglATLeKtFoLgiRU9C+AwUzyYMLEkv2
 EkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=mvUPUCHPkQm4SOn7zgIuFMAmrppO55sqDlJ5ZZpP/JPZrhwEO6Kr3zQUcihAUjCygp
 kwqTWx04oDv+9TcWNXofhVkOLy4OjeBTFhsnlDvr8p7ZFk4yoEfbAsh+2PmIChKNuguk
 tQpy0Y6jbQHCuncl/XmlRCJOkB9bWr4xeJWY7kCVHiHxcTMBHiGfKLpb+VIT6iBQA6vg
 85Me7HMJCVQjoCEtr3z5c5yJHmheg0JaQUQ9HHId9PxrC/B7imbvopbvZwDgv6/L+TYk
 Yo7CePalBTzYpDEkHMIlFJni0RRFO+28c/jRRBGG60Al6U3GBNqZFdGGJCbfiptB+kH7
 Y4tQ==
X-Gm-Message-State: AOAM530q4alIfmxEiMza96/bv7+laWzHVreRqpkdZg+uHVsHZ6SeOTgS
 iHUjcswqMI01kxKHo0wfsFHKdFmMiq79i4HoxM0=
X-Google-Smtp-Source: ABdhPJwk2smqvgptEJnw46UBkqHH5sjXfXDGxlkv1FFfTWhR+COGK7v2Bg8xIbe+LZRJgTPMlPpQFg==
X-Received: by 2002:a37:de08:: with SMTP id h8mr6941400qkj.0.1605367273113;
 Sat, 14 Nov 2020 07:21:13 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:12 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Date: Sat, 14 Nov 2020 10:17:13 -0500
Message-Id: <20201114151717.5369-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND PATCH v2 5/5] drm/msm: bump up the uapi version
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3f17acdf6594..7230d3c0eee5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,9 +39,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
