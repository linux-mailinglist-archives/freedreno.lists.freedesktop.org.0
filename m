Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5256774D
	for <lists+freedreno@lfdr.de>; Tue,  5 Jul 2022 21:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530E11BF26;
	Tue,  5 Jul 2022 19:07:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A2E11BF0A
 for <freedreno@lists.freedesktop.org>; Tue,  5 Jul 2022 19:07:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z21so22091205lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 05 Jul 2022 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
 b=f/FCG8yL4VOOTwO2rnIiAtzXPtS2mVuAe+XTDCGyoCaarSkKazd9ayjVL9aKwDZEip
 Hge9vP9wx1uromYafvl/X1WbtDWoqQwJnSDDRxWvUYlJk7/IIEJgwqm6L3kqIUNJRVXX
 uH/+Gtcyq+X8WA/OER4Gr1j9Xrklt89C6BCC/GQWhxSjmXDltPe22Ol/338WWA7Fl5+g
 XFQXG7OOJrZXEVFAN9NOP0/LHeBthQ6EAglyrN8O6uI49AJsVBkOrwzfWnK7nEum83As
 Xz4GajFeK/h1ezkCi5IQaNzhJeYb6oFeg8EpZXxgwaPX2TaoAoop/DKEfKssARrc3hJ2
 r2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DnKgC9sCIW8SXV8tcHv5kUM+QyY61ZZmZlUgZGKqW+Q=;
 b=TifHgSiJs3DXOX0y1OUm315AEQ37u2CbH2MsSk/jZZkBWWJdo+KR11/WLE40+ucCip
 9jYJcarOjGHVEp9micWC7EwX/QMUTFy5QyEgGH1Oafjq2ikQaPzmJ+MCsAxADqdypizi
 4BMSuopK8V6OBZMqGQAMESfUdxLkp3LMZfAt3YS8mNV2R+zriHRwtW9LwEaRN7qhIqau
 gCJ+KTohRnoif/mysEzYhFqjeFqFImGGFlLTl/x6mFgQvvk7Q5DJtfTphekoeWTEfT5y
 EKxnukzjVOkO+0vs4FVvFxGypKFeiaFWigpIcrQ4MuHe6fjjCAa+XrtCwA7ctPK1k4MT
 Y/Kg==
X-Gm-Message-State: AJIora/f6q+frT/+qmJXHfTqf1Gisam7hv+cUPK0Q7A1ddQrZqLF0W1u
 ObIROcfeGwXu9YTqt1VwJpwDbA==
X-Google-Smtp-Source: AGRyM1t0tljF3Ij4/4tcLOFFrqAsln9WIHlzzxsMkGOGWMfiIex4lo9Ypf2AWIcnRF1E4mgEv9Udkw==
X-Received: by 2002:a05:6512:22c3:b0:47f:9396:861a with SMTP id
 g3-20020a05651222c300b0047f9396861amr24766566lfu.230.1657048051185; 
 Tue, 05 Jul 2022 12:07:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bj11-20020a2eaa8b000000b0025a72db0cf1sm5733629ljb.118.2022.07.05.12.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:07:30 -0700 (PDT)
Message-ID: <14283b06-d8d3-aa4c-6db8-eb34e597bef8@linaro.org>
Date: Tue, 5 Jul 2022 22:07:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-7-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 6/7] drm/msm/disp/dpu1: use atomic
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/07/2022 20:00, Vinod Polimera wrote:
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

No. Your sign off should be the last tag here. Also there should be no 
blank lines between tags.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5629c0b..f01a976 100644
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
> @@ -2320,8 +2322,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
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
