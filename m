Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4489810674
	for <lists+freedreno@lfdr.de>; Wed, 13 Dec 2023 01:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CC810E14A;
	Wed, 13 Dec 2023 00:28:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D2010E159
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 00:28:17 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5df49931b4eso40383587b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 16:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427296; x=1703032096; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
 b=L8N718WG2MXpQ3SV4JlfnEWwu1RGGJLtFqhBBW+NXOXBjhgPuL+KSkxrCAdoUj2Cq5
 4XUK6uPAzCcbY8vBVoJcSwZhlwowpBaEMA6T1KmaRSUmr6hx1LdzAf6j+X3w0FTodl6C
 vXnbaTiiySHqIpOQmsXgkIYqsquYltUMvru/5bynhpDyZpd4bzLrkZDCE2BQzHR/5+vg
 GXmwwJuPYtfIuqG/1BosK4M2dLXABacj3uQqCjWWmeiPw4bmgkWmVcdEvAV7DFdc4apJ
 uyjWvNnMeTiFL22NAROrUAN1dPmBl5a+yKsO5P3bVHnKJEusu2HPNfHJ/EbGNq38EIr1
 pvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427296; x=1703032096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
 b=e2p2YugznRbWkvrHxhV4x+z24lVqR4RP0tDHEwz4Nqq/Ga5FsKxVhaPamVvTUE/ilV
 opF5pNx0SBgvVhVufSr0PVuzh4XTWojruSq4FsvGMM3Dy8fv09L0+53FlFMA4EasgdXm
 mNdMOQ6ujW/yU2lTBpldzFs3qGDl8coCjq2y+Xb1LH5Po6WDAlVhSipcSnMtoPCZSNaL
 DmwFjU0nez61oJLQwfn1HqxbW3VKTYHeLRKCqiJqvjq5+cUCHBYMQ5e9pKm1UEH63N7g
 MV/yJ4Q68GzGWgtIuy8dbUbbWdNdn9n2TWm/A7vkJN7gSX3cpDWRMFm4DOaOZrtNJqgq
 tiOQ==
X-Gm-Message-State: AOJu0Yz6SU0YKZ3TbQN01Bk53c0+C0/7sDJm1kcSXZWvpszwCsHIujjn
 za7FgD1sABtzpEzdq7X3mkdVwdvfJOdqIoCc9viPm4XP2Atyp4SYgmkt+g==
X-Google-Smtp-Source: AGHT+IHG/jUedozgL5SGa448xXkNlA78a/sNsmuZlJogKjmEDh0VLDGbZPHcXZSz85VeopQiVm5cQCRmqKovzMN83i4=
X-Received: by 2002:a0d:cb0c:0:b0:5e2:bd18:b253 with SMTP id
 n12-20020a0dcb0c000000b005e2bd18b253mr87186ywd.24.1702427296677; Tue, 12 Dec
 2023 16:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20231212231101.9240-1-quic_parellan@quicinc.com>
 <20231212231101.9240-2-quic_parellan@quicinc.com>
In-Reply-To: <20231212231101.9240-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 02:28:05 +0200
Message-ID: <CAA8EJprRknmPSh-7iYMp6vBxcbBDSyp4fyD3VtXUxeVzp-F2vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/msm/dpu: Add mutex lock in control vblank irq
To: Paloma Arellano <quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 steev@kali.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 at 01:11, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add a mutex lock to control vblank irq to synchronize vblank
> enable/disable operations happening from different threads to prevent
> race conditions while registering/unregistering the vblank irq callback.
>
> v4: -Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
>     parameter of dpu_encoder_phys.
>     -Switch from atomic refcnt to a simple int counter as mutex has
>     now been added
> v3: Mistakenly did not change wording in last version. It is done now.
> v2: Slightly changed wording of commit message
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
>  4 files changed, 47 insertions(+), 23 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
