Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9D41FDF7
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 22:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253D6E039;
	Sat,  2 Oct 2021 20:03:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD66F6E038
 for <freedreno@lists.freedesktop.org>; Sat,  2 Oct 2021 20:03:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so53112933lfr.10
 for <freedreno@lists.freedesktop.org>; Sat, 02 Oct 2021 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=13J5NCM9YubkgnF2CpC0yWl/i0g0jlxsWta30UGyZs0=;
 b=oegKqyu7mPdwoj9O7UaSL7cBNwXG4+DCDfIIwHzwmEDyXxNlBxYXNWubfWrtiVv22I
 yMpvmEagtIR5jGGfEm7WleKL+gYwYbph9rAcr9tnJefvYCkFRpBs2ZbyrF8QcxsIGyay
 v4N+ETsW9Hc2f1yZXGdwrYSiBmYKAizqEgG1XU+vlBDIxA40atShmhTtum2ljLmwZxk6
 P6+cL/GcTNYowwBd7M0ZWEDUlIvpP3SNu0uzyVwnXmuhmU6tY69nQ9FL4W7k80F/DpIu
 sfz/1WcR3qd4/GSdZZoLVVe2UnliC3RysOdV+0ZXGzoE54qc+OaTbcmLltdN5nR44KNE
 pOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=13J5NCM9YubkgnF2CpC0yWl/i0g0jlxsWta30UGyZs0=;
 b=LciqvfUoqQ8OfA52XKUzeMvHe78hl47OZprLo4ZfRvD7VilbfG72hQVcLZPs6QWHUL
 m8NsODqnjg9dXagLzcGCdmsKIwa2UAHyuDGMdv8CfK2+0WCDlFjGnnVIZ0TTLFilRnVb
 lWB3IsWgCqB6KYd/DNeGamXf6HXlDIuguUB5EkQ9OGf5QPhiEhMVihNujTXzsMbZNZ2D
 2A+H/nikfqd1nkG7LG9/EKjzisX4X4URu9cPMfh/tVpy/MbIppNr+5A7DjzKSKrJ4OEG
 T/0jecEa17e0kP0ZzWyucca+xuNMqKdC1Mxq+8C5zl2+LdzxDU8Qw8Iak+4OemlMclWY
 0LmA==
X-Gm-Message-State: AOAM531NpOXoMrvj58pKgR7TiScH2vgsf6Mn60VAkV2VKMPcpzORz7s1
 ZH3nBjVzXFYrjEUfWTPltMw+Kg==
X-Google-Smtp-Source: ABdhPJxMzC5Hbab+sd5joT8D86weC5/IpuCQJrBVIIXEaN35dhD0lCCRcJVMffgtoz1UV//z8P6stw==
X-Received: by 2002:a05:651c:504:: with SMTP id
 o4mr5475218ljp.393.1633205023010; 
 Sat, 02 Oct 2021 13:03:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bj40sm1009896ljb.106.2021.10.02.13.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:03:42 -0700 (PDT)
To: Bernard Zhao <bernard@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Drew Davenport <ddavenport@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20201102125030.6209-1-bernard@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2e2abdc5-d426-a0f4-9fbb-640560b4abd4@linaro.org>
Date: Sat, 2 Oct 2021 23:03:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20201102125030.6209-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: delete conversion from bool value
 to bool return
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

On 02/11/2020 15:50, Bernard Zhao wrote:
> Delete the conversion from bool value to bool function return.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 8493d68ad841..411222f4cd6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -37,7 +37,7 @@
>   
>   static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>   {
> -	return (phys_enc->split_role != ENC_ROLE_SLAVE) ? true : false;
> +	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>   }
>   
>   static bool dpu_encoder_phys_cmd_mode_fixup(
> 


-- 
With best wishes
Dmitry
