Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C81885C4D
	for <lists+freedreno@lfdr.de>; Thu, 21 Mar 2024 16:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935DF10ED9E;
	Thu, 21 Mar 2024 15:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jSBPtb7V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5B310ED9E
 for <freedreno@lists.freedesktop.org>; Thu, 21 Mar 2024 15:43:38 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso1053662276.2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Mar 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711035818; x=1711640618; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UpgzR9qYFt2DVUXh+ZlrB3kv/cSpRH2o+XXZxpbADmA=;
 b=jSBPtb7ViMu6AgJTS1V2ksmzn7X3N92Yud4vvmpUZygARYcuYJV2kWv7IZPm77a//A
 4oqGPyNRzMdxaw0ttrqLF+wJp1fawehMf/Zr7hAg9gnYNCcZYQlsyB2qT2W/U7Svai8m
 ykxnW4l2s2ozNrjEJbYkitD+p0PGoES0trNkqaRjAQSR3Zj3bArc2j1sm1hfcUiNUlmp
 F/CqjxnEcP/muELd4kmXJDBOWEt6LTQ7UZ2TVyp6E8N/hkdNpx611QJNrFAVoc1qB4EH
 ITCdvnEM/jXwzCw/lEIaAmGcxa0jqY9kR2wFxW5IQ0hPOzMeZcgI8rlCnf4vhNdStcAZ
 /Kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711035818; x=1711640618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UpgzR9qYFt2DVUXh+ZlrB3kv/cSpRH2o+XXZxpbADmA=;
 b=EVbsf7yB0UV5TaQPtOurKs/V9dZoy9q4yTPvCY0zftlMpAa4YqRdMK2CPeYb1Lz8l7
 N+ZizmY20VmPsBCAQ3efgzezRDw+Wi4nFyWm3HRhJjSDA4Uu9LPQ+Z2aEq1L5/KJ9W5e
 SNJlXIUePKCQXWs4F0UmbHE67M+IfxtF0LwjX40+3W9kqNzFh1BVRTUijgOKRwpXrnLX
 C4/IknQbMQgyUHqW51E9//d8KixKhG7v0L3uJ5Q4GkW6I8BRh0hMsRdNzBZTUdeptPO6
 GKV/POKwfjWNtB109D0jTzq9zpR0bF5XZDoaMVxRmz7DARcjiSsSeJYXFqr42G3AzWFV
 6Jqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoUnwYLOxUo/zIaMoPNoAjGmjDbp3nS3GswKokB5kUCfvozt0YYzTk27F7fovgK+geI3OFzb9ZyNl6shUNMONqBCh035gKM5q1Vec0TNf3
X-Gm-Message-State: AOJu0YxCa07+29UZmN7635Vl7h3Hmmo4VWVAh+/ki6NWFWVVjVyEqlI5
 FXzOZYbx5Hkb1tpQ3mjs2FUwzbHeY92b+gBzmKfWbh8JL7aT0UJtJylQsyCaknTPZX5b6P6JoZM
 k507ttAoizwDTSMDhsGc7vU99DUOhow6nZldteg==
X-Google-Smtp-Source: AGHT+IHvO2gpoo35hpbPazduMDS3YRusSo/Zx0sw5zMx7Ip/e9xHwuH2gpf2tlgkpO9357jnNImek1UHtxy3YWbuZJY=
X-Received: by 2002:a25:b213:0:b0:dcf:bc86:1020 with SMTP id
 i19-20020a25b213000000b00dcfbc861020mr8347225ybj.53.1711035817909; Thu, 21
 Mar 2024 08:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
 <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
In-Reply-To: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 17:43:26 +0200
Message-ID: <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> > The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> > Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >
>
> I checked myself and also internally on this. On sm8250, the DPU planes
> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>
> May I know what was the reference to add these formats to DPU
> considering that even downstream sources didn't add them?
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> > the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> > correct way to handle it, so I'm sending this as an RFC. If we agree
> > that bumping the .clk_inefficiency_factor is a correct way, I'll send
> > v2, including catalog changes.
> >
> > I had no such issues for the YV16/YU16 formats.
>
> We don't support this too on sm8250. But interesting it worked.

I have been cross-checking DPU formats list against the format list
from the display overview docs.
The DPU (and SDE FWIW) drivers supported NV16/61 and
UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
mention these semi-planar formats at all and interleaved YUV formats
are marked as unsupported.

For reference, NV24 and NV42 also seem to work.


--
With best wishes
Dmitry
