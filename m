Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A988CBDF
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 19:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E9610ECDE;
	Tue, 26 Mar 2024 18:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PylrJUeq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E010ECDE
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 18:19:13 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso5576603276.0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711477153; x=1712081953; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
 b=PylrJUeq1+VXqRhyGyPbwfkRVNTDBoS5SCLnbJuRJTaDtW7aIzR0yFvfDB+TpISt0I
 XY4aoBYQ8MvcixbsTDUabesK8bN6vgcMCquIaR2+QjYxWnhuhZhYvePUxpRtY8IylZOP
 NcfFSyUz169xQyQrfKzSZqCgCP5q04h0yPsqczL+mN7dpsOS0coIFr/rhqt6SRGsAYv9
 eHj8USN3hl2mD3GQ24Iktycu9QQnUa2tlUKqjvjjr5l79fSA8VmS3D31eh5zcNbh45dj
 sQhkMUubi3rl1MvJ2/kDjQp0c+EEKI+8IUNN9Tef8/b99JG6l41QpmXAAK+C6wBO6bQi
 EJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711477153; x=1712081953;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOkXmyl/X1aGG4AnOp91IyV31wzedhnJYqHOnnSV7Nc=;
 b=CqkQQ09U/yf7YfD49cDaeBXj3FOfLB+6rmGzsDr3U34Q60lUFlKLlqwTTXSQzd3uwI
 mKBXWHSU+hdbqRh7dqkrVWtOWNeoq8gscbjcKiWRcF7j7TKuzHs7JU6r3l+2UNEOHmMB
 xl3Qkqzi3SBSckb8vkTqCmoYgF7UhxJc4YbN6n86V6kv5/8ugWqREste4d5LzdqaQTBn
 Pccvcy4J9/yY26py/JVXy9OAKoJ+HkxTiVoQMAGfeoEJWnPi3J821P8DqWcTUmWdCDRa
 fzPWV1fVTDIy88C+Z+ljht5VR4l5RAK7p1pUOy7X6th0d6rFP9cYDbV/Jczh8gyOlD9E
 BJAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjLwoXU2albCSbIvq2VIoYTbsrxe4LxCtP+rHYxJNsNxyZTzUU2lZeQeb8GpklPbPVZVTK4Emy5fBDYwH1RhGP1psARy09b+WCt56kyTuy
X-Gm-Message-State: AOJu0YyqJKOMNQdzHWPqtLRm0kJxK7ix6uH5MdXX3FINRPRyXvJco+45
 oQ1A3QzClvNMQPR93VqLiZVX8UpuY+oqqLtDn+DVaOfY6XChxhDUUPPC0+JLq0tebY6iZjFHqaF
 keXW7cYD2JhBd8+sXB67f5yPXMU9swFiAJpkTMw==
X-Google-Smtp-Source: AGHT+IFMp3OMawqOBv0a8n7GbzvaXu6Kp6vGmhRT4WskjxEebuGXOrN6fvoyGzz6SGmREGfuoZ6gKvGOsfAU2TMNBoo=
X-Received: by 2002:a25:820e:0:b0:dc6:d093:8622 with SMTP id
 q14-20020a25820e000000b00dc6d0938622mr491441ybk.15.1711477152723; Tue, 26 Mar
 2024 11:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
In-Reply-To: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 20:19:01 +0200
Message-ID: <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, 26 Mar 2024 at 20:05, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi,
>
> In today's next, I got:
>
>     drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable
> 'out' set but not used [-Werror,-Wunused-but-set-variable]
>
> `out` seems to be there since commit 64d6255650d4 ("drm/msm: More
> fully implement devcoredump for a7xx").
>
> Untested diff below assuming `dumper->iova` is constant -- if you want
> a formal patch, please let me know.

Please send a proper patch that we can pick up.

>
> Cheers,
> Miguel
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 1f5245fc2cdc..a847a0f7a73c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -852,7 +852,7 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>              (block->type << 8) | i);
>
>          in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
> -            block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> +            block->size, out);
>
>          out += block->size * sizeof(u32);
>      }



-- 
With best wishes
Dmitry
