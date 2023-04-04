Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B56D6CA9
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 20:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2410E760;
	Tue,  4 Apr 2023 18:53:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34110E386
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680634414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j0M5QDGBellEBnHKe7QL0tgh7mmOP32p1W0jTZXhVvA=;
 b=N2WJZEJf44Nhp/ZLvK4rdXGakICFLLx53iWptFrzYPFc3OPFY+kHRLDb2Di2KmNEH4T35J
 zfh2ZK8KsWsVl7wp0VgFRr43sAeqdOHcRE8z8h780BfOxT5tZzpQc8g9jqwEK62SniYXxl
 EQIi+mHIGwLsWT8FW5elBAKb2i5OcH0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-rzlAgykhOqSJXFeMspmC8g-1; Tue, 04 Apr 2023 14:53:33 -0400
X-MC-Unique: rzlAgykhOqSJXFeMspmC8g-1
Received: by mail-qv1-f70.google.com with SMTP id
 f3-20020a0cc303000000b005c9966620daso14965121qvi.4
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 11:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0M5QDGBellEBnHKe7QL0tgh7mmOP32p1W0jTZXhVvA=;
 b=IEPyoNFUn3WhyybRSv9FSDQzVoV+/noRDoyBudk2K9WPlgGX8T1kVPydZASApMr9ux
 8yNRw9j9zS9ej3oLHQeG2xLFa5l6cnD/CPpdt1u1gpnfX0MeqGbLzgTTKWsU8YtdrcFd
 VKbnIOZ+Gn1qjjZbIGr/9sdNtJzVRUX+P6I5FfmWa7rjbX++GfNb5u9oeCy1oDYyNkXN
 FRaqPdXoGHlneZpfZyMwcMlqlJmLkLZQqyJbtc1zI1Up+AevndRJHq+pz4+olX8bsEaB
 DBHd7LxE5dxR26jmv6IRFMPxSpAVoNHIjUS4F+4NgxrC/S56VpvIU5CCWJWJEnp+lDr8
 vVWA==
X-Gm-Message-State: AAQBX9e8BDQfE8KimIztuDU+FQHS+as68sjZ+pGQeMv9gMdBIw+T1tp5
 dRtWHZGJOugEOVfv3DVLHA4GodAVeyonoylVD+wHp0iAuJ7B+1qxfdwX+L9w0YOgTOPMoeEAaCw
 6nP0EGtaoWtLg7dmSpeqZNqwhFXmm
X-Received: by 2002:a05:622a:138b:b0:3e4:e8be:c3a4 with SMTP id
 o11-20020a05622a138b00b003e4e8bec3a4mr741062qtk.56.1680634412938; 
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHha48xVckQMZBBBOfNL67WaM8+Vk8RyO27WZmOEbqXBCe+GmWfP76gbamBPcNYhZvXnXLKA==
X-Received: by 2002:a05:622a:138b:b0:3e4:e8be:c3a4 with SMTP id
 o11-20020a05622a138b00b003e4e8bec3a4mr741035qtk.56.1680634412694; 
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b003e38f7e4562sm3400800qtq.69.2023.04.04.11.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 11:53:32 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, vladimir.lypak@gmail.com
Date: Tue,  4 Apr 2023 14:53:29 -0400
Message-Id: <20230404185329.1925964-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Freedreno] [PATCH] drm/msm/mdp5: set varaiable msm8x76_config
 storage-class-specifier to static
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

smatch reports
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
  'msm8x76_config' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 1f1555aa02d2..2eec2d78f32a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -655,7 +655,7 @@ static const struct mdp5_cfg_hw msm8x96_config = {
 	.max_clk = 412500000,
 };
 
-const struct mdp5_cfg_hw msm8x76_config = {
+static const struct mdp5_cfg_hw msm8x76_config = {
 	.name = "msm8x76",
 	.mdp = {
 		.count = 1,
-- 
2.27.0

