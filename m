Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D64B18474
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 17:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99610E8A5;
	Fri,  1 Aug 2025 15:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yPcVo0sL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C184810E16E
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 15:07:54 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76bd9d723bfso1116018b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060874; x=1754665674; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6HElflEfsinspJ/DdnkdPizhD2gGfhcyAYKhTylGTXk=;
 b=yPcVo0sLWqZKyzvasDAfvQyybgo4Omr/Xg7EjI5xh1RB5Hizc/DMZQYFk75DkimTZB
 aQyY0nQLlUT0HYnAEv4F0xoK7WCwY4AAqIuHweij8lZkI6ODYrbaasjv93YY9E2QIJtb
 5/v+qz31+30bovcte8xGQ+FD/Qzx0nhqXL4HA7X/tbAhSaJvZDlfShISixK6r2E8hkTb
 vnAoRW9/N6sqfkP7bD+34bBc8OPEj6wJ94nTMYIEKpYXY6mazE1U1ySVP271gN2umAWN
 24KkEWHSHU4BKoVJcxGfeG2TBxKp2WNhqlMVI4mulR7sqVrh7MV1mwMmX24ezcuGsYuS
 ge7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060874; x=1754665674;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6HElflEfsinspJ/DdnkdPizhD2gGfhcyAYKhTylGTXk=;
 b=fScO5PNW8xi/bgntamaGlH9qJB4R0rzfSJvtd2YF+DIL4u4+VNvSS9iMGeD5mZ3aee
 M1l8JTqZkx3RIFiezihWwOezsWh4w8JmJRWZgpPPlpi9Ra1ILjje95ACozyVgv8pLw80
 fW/0P44pFHUmydPiITAEBRzBttCT9fyG5c93rlnzYnywagqnm2ubRbArFz20Z8jcHT27
 hrM6BXP0ZmQJtEi/MvR23hwU48V3ItUa/0e/9EX7HNMMX/zFcUumo0pvftZWqAZAFanS
 ZHRTebG1s5cq3zKetk8PpmBI/vYl+z6b/LzE3PgBHKMPGd0zabcPr6rA5tBuJKpw9pbm
 ky6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURwz8/+rmL0GCpIlvOeUdKUcvTpsVJHxufaiOl5trbY5KMKp6wmhs01UKWlXPcm08vL5Xh1D/HLD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXBxhppuRFGY6+AzT2T96qiEovNYY+R2QjIJ8MOu6nl7icBixR
 30ti/JIG33w+eikjjRb9ssDpFaym/rPGdkRy9RSBwrCCE+133UJ43DHdTyqPF9nProI=
X-Gm-Gg: ASbGncs8qgMPnk1Z2HhsTFccI4QybaAdvx7YWVug3wZEe5zAx+x4wd+Aq85aVf4RHVz
 KUWsNym2EfB5952qaFh2svppblkA74o1J2BXv2R4COhw4nFIRAlkP/VtoTBt9I0bmBFPaWQ9ck1
 5UKxTP9TOn3f4xeg6bZMlEnd5Dlu//SBDjlt6EOxUvxJbwN8AMBQsK1jce6v4zb0UVCELkXxkCZ
 rfkKNq2xlygR4E9eq6szwu1RuIL3C+Yqv8mnzC3LzaXWGTef3EMKmcMjYGscZJ8rXLLtDFY+ua6
 6cT9MLU6rSKi3D+yyiMYhoLGYPPIxuV+VqPRJdm5fDBv320/ImTTZ+26vd19ymRTA26vTy9TlZd
 0zvC44jPXivkqLPVLNQ==
X-Google-Smtp-Source: AGHT+IE9vqhvZHVeT2mesAM1GoV9wuun+cXk6KfC6cbfEqNe+tQq56rzrKH9YVTcF8lX6urjV3i3kA==
X-Received: by 2002:a17:902:f54a:b0:240:72bb:db0b with SMTP id
 d9443c01a7336-2422a44ca8dmr44336005ad.21.1754060874033; 
 Fri, 01 Aug 2025 08:07:54 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:25 +0800
