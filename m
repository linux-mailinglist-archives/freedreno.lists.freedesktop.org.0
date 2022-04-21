Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9550A087
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 15:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818C10E722;
	Thu, 21 Apr 2022 13:15:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6BE10E717
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650546922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
 b=iXPr8Mg1EYCir3yYRpwdqvzOdycyDh2lYfzX3A6vBNBtBy211R+JYbBZHEDitav6kPkBn4
 YXPKlLkzMDC/yulNeIc1sBcpRSqBo3npzDUM0vnIB6T8wAPZ/v4Gf5sp0wu8XJmtjVfuOs
 9Y9yc7H+wnshkIqI75r030FpXhGJZ4U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-acHCPQPFOgeXEmta-3yPyA-1; Thu, 21 Apr 2022 09:15:21 -0400
X-MC-Unique: acHCPQPFOgeXEmta-3yPyA-1
Received: by mail-qk1-f197.google.com with SMTP id
 y13-20020a05620a44cd00b0069c35f1ea3eso3317860qkp.0
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 06:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
 b=vvBkUgEV9jRm7Tbqm+HS3pMfnBU8nqZvi3SXyDYnOB0OWZR2SCAFVKzvZPs5AeHqDF
 x/lz1unZwbij3okZl/vzvo9xFpt8SdYA0+cv+uXAhigcBq+pxAlALBJqespDFIb6SNqy
 /REgpsaEyKCx1OomHeSquIp6yrJ/WCdJYoVvA+FRV5q3/XxIucT1y+elpJWZoT2Mm9as
 75NX+w0+ZP+82yXb+ntHL26qMnAvehj+pwTBzt/M8XasF3RX1N3U2+qtlpBxnAmNhNw5
 wl2Ug79wxDLdfHH0GcPIeZTg75vKZeJUrYsFBO0gtnoaTv3B3Qqsdr37c40a2OG9Ucxt
 QMlg==
X-Gm-Message-State: AOAM531S3lYhLwjBWXx8Qa8oKBSOSYWxrHN5NiYY9oyOjvc8i91N63Fa
 3HzNLkLjL+aE61OnOQpRik8wuaKvU/yePSDb8qSUyDhe+bFZfzAUNpIFHB1e87dnxpKH9oEqQl2
 IAkR31Na70GC9WqNRQw9Jr5VQhODW
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr15404150qko.245.1650546920749; 
 Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1p460pSQsriY5we0lc7aVE2SA3Un1gDznPdW1XSStmWduRojaJ0UnG57Ylk7u7lLp/dyJdg==
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr15404128qko.245.1650546920553; 
 Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05622a014300b002e1dcd4cfa9sm3868302qtw.64.2022.04.21.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:15:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 21 Apr 2022 09:15:07 -0400
Message-Id: <20220421131507.1557667-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Freedreno] [PATCH] drm/msm: change msm_sched_ops from global to
 static
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Smatch reports this issue
msm_ringbuffer.c:43:36: warning: symbol 'msm_sched_ops' was not declared. Should it be static?

msm_sched_ops is only used in msm_ringbuffer.c so change its
storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 367a6aaa3a20..66f4ec09ef67 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -40,7 +40,7 @@ static void msm_job_free(struct drm_sched_job *job)
 	msm_gem_submit_put(submit);
 }
 
-const struct drm_sched_backend_ops msm_sched_ops = {
+static const struct drm_sched_backend_ops msm_sched_ops = {
 	.run_job = msm_job_run,
 	.free_job = msm_job_free
 };
-- 
2.27.0

