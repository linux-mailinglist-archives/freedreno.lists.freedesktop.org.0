Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SxjmIP6HcGmCYQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 09:02:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9CD53318
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 09:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9B310E6D1;
	Wed, 21 Jan 2026 08:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FVeJuIyL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48BF10E105
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:02:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0834769f0so43234475ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768982522; x=1769587322; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SqFvFXu0jGZHtPXoUYA9xsq2a6yDeDGBB1pPLJQJ1aA=;
 b=FVeJuIyLb7QKjEz6tHt6JlqdXOewqg4WR3i+VSMgQyHZzAgVZt0NJGFDvYQ2FQ2CFB
 hn6FqPbIUEWjDWE6NaylOfRBGAFuO7MC8CWRpw8C3d8UHfUUkHCXQ0ZgFYuylT3TBkdN
 HqLZN4huBFNaoV4axkWSV2itNQ3Mnb0nwOWgXiPg4P3d/L/UVUR5+vx3Vw+jZG+EjsnA
 0dndmVw5fPhRaiyQFPy8hLFs/ty34RwWRv0UIznK0BIiQfbtOwM6xtU9J5ijlMHreVLh
 hfsS/1u963OBFOgYke1XDogvh6tr+0EFabDKH3K56OjDmFzXQL5ZCq1zVReZZQnBqe32
 8HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768982522; x=1769587322;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqFvFXu0jGZHtPXoUYA9xsq2a6yDeDGBB1pPLJQJ1aA=;
 b=XHZg8n9OYUXfKeQlQADt4fpi2AQimz/JliDZpCHTRmo+wFfsGpHbLJPJn6DltR6gub
 L+VXJ49usWF5aH9E54mGOaQqg5I2mGv2omxCQiZkPR/A2zFdy2PgP7KC+zqFwoX1VytX
 iFm9TWcrEUCYblCcNeAGB84bkeCXoHl4DPuNEF+soXTjHNeHLrOw89X+ZYuSGRS+vPtM
 p4YsjTw52Ou6qPcsbio5XlXzK2gPT9Z6+fprcQU7eGTuRqvYRRHuuNomMNSIywUgAbQL
 6N+hn69tuFnJtm+QqViEOGtWdoo6fENV9SGlQ8tmvxEHuhJXsV7ao+xy2iRuJRTwTuW8
 B3GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFyrOBs8uFA9KELvg5zKoEsvJO3bAtm875beVo/g4YpCIzNmoZfg4pkp6KN+lngvRcmdlL6gmH0LM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypgsI2Bv3BiCR1lRGAorXvIfSxqFYkQudhWyes5SwS55EN1z6W
 EXeld58SM41kkLWhGPfnoZOisRj+G8iWOWiRJP6O1Oai6CeaKG076q7iw3yhLvmLHuM=
X-Gm-Gg: AZuq6aLmu4v4D15XupHUS9YaOhPXfy3v8qaBZI5TddrJr11mIgkqg22K4Qb504KDUxN
 gq9ua1naXoCkCPPU5Y/6j+43sMvA2RFFM3wZm40Ra5dWCyGsGG2qZTK4BOkABHFapWJ5ZysCKSE
 YzmvoUU32xzf69UKADMXqOe2x714bL6OLC3SjW2fQ70AfeCG2h4vdXVvCLDJf0CtuNUxty/6fWd
 NnPdqnJXA7Jx8PE8lp88LUw6GX5UexOd5Pguh1wdv9Z0/Ny4ZMbiWNMXKLwNFo6fYZ6BufBJOWN
 O2XIRLI8KjHgLSGLnukzYZoEwzAPQ2BlDyN04Xsqak1RkFuffCxKlFU6XHh41fAolg+jfTRRchS
 GfWGPUuJGRQ82R1ISx0m5rNxH6N5G3fEV/fw+TEllSQD273mm4HtECpjWh7WgKoIbIIYLG+k=
X-Received: by 2002:a17:902:da8f:b0:2a0:9d16:5fb4 with SMTP id
 d9443c01a7336-2a7188896d2mr184266045ad.18.1768982521970; 
 Wed, 21 Jan 2026 00:02:01 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:02:01 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v17 0/4] drm/msm/dpu: Support quad pipe with dual-interface
