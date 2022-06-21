Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E285539EF
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 21:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC50010EA3A;
	Tue, 21 Jun 2022 19:00:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA5710EA5F
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 19:00:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i18so10284975lfu.8
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
 b=JC/7niSPsJ0iKH+blG56YnE5G8oObtz7l5leDaLqSh1cPQixTKplCxrdd6G5g0aCag
 ixPCy7kMe/0pzU2aQ0dSVUnlBbp1lnHQrzXmbQfwZnxVwPyY4r3Elt3DOTISgMjM5l4D
 c773jMp0cVHVMoQWtthfGuCQX7clEaIhibW59mF2OazXxSZ7IhW8GNCEw3J4IRvE3jJy
 f3O8GvAkQBucJFFCDfXE4dsUauvHpp4s+Z1Ue5YbYAw7cf5p1pg0uEO1CoiQKxoqR9os
 ho0sxgdf13ftuAcYlpBffww6hUkLPUTj/zckqHgBQFhZClC94l07Q5bnPIJW62C9Fw90
 yHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6fjMjr211YE9YcIQWwQaRZfIoF2o601X8To7eThZCiA=;
 b=CcSWBRDrOzAEy0SrDCMqNhA51j3CVSBLA3inc1DElkHpq765/EZjf1Uyh6NV0aZjuH
 /aYdd4tC5f4aAEZKVVBEfT+f/DH9IPVyFfRCVrEufIKo3QrElmc0d22cEXlRq5hOAbOl
 cD4ANqYqJcfFT9dFvg5eWN6D/23jbdkYmVwgtjX3Ab43nkJMJ4cgbSSIGjTrFp4aKNaK
 VDiwaywi60DV+bcEq32TJ7mp7ayt/j4Ispd2g0doaPzLDeKlb7i/X8hUau5SdKtmC78f
 fQph5OKy7P55KJrqPOgWqzgSLqPmGHyqS9iyXBAj9YMXZl2D+7+r7HhOJfB+VFRq8Bkx
 vfAg==
X-Gm-Message-State: AJIora8FS51pzzi4jy4LaiXKPtJRXWv+7MUYKRxShl+abrTuHUUTTo/Y
 89MowQPT0P3PTt+te9ka6Eh2yg==
X-Google-Smtp-Source: AGRyM1tTwTGocDhWlMkEi3nkgXGoxnkT2ptk3Q/PpeJxeI6Wy1TAEbaq/L9tcVznRBBHUDnp7PiDpQ==
X-Received: by 2002:a19:5214:0:b0:47f:8f4e:9829 with SMTP id
 m20-20020a195214000000b0047f8f4e9829mr1025330lfb.161.1655838002612; 
 Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a2e2c19000000b0024f3d1daed6sm2104748ljs.94.2022.06.21.12.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 12:00:02 -0700 (PDT)
Message-ID: <043d02d3-e03e-f19d-4692-237c43236744@linaro.org>
Date: Tue, 21 Jun 2022 22:00:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-5-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v3 4/5] drm/msm/disp/dpu1: use atomic
 enable/disable callbacks for encoder functions
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, robdclark@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/06/2022 13:53, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..cc2809b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1130,7 +1130,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int ret = 0;
> @@ -1166,7 +1167,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
> +					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int i = 0;
> @@ -2332,8 +2334,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
> -	.disable = dpu_encoder_virt_disable,
> -	.enable = dpu_encoder_virt_enable,
> +	.atomic_disable = dpu_encoder_virt_atomic_disable,
> +	.atomic_enable = dpu_encoder_virt_atomic_enable,
>   	.atomic_check = dpu_encoder_virt_atomic_check,
>   };
>   


-- 
With best wishes
Dmitry
