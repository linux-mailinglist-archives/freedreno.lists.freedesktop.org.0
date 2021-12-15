Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518E14761BB
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04BE10F875;
	Wed, 15 Dec 2021 19:31:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170010F875
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:31:09 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id q25so33217533oiw.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2ZodyLNR3AXODJSiSUnQA1XAEq2LWEq3gAH7UHv0FmE=;
 b=JOgQ1hKYSjobD9XN44Skgc0yrw4uB4WDyWKYpR+cfnVbcLB7xxQ1Vk0Njkm7gPnZfg
 1ZOqm6PSfkaWZ+r40masd5HF3+8zJqSCJm9gmQ5rcyfNHfwLSLwQobmlHxd16hUrnBS/
 rVk/WNHjDBB/2KVFdfBp83ZFCn+w00TFFqnu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2ZodyLNR3AXODJSiSUnQA1XAEq2LWEq3gAH7UHv0FmE=;
 b=jgcm+TaaSUEdquygbH06z81O77OOxr+tCD2CSTEA8ROZkx5ODxSV9wXHt8JFQ89LWj
 DAz8t1yVKJQ5vK79pk5cIUaJLe3XDQjVbiMzqyabDiM6Bp7icOMIoJTaw3udLCNc+vOs
 wxD4kvQYwHVdym4KxwUvMrkdoWxQwZgfDI9adEakoNA+mZYJVDlG4ipmZaY1+CttVpqm
 FY44zd1uBGeGXAtWBHZO/+INkHvoGxYuArgF0JnhtJikO0o/XyNawADJJNT8okGaaWrU
 9+9Laas5eo4Aa59F0Ufh1SsQ+aSuQpGh9ynmhzAAKrKaIMEmHR5WE/+CvEHoPNd9alTK
 tYGg==
X-Gm-Message-State: AOAM533sPKcL6UoiTv8RJowNUboO8q/sraW3Uf3yiBb34sVLCs1WIMO8
 CMgbJjNi9zALJtiL+1jZHuMRNMnILyyEp5G6Ecb4VQ==
X-Google-Smtp-Source: ABdhPJyXZNnE5c8O7dbxT7JNkZV6Q00UZJ68loclZIwbBnVr9byLL22dVIE/Z3sucZEOUL4pwTLMeSwvlikFYoroAuE=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr1309975oiw.64.1639596668771; 
 Wed, 15 Dec 2021 11:31:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:31:08 -0800
MIME-Version: 1.0
In-Reply-To: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:31:08 -0800
Message-ID: <CAE-0n51fs0q-6eStuTrxfCUbHrA=7YsiO1GR254j3_SV=V8meQ@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: add
 dpu_crtc_atomic_print_state
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-12-15 08:09:11)
> Implement CRTC's atomic_print_state() callback, printing DPU-specific
> CRTC state (LM, CTL and DSPP ids).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 59b1bcfbe8c0..df128a680697 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -924,6 +924,20 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>         return &cstate->base;
>  }
>
> +static void dpu_crtc_atomic_print_state(struct drm_printer *p,
> +                                       const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);

const? Then we know at a glance that this isn't changing the state.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
