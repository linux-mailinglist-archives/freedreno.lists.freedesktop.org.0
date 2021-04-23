Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426B369ABE
	for <lists+freedreno@lfdr.de>; Fri, 23 Apr 2021 21:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE26EC3B;
	Fri, 23 Apr 2021 19:12:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AD6EC4A
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 19:12:20 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id e13so40837984qkl.6
 for <freedreno@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H896F4PjwDY8jmfWwaLDr4shp26B+KmxkyhAPtoMs4M=;
 b=pRma3lac0c5ClpyVGp+FlxDrBykek+53y2UaGikk8p9eHwfH7nW4VE/v7DHQV32oeZ
 5G9WhJZyojjSE6DFn0ndsv4QXv9e1QHpZg07YBRQ/JPMA+MNwFKGdwDu6VXN6kdmcxZo
 1nByFst29E593MUK+C0aJPfnNnZ6ITjj7qF32THxkIdgfRugqs2kBTpMTXIv2+p/1eSH
 LnjKtF3RenT8LbipYN3UZqka5GF9siPGVro+5MTLey4gXPqR3y4gMSfV5V1ftQUwMkhK
 AfJUaiGZIjlyNn3ErcmbmmVME5EYXwOyjigc6yKMlspVMy4AfHPS0ZJY1J+tDLhUa0Sk
 NiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H896F4PjwDY8jmfWwaLDr4shp26B+KmxkyhAPtoMs4M=;
 b=mu3d6RwApYEI7LF/u5p8G4grC5VgRj/NJwJI9WemJzyVO6cuz3q0zgIYflyDdamIlL
 UFkLJXM/+eZVivK3rhPDuib6pjrSiTjMV87NGPqL7SuGCslO2fCTj/3RX5jP9yoXzMGI
 f7yRN36WhzkCiYxuhi0EA8YiCHZ8htQGJ7ofK+nUlwk4wypWWTDoPllEQ861G+yNjkL4
 sxD7NBJk2oxY6iIn+qyAFPlFBd/0cmbS0osvwio6aW+V7rULfdDcxtW03voS8xnwLSMa
 SDUjIMDghBsveqC95d4hIiWR+wlY+Tf8BtNwZLweSXnRCd+AWrby7Qq3CNkOgJWmqbTT
 jokg==
X-Gm-Message-State: AOAM5301MCyJIYQSfxey7HQ0shfSLORVty262xwVQwwkJmKpZjpGDOgJ
 lNzWCIS4zyxj5DEtnDpPnUv2THqATwdv/YTwrEe7gw==
X-Google-Smtp-Source: ABdhPJxtl7HyuuifiNlkFxXYO7ncQRrKu5Xh1IELP5GvMv+x2eQ8MKIDTBx5pc6kfeilwBtBpV4L+Q==
X-Received: by 2002:a37:a90a:: with SMTP id s10mr5507081qke.63.1619205139696; 
 Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:12:19 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri, 23 Apr 2021 15:08:21 -0400
Message-Id: <20210423190833.25319-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 5/5] drm/msm: deprecate MSM_BO_UNCACHED (map as
 writecombine instead)
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

There shouldn't be any reason to ever use uncached over writecombine,
so just use writecombine for MSM_BO_UNCACHED.

Note: userspace never used MSM_BO_UNCACHED anyway

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 +---
 include/uapi/drm/msm_drm.h    | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2e92e80009c8..56bca9178253 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -201,10 +201,8 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 
 static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
 {
-	if (msm_obj->flags & MSM_BO_WC)
+	if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
 		return pgprot_writecombine(prot);
-	if (msm_obj->flags & MSM_BO_UNCACHED)
-		return pgprot_noncached(prot);
 	return prot;
 }
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a92d90a6d96f..f075851021c3 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -94,7 +94,7 @@ struct drm_msm_param {
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
-#define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
 #define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
