Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B968BEB6BA
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 22:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8B10E19B;
	Fri, 17 Oct 2025 20:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X0F7mGFP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A0110E19B
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 20:00:28 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-36a6a3974fdso23766111fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 13:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731226; x=1761336026; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W7XqOWl1cfsF52QRqm2uO00zKVuXynKW/bvPOkip0X0=;
 b=X0F7mGFP7zPjkhlwbBApWtDGT7/E3xrZciX0EMIfpteCIKuxd7MZhemAhHVu8Dg5cs
 h1ggOJPmrP2rK7asfvpF88Svynpt+cAewwVffDsOPEnLT+7wFvYXolQu1dfa9CaD6Y6m
 AeaZYlmaQhiD8NM7nCgM4BPNihzsIgsPDzNE5igm5kNF/rT+RFWFDTcW6txwrcv3wcso
 zkXTC9ylu+ohn264RnB1sjMyXbwER3HfJ4/XpRNBsunz0CoEOAT5YWyB6FRTRGHbgMel
 j4MRvRojWeDOPhdPcekpNW27parAECaWmUD6wYkQguK2YnXHfaVlS0GOtJpJMfJKAiNF
 bPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731226; x=1761336026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7XqOWl1cfsF52QRqm2uO00zKVuXynKW/bvPOkip0X0=;
 b=hd6I7pUxGVi/t1PrMHPNu/XJ1uzCrszZysDuFqb6gdXtIG/vvH6DBxE88Sri9H8ZqK
 1ulFm38fS08fh9eWg2dVuW2dzQJjaLIeltMy0sXHOVurUf0bYuF3rHjWN5vZDgKYvghi
 R+fnb8Qp1da0rxAzjUYfPIEOfR6pnS/riP5cqVuD9hX+QjyCc7L3ljjnxE0KJ9yTkQPA
 eWClfFYiHm3+a0ZPEFQV0Q2tjW+ahTGXxSHGQUXpfYAm267CC18rY9JqZXFH2aJoD04r
 AEaVIanYs6cggugSl8VsRNxCctEulkQgJ4rNuiKbhmU3A3WgDvHLyZQGF6BAf0vm21OR
 CJFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCR9c+955gkcoEs8tzVRi7s0apXcLpmaksCFp9GDifPImI5D7lZMAR+HAoodysT/lVjJu6M3stB48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTuaG2Zc/rlXZSY9T51j5gGQDHZ3AEPJpilYudTlXYyb3W2u7z
 R1Wa63KnN/4KhI9WMtIS+vKDmTyXZ7YtNKO/nHDOuYeg3ZSVf40gg0d7
X-Gm-Gg: ASbGncuAw3m8zSsM2pOHcM6YTtoSr29bhftIhRd9g31zkOM8Lpvyug0Y6vQ8Q3ZG2gm
 dvTAcgAtAoMhslX00jRHoTnBl2QJ4+oFaw5JQ2TRwrUYrf43p3/gmlIJVU/yvHNCiLPcQsg+2ED
 TtHDspemR+iEHQO5VkJq/9J2q3tSWhq+Ab7VTwHW+BiEIHef+sGyLPE86t4YY9gIxedWDmdNg0N
 simEyD4L0Z/xnMfWmzo7Dz0lOl8iUG323O7aO0DS/+UaHfoEBs/4Zm8y0A3RSB8MxQVixCQQCFH
 e+zIUAFEdj4S8Hy0nzeySKiiARC+jJKzLwUWvacdP0vwlSr9EUDOjNCfDgRxe3B6gE5PqkkWoRp
 /bDCLfWndKOiLcNg+w6rHugbk4U5mP7Lf1gldIvwmT5UVIdSLErM/9NTngm+q+YvMR1/lgdG6dx
 0vtACGh3vyTmrV0x63mku7lWMQrApy4F7/OTWr8X6ulyiJj0xut90=
X-Google-Smtp-Source: AGHT+IFrm/3xtNQT3MBQMvkncf7kZPyKKqAIptXvvBOXIh8nfNhykS0BMD1amwffzbPJvG3jZUH5AQ==
X-Received: by 2002:a2e:bc11:0:b0:36e:f1ae:d4bc with SMTP id
 38308e7fff4ca-37797888c0cmr16609961fa.14.1760731226308; 
 Fri, 17 Oct 2025 13:00:26 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.13.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:00:26 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:36 +0000
Subject: [PATCH 2/6] drm/msm/dpu: Propagate error from
 dpu_assign_plane_resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-2-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

The dpu_plane_virtual_assign_resources function might fail if there is
no suitable SSPP(s) for the plane. This leaves sspp field in plane
state uninitialized and later leads to NULL dereference during commit:

Call trace:
 _dpu_crtc_blend_setup+0x194/0x620 [msm] (P)
 dpu_crtc_atomic_begin+0xe4/0x240 [msm]
 drm_atomic_helper_commit_planes+0x88/0x358
 msm_atomic_commit_tail+0x1b4/0x8b8 [msm]
 commit_tail+0xa8/0x1b0
 drm_atomic_helper_commit+0x180/0x1a0
 drm_atomic_commit+0x94/0xe0
 drm_mode_atomic_ioctl+0xa88/0xd60
 drm_ioctl_kernel+0xc4/0x138
 drm_ioctl+0x364/0x4f0
 __arm64_sys_ioctl+0xac/0x108
 invoke_syscall.constprop.0+0x48/0x100
 el0_svc_common.constprop.0+0x40/0xe8
 do_el0_svc+0x24/0x38
 el0_svc+0x30/0xe0
 el0t_64_sync_handler+0xa0/0xe8
 el0t_64_sync+0x198/0x1a0

Fixes: 3ed12a3664b3 ("drm/msm/dpu: allow sharing SSPP between planes")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f54cf0faa1c7c8c00eb68b8b45ca2fc776f7f62f..d198a65a2c5fef5fbdebc9c383a4b08bc71b8bf3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1278,7 +1278,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 							     state, plane_state,
 							     prev_adjacent_plane_state);
 		if (ret)
-			break;
+			return ret;
 
 		prev_adjacent_plane_state = plane_state;
 	}

-- 
2.51.0

