Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4D532902
	for <lists+freedreno@lfdr.de>; Tue, 24 May 2022 13:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA1010F74A;
	Tue, 24 May 2022 11:30:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136C610F64B
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 11:30:41 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id g3so14472757qtb.7
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 04:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bGLq4W32TEzpUZBXnWRpdyd7/FBRGgFvTqPNT1jEfoA=;
 b=OAKqDk3Zf2X9iX5TDmh7ABpCDzVGMUrpUY8i6x6nJcwoF12F3W5mAEj2t6xv93hbYo
 SvZnm8yU58A2KMSqCKgsdkPWHTmFO3UvANgtMFVocPMJjBCD0RYArw+Sy6P/NnWM6gb+
 ihqbRdP+zooyMawnQUTMNCamUE5z+YXZx1552uiZbUDlzzWCpj4HnqUx4hRx/IXA1Rm1
 GiAhUUo0rV41YOoBdkwhrYkuU6uuUh6G4KaQVc6aLMdIcxF1ABvti9SSrLXXNuvrqMga
 9Ax5oakjTNn8gmAYKrgJVk7GMmLq5D8gtAURyFnoJVQfLbT3YXQCtx/dAKBVDECSxjkP
 Rn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bGLq4W32TEzpUZBXnWRpdyd7/FBRGgFvTqPNT1jEfoA=;
 b=loTLoqN04eJue8TDMCKn5WgLrUKbkU1YuhBwNUZ+ANdUP+hNFcAGYF+jYHyiHQzDsE
 ABlmz6ei/eApI1/MT7beGXbohpqf680LRxiVml/15EhfWqrBT7UINCa9BSpC2FGnL4CY
 lJbYFB4J0gOkuGwdZWuJD9eZVBXQ5IkSTmcxS1niVK56Wh5HmvC7STrx0nFgBZE+k054
 vZAVBC8oofy338oiVDjANbvB3scpkbCn/XsM9cWysucJ7T2hytQP23aJxgrVSP8JU8WE
 ljd0tmrD9uzpxJkCvRylpL66SL1wxEmwD94yPKBvCwqoLP9u18qIneiCI19bF1zx9d8P
 vWvA==
X-Gm-Message-State: AOAM530q/NDKvMlQcfQlUaIxK+pLih9mgE+R1eNYWb1cRd1hO9wcjLuU
 QnAGSZbalGR4Ny8Q1/CrRlwob2265F4KRfvkE41U1A==
X-Google-Smtp-Source: ABdhPJzWUliZZ3coRed1/OyusyZ5AuNUEzDPp+9amUhMmBiouK3cjF+RoHYC0NtfjmsJyLr1LVC9fSARx4kUKXhxdD8=
X-Received: by 2002:a05:622a:188e:b0:2f3:dc9f:946 with SMTP id
 v14-20020a05622a188e00b002f3dc9f0946mr19907509qtc.682.1653391839062; Tue, 24
 May 2022 04:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220524103534.2520439-1-vkoul@kernel.org>
In-Reply-To: <20220524103534.2520439-1-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 14:30:28 +0300
Message-ID: <CAA8EJpp0F+wP0Uoz+i07f0C1H4UJVdJdPrFquvGUEMB8gQUu-g@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1: remove supoerflous init
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
Cc: kernel test robot <yujie.liu@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 13:35, Vinod Koul <vkoul@kernel.org> wrote:
>
> Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
> encoder") added dsc_common_mode variable which was set to zero but then
> again programmed, so drop the supoerflous init.
>
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 51f24ba68375..388125c8bda1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>                 }
>         }
>
> -       dsc_common_mode = 0;
>         pic_width = dsc->drm->pic_width;
>
>         dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
