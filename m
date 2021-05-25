Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01A390672
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 18:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24BE6E250;
	Tue, 25 May 2021 16:18:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A76C898FA
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 16:18:11 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so17945961otk.5
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ucrlaXMhJuqZbdL/Kh7Imph/3ZSj2r6db/bMXL/uHzE=;
 b=oRXR+DbpUeQHbBYujjL4GoV6YZPeae9xH+ys4WbWsiYr23JkVyjc/NE19xWDL5uIMR
 r8yvvZ3EAB5E5vSsqw4SId7PfxZkau8VWf6Lt+40Kj1+/lQTX+9+++XfpquLePRRkIo+
 Pff8XYy4T55K3SdNaOiNm6A7r7nof9d+zFrOjVFL/JoxnL0U4QEaB+Q3wQbsss+ze/Qa
 Xa8gky55+s0V2AE2dqdy3JN49OXS76hmXhoBjHex/EynjqI2DCJpCg27zwNsFiYISS/I
 k3YTEPkPI5mz63gWYtcdWbizebVGGbw6PCNRzcabU+17vS7Rd4FmGnSh6HocFOXZRUk3
 /a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ucrlaXMhJuqZbdL/Kh7Imph/3ZSj2r6db/bMXL/uHzE=;
 b=I9D+G4tS2HTa270oE1YGuL3Ns9T+XBL5DuDmzu7tbxTS1AyoQ6QDvyedeMoqHas46K
 srtF5Yh+KSEP8qU2h+D1ooXuNoo0+9Avt6O0efOjgIX49TGQHe5+gtI7EuSLfqUzt8A/
 hqztCF0ifsUpOCOXTax7aECpJbm42KAXh1LiywFmnYzmH6THmBHfiz4yNhjeh+QfXzgc
 a/VSVmqeWKKqoz2hzyZn9f5gnblwIa27JQjVriMJoYB/Go8tujkhVRmxvJHh5xCC5mRs
 Y+j3rLUH+z4KIGJ3kL5aQU0yXuPSmntJ+N9mdeqUnvvAce4ctKbwpvuNpoaWUJAXtZFF
 6aSA==
X-Gm-Message-State: AOAM5306M6mU4YKpaCbGXtJm7XL6UI54LmRZOL0zB6CvmCTxYWUoiwA7
 YvLBA2TjBPe3J4GQBFUIgCRKcQ==
X-Google-Smtp-Source: ABdhPJxH4CMEN9KNuMJn0Pyz88KKt0ddlyzym/HaVnNJgh6NHsL6BFT4WGnckaqjEc+ROjW40dJPgQ==
X-Received: by 2002:a05:6830:11d7:: with SMTP id
 v23mr16491372otq.44.1621959490556; 
 Tue, 25 May 2021 09:18:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u201sm3287736oia.10.2021.05.25.09.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:18:10 -0700 (PDT)
Date: Tue, 25 May 2021 11:18:08 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <YK0jQM4AMmBHbUD2@builder.lan>
References: <20210525112904.1747066-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525112904.1747066-1-linux@roeck-us.net>
Subject: Re: [Freedreno] [PATCH] drm/msm/disp/dpu1/dpu_encoder: Drop
 unnecessary NULL checks after container_of
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 25 May 06:29 CDT 2021, Guenter Roeck wrote:

> The result of container_of() operations is never NULL unless the embedded
> element is the first element of the structure. This is not the case here.
> The NULL checks on the result of container_of() are therefore unnecessary
> and misleading. Remove them.
> 
> This change was made automatically with the following Coccinelle script.
> 
> @@
> type t;
> identifier v;
> statement s;
> @@
> 
> <+...
> (
>   t v = container_of(...);
> |
>   v = container_of(...);
> )
>   ...
>   when != v
> - if (\( !v \| v == NULL \) ) s
> ...+>
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8d942052db8a..a573fe211375 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1453,11 +1453,6 @@ static void dpu_encoder_off_work(struct work_struct *work)
>  	struct dpu_encoder_virt *dpu_enc = container_of(work,
>  			struct dpu_encoder_virt, delayed_off_work.work);
>  
> -	if (!dpu_enc) {
> -		DPU_ERROR("invalid dpu encoder\n");
> -		return;
> -	}
> -
>  	dpu_encoder_resource_control(&dpu_enc->base,
>  						DPU_ENC_RC_EVENT_ENTER_IDLE);
>  
> @@ -1797,11 +1792,6 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>  			struct dpu_encoder_virt, vsync_event_work);
>  	ktime_t wakeup_time;
>  
> -	if (!dpu_enc) {
> -		DPU_ERROR("invalid dpu encoder\n");
> -		return;
> -	}
> -
>  	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
>  		return;
>  
> -- 
> 2.25.1
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
