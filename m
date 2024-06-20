Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C4910566
	for <lists+freedreno@lfdr.de>; Thu, 20 Jun 2024 15:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B410E9E3;
	Thu, 20 Jun 2024 13:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ge6vd5Nl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB97510E9D5
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 13:08:58 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6f977acff19so385690a34.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718888938; x=1719493738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
 b=ge6vd5NlhFkaBiAQAlsvFqlXRb7Lp5b5DkCiUTNPElkKu+LaLW1f5ecPoGHaJ/4dHc
 0+9pWQ+TMwsHm+XZOf/wjoVitBkKmxoEsrcJjW5zrB/9fXut36PJBJCUcLn3i7E1m6rl
 rHhpIfTzM9NB9mpmpISSdC++jc2BCEGTuz0AbqBHSSsEUHeOY4nUWw3/0zR1/z0bEoBW
 +h4lqt3/mA+wNEbIjF3IdWKUmIvsCwU2+nNG9BPxTtU7Chxpf0S+EVRLUFGTiM1O9hvT
 fsJ/eej2jAqp+tSIt1qZ+TPt/44ir1cvYu9Eeok0SSg+sIP/z5XmPqLAxhks6YBMIBzR
 ueOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718888938; x=1719493738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rkNtw9YPMCGiaNrE2wpOjWh2PZ5/d2L88aMo+GCsZk=;
 b=Ihwmusp/2lNtAf7XGY6oALXQtGidiVIBmG7L9286hndCDeMuGjzE+f7gsNN/gJOEIU
 3GRbwuW5qzUDitW9xQRAbeOQuccELkfsPJkhL6Glv9GsDYJiuTeScvjg1S6f3QNYaRpb
 4RrUpHQJKoRzWKGs7v07ovHxdAstCytGC09hYPZIeHCMIjmBkHjQMPpVyYUX/5msa7W9
 71ABW0ZTe60p1/MxesZqDcwdIes9nDGt5z1Ek0q0rVcxkWLzoS+XrVxsQ5CVy2/Puchm
 e2S17Ybazyjvy44uQ7i2UTsycrcjpR80i5cHLyKDFnMxBv7NGLbBrXcNPnH1QxPfRYQ7
 4SjQ==
X-Gm-Message-State: AOJu0Yxtz1pzSwf6Fx7AVC91YMfvwh8/mVA9Y0I4Y3eKMoCTciLt567L
 ThwaypO+TTEsMJ4BHIUro5ec335F8NWPMTNUIbRo2Qx3VuT1leYBIRQqo/rHj7AJGowUC5FmltU
 u4XdiFHjpP2Kzg9xyq5FYsFbrEqESJagEgQMW5A==
X-Google-Smtp-Source: AGHT+IF/yD+0GZN6cAxps+FA6XiCIOAiMvgRzsPW3OFiThohVo42Hf9KaLzzZhArPsljy8CiIl3TpYiqk9Wxxenp9Vg=
X-Received: by 2002:a05:6358:8096:b0:199:432b:821b with SMTP id
 e5c5f4694b2df-1a1fd49a301mr606688455d.17.1718888935830; Thu, 20 Jun 2024
 06:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 16:08:44 +0300
Message-ID: <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
> the ops are assigned causing discrepancy between its callers where the
> checks are performed and the API itself which does not.
>
> Two approaches can be taken: either drop the checks even in the caller
> OR add the checks even in dpu_encoder_helper_phys_cleanup().
>
> Adopt the latter approach as ctl ops are assigned revision based so may not
> be always assigned.

NAK, these calls are always assigned. Please make sure that they are
documented as required and drop offending checks.

>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 708657598cce..7f7e6d4e974b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>         if (ctl->ops.reset_intf_cfg)
>                 ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>
> -       ctl->ops.trigger_flush(ctl);
> -       ctl->ops.trigger_start(ctl);
> -       ctl->ops.clear_pending_flush(ctl);
> +       if (ctl->ops.trigger_flush)
> +               ctl->ops.trigger_flush(ctl);
> +       if (ctl->ops.trigger_start)
> +               ctl->ops.trigger_start(ctl);
> +       if (ctl->ops.clear_pending_flush)
> +               ctl->ops.clear_pending_flush(ctl);
>  }
>
>  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
> --
> 2.44.0
>


-- 
With best wishes
Dmitry
