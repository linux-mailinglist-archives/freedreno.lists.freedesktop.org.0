Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0C69F875
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 16:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FDB10EA38;
	Wed, 22 Feb 2023 15:57:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0649D10EA38
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677081418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
 b=TiweaSac5/24jQJUErKk+qsZBOndFFtL+AAKuFsc0FUP5WUdNFjo74BMmKEuIA1vBzow0H
 4vlVChHd9e3UdBV/qM/VrY3WqQbgWx+G7W566qbknwSgfbtN6EdTbyveb44Lap/GRPVaDg
 kt84dDglp5KGbMt/vNBXZMqWR+e6Vu8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-3CbWy3aWOKudyQXJnb02cw-1; Wed, 22 Feb 2023 10:56:56 -0500
X-MC-Unique: 3CbWy3aWOKudyQXJnb02cw-1
Received: by mail-qk1-f200.google.com with SMTP id
 c15-20020a37e10f000000b00741a3333881so3255038qkm.13
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 07:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GScpUkVmR1trk5NKo/KgCoCbwLxTQg040xij2n32R0k=;
 b=uadPlZHL6BjM1Jhl7j24vs5SnRbtYZEk3qiZhdXud4bLkR3P6GYFZAq6wH4h7D+JBd
 ecx2gzgYh77huWtWe117clIZuIoeFr2xZNNlk8bJjezNLTAKzhY/5DBvvUgpks7LT/Bz
 ZYgDusgcq+A/CjsXasJ9uMQnA5/Z9hM7LhMqIxk03p5lQi8dIemDTqH2tOUFouUiVu+k
 nayVcmALliVWf9lOzzPmEYevW1W1N3Y2Q+bvvf6mKNtxFmSJ6nvzKccXlA0mZ4WlSCP9
 U64pANzeERLX2yMos9kksDsxkt/8YVF5x6RtMG5kIcwifPkOrJXJ/8/r1Gf9SJ7iwKiL
 EDcQ==
X-Gm-Message-State: AO0yUKWiCeCaUv6LznYi609epGRTBD2meoBwu1zS+uiVZwdHD/Fnzwcc
 e3xpjmI6scWcq2Vju+3K3r71lEbL0mwN7+jco2HZTB/criJJ7seEQKC29bHfOYbPI7R+Cvomvga
 yzyaK6MWn+Xi6gdQIQKMqKSRFWJae
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id
 u7-20020ad45aa7000000b0053c93549721mr17269889qvg.21.1677081416441; 
 Wed, 22 Feb 2023 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+9amRNsc788f8Ah1EHOFjNZAoWEKdId2TpDxnPM1JRKz/kP2UH4h79UWQqmJg4CwTyIG4HZA==
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id
 u7-20020ad45aa7000000b0053c93549721mr17269856qvg.21.1677081416191; 
 Wed, 22 Feb 2023 07:56:56 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 t78-20020a37aa51000000b006f9f3c0c63csm589967qke.32.2023.02.22.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:55 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 tzimmermann@suse.de, javierm@redhat.com
Date: Wed, 22 Feb 2023 10:56:49 -0500
Message-Id: <20230222155649.2001467-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Freedreno] [PATCH] drm/msm: return early when allocating fbdev
 fails
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

building with clang and W=1 reports
drivers/gpu/drm/msm/msm_fbdev.c:144:6: error: variable 'helper' is used
  uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  if (!fbdev)
      ^~~~~~

helper is only initialized after fbdev succeeds, so is in a garbage state at
the fail: label.  There is nothing to unwinded if fbdev alloaction fails,
return NULL.

Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index c804e5ba682a..c1356aff87da 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -142,7 +142,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
-		goto fail;
+		return NULL;
 
 	helper = &fbdev->base;
 
-- 
2.27.0