Subject: [PATCH v14 01/13] drm/msm: Do not validate SSPP when it is not ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-1-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=5074;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=9ht+oIknXVETOXX8rjQohyBmYIl3DM9qFfNv7xyAMHw=;
 b=txR5i6WizSOLGRs/7BMXzQAU0nKVyjbxHVukZQ/EMqT9W+Nb4Xv1Vm4H3G5WMpW8AO5I1+XCC
 lUlzaIVaIlbB7DGl8SP4EMx7fDB32CrHU9SclrtBoYhG7+UzYRv+plf
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code will validate current plane and previous plane to
confirm they can share a SSPP with multi-rect mode. The SSPP
is already allocated for previous plane, while current plane
is not associated with any SSPP yet. Null pointer is referenced
when validating the SSPP of current plane. Skip SSPP validation
for current plane.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000888ac3000
[0000000000000020] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1891 Comm: modetest Tainted: G S                  6.15.0-rc2-g3ee3f6e1202e #335 PREEMPT
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: SM8650 EV1 rev1 4slam 2et (DT)
pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : dpu_plane_is_multirect_capable+0x68/0x90
lr : dpu_assign_plane_resources+0x288/0x410
sp : ffff800093dcb770
x29: ffff800093dcb770 x28: 0000000000002000 x27: ffff000817c6c000
x26: ffff000806b46368 x25: ffff0008013f6080 x24: ffff00080cbf4800
x23: ffff000810842680 x22: ffff0008013f1080 x21: ffff00080cc86080
x20: ffff000806b463b0 x19: ffff00080cbf5a00 x18: 00000000ffffffff
x17: 707a5f657a696c61 x16: 0000000000000003 x15: 0000000000002200
x14: 00000000ffffffff x13: 00aaaaaa00aaaaaa x12: 0000000000000000
x11: ffff000817c6e2b8 x10: 0000000000000000 x9 : ffff80008106a950
x8 : ffff00080cbf48f4 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000438 x3 : 0000000000000438
x2 : ffff800082e245e0 x1 : 0000000000000008 x0 : 0000000000000000
Call trace:
 dpu_plane_is_multirect_capable+0x68/0x90 (P)
 dpu_crtc_atomic_check+0x5bc/0x650
 drm_atomic_helper_check_planes+0x13c/0x220
 drm_atomic_helper_check+0x58/0xb8
 msm_atomic_check+0xd8/0xf0
 drm_atomic_check_only+0x4a8/0x968
 drm_atomic_commit+0x50/0xd8
 drm_atomic_helper_update_plane+0x140/0x188
 __setplane_atomic+0xfc/0x148
 drm_mode_setplane+0x164/0x378
 drm_ioctl_kernel+0xc0/0x140
 drm_ioctl+0x20c/0x500
 __arm64_sys_ioctl+0xbc/0xf8
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: b9402021 370fffc1 f9401441 3707ff81 (f94010a1)
---[ end trace 0000000000000000 ]---

Fixes: 3ed12a3664b36 ("drm/msm/dpu: allow sharing SSPP between planes")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 01171c535a27c8983aab6450d6f7a4316ae9c4ee..4371c8e1602126bdd0860c5de263db3dd2d3291a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -910,7 +910,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 
 static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
 					  struct dpu_sw_pipe_cfg *pipe_cfg,
-					  const struct msm_format *fmt)
+					  const struct msm_format *fmt,
+					  bool validate_sspp)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -922,6 +923,9 @@ static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
+	if (!validate_sspp)
+		return true;
+
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -945,7 +949,7 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 						   const struct msm_format *fmt,
 						   uint32_t max_linewidth)
 {
-	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt, true) &&
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
@@ -1028,8 +1032,9 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
-	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
-	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+	/* Do not validate SSPP of current plane when it is not ready */
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt, false) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt, true))
 		return false;
 
 	if (MSM_FORMAT_IS_UBWC(fmt))

-- 
2.34.1

