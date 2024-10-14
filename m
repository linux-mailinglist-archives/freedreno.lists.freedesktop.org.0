Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A192899D4CB
	for <lists+freedreno@lfdr.de>; Mon, 14 Oct 2024 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D126D10E48C;
	Mon, 14 Oct 2024 16:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DrGK96AA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9509810E48F
 for <freedreno@lists.freedesktop.org>; Mon, 14 Oct 2024 16:37:38 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e483c83dbso2639080b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728923858; x=1729528658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
 b=DrGK96AAtYnT7Ov0mWOFQVhsocHIYccTx0QgPZVBOqgwNsY4gi2A2zRB4r6nExildk
 covYrT5sYYkPHfmRBUoZa1ZKB+CCNlCYyDVdF9ToJ1D+V8esi+iriZpNn/A65xkYT748
 wilGFOLEh1kDs8cFY4Dh4NH7/Pijz1GLmqSfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923858; x=1729528658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
 b=dL0Vv2eOc2wjLhHxvHW3PLAoFTo4xDB1onwE1YU05N2KYLVC+PAKZ/WyZghVQ+4LOY
 FjPTvQ5QS5DYbPQ6Loyvk5bcq+w9y7O0caojt3UIdRL+OQGdffrAfEOShJ/pSSKDKTzw
 DCS7qUB3gAbbLWXJFqwyI+HVPU2wEMbe0B241IunQW6X4+LUIetPAPoDAPdGg6LO2uk7
 5RtiUoGvkcVXjxpj5CURohRmXuc5IjgQ48bNw1KxUVNqQGUhyJEMAb3HM+EueTwXlnJZ
 AVHl6bPx5AnQrlVax0TvgwoOZYW4qlmEjvNyQwi2ogjxBmyJzM4WkwFgAG9yiWultEKg
 o0Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhYUHAti3pVb/L4SIVGhE+QOG0F9CbX6CVuu5pYqoRTfPfGxCHga8vRQ5E/O8frXee05Ix2icS/kU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlZFVsTFPzmTFBW4FOmU1FfikQuc9I4FdZ3xR1AGwZNz/KpJV3
 2DhvMMBqfRGymF/+Vl+UmKNZ/tCti1cQ3v1UG8zC+kmO5/5ow5cvKScwzO28NA==
X-Google-Smtp-Source: AGHT+IEguS+DYgfr50X3amlVgerOKKT45qvqYFP4etgOkkRvUpQ1dDg9fKu0+t5LQwDSWp3K3ICKxw==
X-Received: by 2002:a05:6a00:4652:b0:71e:4c86:659a with SMTP id
 d2e1a72fcca58-71e4c866d72mr13703071b3a.9.1728923858137; 
 Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 09:37:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm: Simplify NULL checking in
 msm_disp_state_dump_regs()
Date: Mon, 14 Oct 2024 09:36:10 -0700
Message-ID: <20241014093605.3.I66049c2c17bd82767661f0ecd741b20453da02b2@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
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

The msm_disp_state_dump_regs():

- Doesn't allocate if the caller already allocated. ...but there's one
  caller and it doesn't allocate so we don't need this check.
- Checks for allocation failure over and over even though it could
  just do it once right after the allocation.

Clean this up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 4d55e3cf570f..07a2c1e87219 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -25,24 +25,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	addr = base_addr;
 	end_addr = base_addr + aligned_len;
 
-	if (!(*reg))
-		*reg = kvzalloc(len_padded, GFP_KERNEL);
-
-	if (*reg)
-		dump_addr = *reg;
+	*reg = kvzalloc(len_padded, GFP_KERNEL);
+	if (!*reg)
+		return;
 
+	dump_addr = *reg;
 	for (i = 0; i < num_rows; i++) {
 		x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
 		x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
 		x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
 		xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
 
-		if (dump_addr) {
-			dump_addr[i * 4] = x0;
-			dump_addr[i * 4 + 1] = x4;
-			dump_addr[i * 4 + 2] = x8;
-			dump_addr[i * 4 + 3] = xc;
-		}
+		dump_addr[i * 4] = x0;
+		dump_addr[i * 4 + 1] = x4;
+		dump_addr[i * 4 + 2] = x8;
+		dump_addr[i * 4 + 3] = xc;
 
 		addr += REG_DUMP_ALIGN;
 	}
-- 
2.47.0.rc1.288.g06298d1525-goog

