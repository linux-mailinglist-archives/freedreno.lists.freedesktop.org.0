Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFED9ED9F7
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E50D10E169;
	Wed, 11 Dec 2024 22:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="khNmPFqd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A452710E163
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:35:42 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-46772a0f8fbso27992721cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956542; x=1734561342;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=WkXMEqZ/gF/xnWJ/mhzzg/miOHHNVWajJShRngxnHGY=;
 b=khNmPFqd1PT6t91gqvE8KR6hkcncdZ5bBfvzzNvS//V4iPoJCWd1FJJQ238hAEcsnc
 7w4B5bpJ11Rva5tQqgkIbpHl+AvVMcwGetnMhl1UVy3zItThLceutYY+p+5wPpHPLsTg
 /gIQkFMeqSlNTjZ+hZKdQmcaO+GDbohRayR/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956542; x=1734561342;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkXMEqZ/gF/xnWJ/mhzzg/miOHHNVWajJShRngxnHGY=;
 b=ifk26LHi6j71GWk5URgVDO8S98gsCXrX8D2a5DQVS2svDIigjbL1Oks3dIDaJJK5Kx
 FtUSomym9NmLtHD8ZEREQ/1obNbz0GoDIzBP+ett+yBcolFv1fupdR0MQ4b7yqI/2m0J
 R6eVeIOp9F/MwfGbcqyiXTQ+jliuQ7Yzg8bJq/K7kGU8/OfXj4LYUF3mqSsQk7TVpM78
 m7VIao0lm4v4a6Pm5e8gqv1Iw8zCUPxlbWnmVWUTTEkL7ErzC/uJzogkjG9U9wUyuwN0
 kKN35O8WMEoscq0SWTyDT7+0JoI/GEl261UyCbMOTX8LruePF7sr7hZ28ufSGBQ2rPM7
 Fy8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHsFjU+UDFVuvG9hySeAqie5U8q3ROSqnveYr43LaGahC48CHt/7nOPzrooGwHPJqDJC7C8PAWk5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcFXxTXJbuMvmW/ZV3w16DSYr0H7/FDKJXS+0w6gc3VQ77bVhK
 S3UOUxw+4rmCQdPUQSWF2jeJEEniHMn+XiM+t1wshj+ezqZS80J7vTgwRc+vvB554jU3odeUfEo
 0TiVzOhMo4yw5eO3FtkfEGZxbffg/Ko51qNYR
X-Gm-Gg: ASbGncudkELd1svHByRLyELZDolw/n0kG/Ls7aZ4e62SgvpFQ+FBhcYITxA1qxGoVSJ
 T4DxmOQxDSt5h/gY/tR1SGS/xbtHqouhd2c0O4BGnBFPWVAgv6JM/x38j+t7pV1LXvA==
X-Google-Smtp-Source: AGHT+IG9f7BHz8iDa6A37ISXD8md+OMJZHRpC/Cm+CFql7zV4E9ytytJpMb018vR23ZL3eujA5g0+FW3B1/RL8ezpns=
X-Received: by 2002:ac8:5e54:0:b0:467:43c1:f0ea with SMTP id
 d75a77b69052e-467961786bbmr14756091cf.16.1733956541804; Wed, 11 Dec 2024
 14:35:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:35:41 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-11-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-11-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:35:41 -0800
Message-ID: <CAE-0n52kSzNeFazUpL0e1C-tTZHv7nzOCYinYCX72pKk-E9_XQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dp: move/inline audio related functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-12-02 02:06:41)
> Move audio-related functions to dp_audio.c, following up the cleanup
> done by the rest of the submodules. Inline functions with simple
> register access patterns.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
