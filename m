Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC46D4BDB
	for <lists+freedreno@lfdr.de>; Mon,  3 Apr 2023 17:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5310E4D5;
	Mon,  3 Apr 2023 15:28:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9BE10E0DA
 for <freedreno@lists.freedesktop.org>; Mon,  3 Apr 2023 15:28:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k37so38640628lfv.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Apr 2023 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680535734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
 b=hmqvElmrXWJQcUaSjMqNlMYt7VMO5e+YWgeZceMhEr3KKNjrq5vpft3N1tQrJwj8i4
 spJfLHjKk/NeKfJ1DNkS3z4DysUz8zSMacTKa8dxfJuYReoOfj4964HdGF3YD3TypsvH
 kuc6ozrwD7DsG9hMFup6LsPS7DYSGjBjh0KPaXb/MBflDirA7jBV+6La+sxympQFOhJB
 +i7T9WKkMTujomHn2C/+firfbVi0mx9ZRMiTVWRsg9L+6Dkin3IpkVWfpCKix6Xk6p2j
 94B9k2XKDYhrXH0W3gth/aac1tOFI6rwL6UfsPAphUxScAuonKUd1k51P1YEco5Oa34p
 nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
 b=f0Y/hSHJqug2h8EJYcU1llHoTVl4V2o06GQmiuXqIly30pot11ebo11T0MyMwL6Vqa
 IFJ1mgQ0kWMxqfcbmub3zACOFV0jf/EncKP+TJZx+OQeYOBdU0N7aIg/iLUYEpJloMJG
 wBSK47fJ015T0jWedFZNAh2dYmCjmvyi18ahD38ljRVYzestR9YR90lb6nWGdWh5/gge
 hUFTxJL5Sx+vrdZj3HtngR2gP8h/466pPuUWruqvQaRdohhN+878FiJw+5M8yPPnlVLr
 CAk/2SmyT6Zv8d8btRMmcR7NrniC3nTSZL8cmgnjKt234dh+eXAo8sBNqArw8TQ3rcZL
 6rtQ==
X-Gm-Message-State: AAQBX9fSbqj0++mrCtmK44c9FJUWjOIiRr7wDW1JZ7GAXdJoqzY6+QZp
 7w7mferRC3rXBCguo/zyUL8vbA==
X-Google-Smtp-Source: AKy350b95P/uSTgREdLEfWsH6IoiTIqaKI1+nr+mYyy4HAI6QLDWwdnTFFIlZWhlWMb7ONSwCX7yew==
X-Received: by 2002:a05:6512:3c2:b0:4dd:98c6:ee2 with SMTP id
 w2-20020a05651203c200b004dd98c60ee2mr9940947lfp.15.1680535734467; 
 Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w6-20020ac24426000000b004cb14fa604csm1815299lfl.262.2023.04.03.08.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Message-ID: <0e75e04d-fc07-2f60-bfb9-ee092075fae6@linaro.org>
Date: Mon, 3 Apr 2023 18:28:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 3/3] msm: skip the atomic commit of self
 refresh while PSR running
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
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/03/2023 16:58, Vinod Polimera wrote:
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)

The corresponding patch is not yet applied. I wonder how this was tested.

>   			new_crtc_state->mode_changed = true;
>   			state->allow_modeset = true;
>   		}
> +
> +		if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +			return -EINVAL;
>   	}
>   
>   	return drm_atomic_helper_check(dev, state);

-- 
With best wishes
Dmitry

