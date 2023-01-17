Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64C66E3A7
	for <lists+freedreno@lfdr.de>; Tue, 17 Jan 2023 17:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684210E1A2;
	Tue, 17 Jan 2023 16:35:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBDB10E1A1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 16:35:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qx13so18284688ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 08:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKt6FUbs0NRTdylWMz2ns+XH+sssUdEr8LiKsXM1UOA=;
 b=IONHL8M211hbqnvHJxhpzV+DBFTwMzWtBVbmOPsSS8ORin6BOLQpdh8nIh8ieg2vr6
 /f3kq87LpUlDR0iI22hK6hBpwRHBQTwWhiQYbXHExWcYCnpzHXd4m3kxyoqlpvbp44W/
 RMkUDbU8yFK2iQ611Rlt7md+mq4Sdw1ZWuVjVXNk5vjReROJ4f832nd735JNRluMHFJZ
 n8Dht7hxfenVzjd1HCrW6OjavSCxjsqPAcEaF+mbykBFM2kCLxnuRaDQRc4nUNdau7vd
 O+ENqN9cOLLdkVrH3h3no6ginShLIOsGoNucPoq8kRBuZO9j0ZO2xPXF3IiUkUl5xTmv
 nopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKt6FUbs0NRTdylWMz2ns+XH+sssUdEr8LiKsXM1UOA=;
 b=BTcsu2hrYeL2JuQ1o/y4W8ZgwexxWNwOL/xLel0JPCiNiIU84XydiC5ut5HuQ0mmVq
 bGIgxqf4nJNOIS1fh4IBIR6RbNejAVMTH3t0zsRW8koz7Z1WlyZk8ohaRPiTh02q5wQP
 4FUjvteWPnsSQbefddBwropGqZCBUfakJ+pluxfschADyTLYA6bmqBzbqeEY2hXVAVTa
 25JWbRVaRUV498qiHM9US7nR7Tzz2ZnkZEIh6YFRvbe74c2oeK8HJgOukidGzMV9HSB7
 mlKuESDoNrxJtYJFl7mzwEgudSX/STkCqhtRwc/Itp02gcigqwTibGJYjj1W9m6OVgzA
 zLiQ==
X-Gm-Message-State: AFqh2krrTZ2dtONLEaWawhGyEYL1Zg6Jh8CRVhYd3sLgVXXPRBKd3Y9j
 JdIOFuftWhKMukzcv0/R8++UJw==
X-Google-Smtp-Source: AMrXdXs5AVHAIlz7sxihSBRcrZGbFCUjXMBelpA5amhed2x0+IJYDSZ+Pgu3xgl9UUHwffn6H0R2xw==
X-Received: by 2002:a17:907:a2cb:b0:871:dd2:4af0 with SMTP id
 re11-20020a170907a2cb00b008710dd24af0mr3566417ejc.26.1673973314968; 
 Tue, 17 Jan 2023 08:35:14 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ss5-20020a170907038500b00856ad9108e7sm9201315ejb.70.2023.01.17.08.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:35:14 -0800 (PST)
Message-ID: <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
Date: Tue, 17 Jan 2023 18:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/disp/dpu1: allow reservation
 even if dspps are not available.
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/01/2023 18:21, Kalyan Thota wrote:
> if any topology requests for dspps and catalogue doesn't have the
> allocation, avoid failing the reservation.
> 
> This can pave way to build logic allowing composer fallbacks
> for all the color features that are handled in dspp.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..c8899ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -343,7 +343,13 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>   		return true;
>   
>   	idx = lm_cfg->dspp - DSPP_0;
> -	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
> +
> +	if (idx < 0) {

The change doesn't correspond to commit message.

> +		DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n", lm_cfg->dspp);
> +		return true;
> +	}
> +
> +	if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
>   		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>   		return false;
>   	}

If you'd like to remove duplicate for the (idx >= ARRAY_SIZE) check, I'd 
suggest dropping the second one


-- 
With best wishes
Dmitry

