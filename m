Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B7CFD757
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 12:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410E10E597;
	Wed,  7 Jan 2026 11:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="aq/OpJsY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17310E595
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 11:45:39 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so1094860a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1767786338; x=1768391138; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ob3g5q5jWnPVuY+nnqbiqZRINNocwJ2SJ68hLxsq1uU=;
 b=aq/OpJsYNN0kWw5qu6CQjphtw+eDNPfwF8DTO72RBJC9d/k9oQSJWOIZtIDT2QMYFb
 6buZE1hg1ua02+ihdZ4NE/3ZUN+BiSTyLESdFSGosL1YUmPCHmF7Y4LEX7sI5EGialPB
 6C4osroRQg4Z2hMG9Q6g6U8Hbhkk9axrs1wpajTg7IHerD+hqvTlGs2DTy3TBQF33KZf
 0zPp89bOZXyIHIR5wibfNiKHDx+ZP05ep6u5149xKGmXwlztvdv0nm95u+TvcROm1/dD
 YOfOuAW8aOSiJd13mwTKsoOeoWA7O65j8H842KlazO7sP1LnJugHjYTv4vO5OZM39Fnq
 NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767786338; x=1768391138;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ob3g5q5jWnPVuY+nnqbiqZRINNocwJ2SJ68hLxsq1uU=;
 b=UCYy7Ew8Gpchi+VgBGlTBAhGRzwr/thBttB70S9mT0jfqyVd6yZggMZ/+4Z6+axjji
 3DlKKANwYH6XG5VPlDyf9oriNITbQeeNQnrE6kYLUFSBLFHD+Iz8utkcUPvDpmuTMgHI
 ygmRerTssOVN1fBpvEkPYItFC8iN0nXmuBVxRXPeAwnBmeAuwVfc+GBahxw4BEAk458T
 7CXB+0lZDJeB5lwV6m6uif4rrvAovp5lYdMRKMOuBZ1V/Dhu/5RgoIwz+iBOTVB44Ph6
 9iKyJO6xNSeBG6nxXesTVTU8ZF3j+XITZbdn/UIEgA3+omr4WbghGPTD6W13iEllbAPt
 pkGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1qeZUSGQbJLdbTX9tQSc+POyZ3fDPRjf0Hkmx+7sJ0bbn+JaI3JVU4LNO2Ic6nI4ptUFAhfAJYU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYPXP2/flLOcK0/7pj/VpOiDC7+bi4hhXE64XnrYHoseSHQoqL
 6zpxuHzoLneTT8XV78ZxEGAfkAqF7nyptS/Dxgl9ks0ND63QK5VqQymedOuewHAacdw=
X-Gm-Gg: AY/fxX7AsZ0VRxw2j2n3JBTsminILnev2/e+0QfivSoWQcp2PrVD/jku75A1oXyBURH
 qklOaPlYQAMahQ+fvxWd1kYfpHitPs9tvrVkicku91d8yFQOVUwprVjOGnIzZOZd085nn11xcbH
 wfNVJOjyivN9uAoNhQP7yTarYsAbsZfWNnx0X+9NKmsWUi1Qb9n69xVAXCFSWloRsfdtLNtxczP
 +pT29vv0QzWhRDjuUoxME+sUpvxIyEk7aZFxlFhFa4oOawnzZ+uPGz+lP/lJVe7lFjalkMfhkfk
 7OW1gtQaa53EC4FjdSqieVhKhW9RSPeD4VO6ofaKDVit3kQS+y08xGi2LJjkHbaJf8T8Tnj56fd
 HLJyFlKSXYJBvvZEmH61y0YFDOy47SIginXnWRrvGxiJiB0S95ITwQ3Eu5TlCjwFCCZIIzXvLAE
 pwNKSmnk4A/WiuTg==
X-Google-Smtp-Source: AGHT+IF+cPqxULnBUelcUpCMFoIf2W5SbdC3yAUiVTr+97+8pbT8Xepe9yvm6GNT+o8qSLb+2Lu6+w==
X-Received: by 2002:a17:906:ef0c:b0:b79:eba9:83b4 with SMTP id
 a640c23a62f3a-b8444c5a60bmr291635566b.6.1767786337696; 
 Wed, 07 Jan 2026 03:45:37 -0800 (PST)
Received: from localhost ([195.169.149.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d0290sm483752666b.32.2026.01.07.03.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 03:45:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 12:45:37 +0100
Message-Id: <DFIBYFY6L63Q.1A8WFXEQ7DYUT@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jessica
 Zhang" <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jordan Crouse"
 <jordan@cosmicpenguin.net>, "Jessica Zhang" <jesszhan0024@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
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

On Fri Nov 14, 2025 at 4:43 AM CET, Dmitry Baryshkov wrote:
> - Rework mdp_format.c in order to make format table manageable
> - Rework layout population for UBWC formats in DPU driver
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v3:
> - Readded disappeared YUV flag to PSEUDO_YUV_FMT_TILED
> - Link to v2: https://lore.kernel.org/r/20250905-dpu-formats-v2-0-7a67402=
8c048@oss.qualcomm.com
>
> Changes in v2:
> - Dropped DX flag from the tiled NV12 format structure (Jessica)
> - Changed round_up(foo, 192) to the roundup() as the former one is
>   supposed to be used with power of 2 argument (Jessica)
> - Fixed undefined varuables warning in
>   _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
>   condition (LKP)
> - Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb3=
1b8c8@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (12):
>       drm/msm/disp: set num_planes to 1 for interleaved YUV formats
>       drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
>       drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLE=
AVED_RGB_FMT_TILED
>       drm/msm/disp: simplify RGB{,A,X} formats definitions
>       drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
>       drm/msm/disp: pull in common YUV format parameters
>       drm/msm/disp: pull in common tiled YUV format parameters
>       drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
>       drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
>       drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_po=
pulate_plane_sizes*()
>       drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
>       drm/msm/dpu: use standard functions in _dpu_format_populate_plane_s=
izes_ubwc()

Seems to work as expected according to our messages in IRC, no issues
seen booting up Phosh or SuperTuxKart.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
>  drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------=
------
>  drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
>  3 files changed, 391 insertions(+), 1552 deletions(-)
> ---
> base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
> change-id: 20250705-dpu-formats-0d5ae4d1a1b9
>
> Best regards,