Date: Wed, 21 Jan 2026 16:01:49 +0800
Message-Id: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2HcGkC/x2MQQqEMAwAvyI5G7AVXdaviIdqUzew1tpUEcS/W
 zzOwMwFQpFJoCsuiHSw8OozqE9ZwPQzfiZkmwXoSreV0goXWdDTmXDbjcXAgVDCnxOa8duMLdX
 O2RpyHiI5Pt93P9z3A40cthNrAAAA
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=8902;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WnMaF78Y5j5jsDtvdu33Avxi2Q4yFc5RtwudZjqJl5o=;
 b=R1Viwafw2T0Yz4dzFH+erRLeucXxdiR/TRAfJCEE/4QhCwkSept65by4trdOIoGieQX2tAgi0
 xyU1bdt3XwlCD2Sno1J271+iUHMxB/EtdREq85bjEVrOZq7Q/GkrXYU
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jun.nie@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EA9CD53318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

    Changes in v17:
    - Fix iommu warning on Hamoa.
    - Extract plane splitting into a dedicated function.
    - Defer plan splitting and SSPP allocation until CRTC check
      so that topology information is available.
    - Add virtual plane condition to quad-pipe topology so that
      legacy devices are not impacted.
    - Drop the merged 8 patches of v16, only the last 2 is revised
      and sent here.
    - Link to v16: https://lore.kernel.org/linux-arm-msm/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org

    Changes in v16:
    - Rebase to latest branch msm-next-lumag.
    - Fix IGT test failures.
    - Drop patches that have been merged.
    - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org

    Changes in v15:
    - Polish logic in sspp check and assignment.
    - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org

    Changes in v14:
    - Add patch to fix null pointer bug SSPP sharing, which is missed in
      the last version.
    - Polish single pipe check with removing loop.
    - Polish logic of SSPP sharing test in dpu_plane_virtual_assign_resources()
    - Polish argument of dpu_plane_virtual_assign_resources().
    - Link to v13: https://lore.kernel.org/r/20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org

    Changes in v13:
    - Modify the SSPP assignment patch for sharing SSPP among planes in
      quad-pipe case.
    - Link to v12: https://lore.kernel.org/r/20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org

    Changes in v12:
    - Polish single pipe case detection in a plane. Add stage index check when
      sharing SSPP with multi-rect mode in 2 planes.
    - Abstract SSPP assignment in a stage into a function.
    - Rebase to latest msm/msm-next.
    - Link to v11: https://lore.kernel.org/r/20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org

    Changes in v11:
    - Change function name from dpu_plane_check_single_pipe to
      dpu_plane_get_single_pipe.
    - Abstract SSPP assignment in stage into a function.
    - Link to v10: https://lore.kernel.org/r/20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org

    Changes in v10:
    - Drop changes in drm helper side, because num_lm == 0 does not lead to
      any issue in the first call to dpu_plane_atomic_check_nosspp() with
      latest repo. It is initialized properly right after the call in
      drm_atomic_helper_check_planes(), thus the later plane splitting works
      as expected.
    - Rebase to latest msm-next branch.
    - Fix PIPES_PER_STAGE to PIPES_PER_PLANE where handling all pipes, instead
      of stages.
    - Link to v9: https://lore.kernel.org/r/20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org

    Changes in v9:
    - Rebase to latest mainline and drop 3 patches as mainline already cover
      the logic.
      "Do not fix number of DSC"
      "configure DSC per number in use"
      "switch RM to use crtc_id rather than enc_id for allocation"
    - Add a patch to check crtc before checking plane in drm framework.
    - Add a patch to use dedicated WB number in an encoder to avoid regression.
    - Revise the condition to decide quad-pipe topology.
    - Link to v8: https://lore.kernel.org/r/20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org

    Changes in v8:
    - Fix looping pipes of a plane in _dpu_plane_color_fill()
    - Improve pipe assignment with deleting pipes loop in stage.
    - Define PIPES_PER_PLANE properly when it appears fisrt.
    - rename lms_in_pair to lms_in_stage to avoid confusion.
    - Add review tags.
    - Link to v7: https://lore.kernel.org/r/20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org

    Changes in v7:
    - Improve pipe assignment to avoid point to invalid memory.
    - Define STAGES_PER_PLANE as 2 only when quad-pipe is introduced.
    - Polish LM number when blending pipes with min() and pull up to caller func.
    - Add review tags.
    - Link to v6: https://lore.kernel.org/r/20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org

    Changes in v6:
    - Replace LM number with PP number to calculate PP number per encoder.
    - Rebase to Linux v6.14-rc2.
    - Add review tags.
    - Link to v5: https://lore.kernel.org/r/20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org

    Changes in v5:
    - Iterate SSPP flushing within the required mixer pair, instead of all
      active mixers or specific mixer.
    - Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
      interfaces case.
    - Remove valid flag and use width for pipe validation.
    - Polish commit messages and code comments.
    - Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

    Changes in v4:
    - Restrict SSPP flushing to the required mixer, instead of all active mixers.
    - Polish commit messages and code comments.
    - Rebase to latest msm/drm-next branch.
    - Move pipe checking patch to the top of patch set.
    - Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

    Changes in v3:
    - Split change in trace into a separate patch.
    - Rebase to latest msm-next branch.
    - Reorder patch sequence to make sure valid flag is set in earlier patch
    - Rectify rewrite patch to move logic change into other patch
    - Polish commit messages and code comments.
    - Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

    Changes in v2:
    - Revise the patch sequence with changing to 2 pipes topology first. Then
      prepare for quad-pipe setup, then enable quad-pipe at last.
    - Split DSI patches into other patch set.
    - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org

To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (4):
      drm/msm/dpu: Extract plane splitting into a dedicated function
      drm/msm/dpu: Defer SSPP allocation until CRTC check
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  42 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 270 ++++++++++++++++-------
 7 files changed, 237 insertions(+), 118 deletions(-)
---
base-commit: 837f96989da508a94e1db77e6c5ba36a60dd010b
change-id: 20260121-msm-next-quad-pipe-split-ab95b6e3ffd3

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

