Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210399D4C8
	for <lists+freedreno@lfdr.de>; Mon, 14 Oct 2024 18:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8028D10E487;
	Mon, 14 Oct 2024 16:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bCsZwRNA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAFA10E482
 for <freedreno@lists.freedesktop.org>; Mon, 14 Oct 2024 16:37:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e467c3996so1913544b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Oct 2024 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728923854; x=1729528654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
 b=bCsZwRNARJo7zMvq3tqEgm4mdV+HuGFOlDnP0h6AO8R7daG+jKZWoEqEevHWE1oy0i
 FmXkOAEiLPjRocHMEXQbbPgJlFj0HTsAa6UZXhZUYww1RWQ3lUOmkIXZHw8CIuU2MrT2
 x7YkGQa6fvXSYrBbbC109ul6bGSQXfqT2omAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923854; x=1729528654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
 b=GrjKNvZocnk2wr2ngGI7ROdxPIDseSZqVsIjMY0BrfT6R4BivIDYOlUzC1iVsafqPK
 FfkZCFvytw4jCStSByXSJjUS4d7SrdDzitqZHvkqpukki/4nstG8DSjhjSmS+LL0obia
 KFK2rZ/lEKL/Q2IEE3Xoa9SciHeI/cUkgn7SFvm0HXAj2C1VmGoMene3KCn9Y9gQF7t/
 /Ar2cbSlbI0eUSXjB4dMw28gNtvCV2E8Tp7nMaH41I56R4uc36QXvB/l21ihtrrpNtJl
 k+2/2T6braw2Rq1GD7Y29zxtRJlEY6Hlfep732/S+jJeKvbAh0uCeSYi5U/rdzLfJzBp
 TmiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnKnNEXYgrhGAbauMP7FZ1LRWQiJU3KbJe4SBemY4RMWfN2hXsmSlhjvjj4qKtUeiHk3m9yommVNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhdY2QK/mseTnZd389DJTW+H9xaB1SBix08W9z/5KqdorpntOs
 u14+pXmVCvKn6u1j4/6qQmLYebiEynBHex5e0Kpoxdc+afz+7lZgrbLYJPlX3Q==
X-Google-Smtp-Source: AGHT+IFrI6AyFlAD+rPt6sq8RJjzjcPvxnHIHU5bh4fmZllt0MuEFWzqp3sZJTWGMBx/myacl4Lxew==
X-Received: by 2002:a05:6a00:9282:b0:717:9154:b5d6 with SMTP id
 d2e1a72fcca58-71e37f4ed89mr19746704b3a.22.1728923853741; 
 Mon, 14 Oct 2024 09:37:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 09:37:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: Avoid NULL dereference in
 msm_disp_state_print_regs()
Date: Mon, 14 Oct 2024 09:36:08 -0700
Message-ID: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If the allocation in msm_disp_state_dump_regs() failed then
`block->state` can be NULL. The msm_disp_state_print_regs() function
_does_ have code to try to handle it with:

  if (*reg)
    dump_addr = *reg;

...but since "dump_addr" is initialized to NULL the above is actually
a noop. The code then goes on to dereference `dump_addr`.

Make the function print "Registers not stored" when it sees a NULL to
solve this. Since we're touching the code, fix
msm_disp_state_print_regs() not to pointlessly take a double-pointer
and properly mark the pointer as `const`.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index add72bbc28b1..bb149281d31f 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -48,20 +48,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	}
 }
 
-static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_addr,
-		struct drm_printer *p)
+static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
+		void __iomem *base_addr, struct drm_printer *p)
 {
 	int i;
-	u32 *dump_addr = NULL;
 	void __iomem *addr;
 	u32 num_rows;
 
+	if (!dump_addr) {
+		drm_printf(p, "Registers not stored\n");
+		return;
+	}
+
 	addr = base_addr;
 	num_rows = len / REG_DUMP_ALIGN;
 
-	if (*reg)
-		dump_addr = *reg;
-
 	for (i = 0; i < num_rows; i++) {
 		drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
 				(unsigned long)(addr - base_addr),
@@ -89,7 +90,7 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 
 	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
 		drm_printf(p, "====================%s================\n", block->name);
-		msm_disp_state_print_regs(&block->state, block->size, block->base_addr, p);
+		msm_disp_state_print_regs(block->state, block->size, block->base_addr, p);
 	}
 
 	drm_printf(p, "===================dpu drm state================\n");
-- 
2.47.0.rc1.288.g06298d1525-goog

