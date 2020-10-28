Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915C29CE4C
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 07:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6FA6E479;
	Wed, 28 Oct 2020 06:01:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6396E479
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 06:01:13 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id i3so953915pju.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Oct 2020 23:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UGEvSBlqCbH7r/XeVff2EFEE3W3a/89hWK9X3Eu9+ZI=;
 b=tDhfRl8lL7XqVAS0dE9ih0wEOsD381IONb26mPbYM6z+rGn3WyK0u5UobSFx7JnaJT
 XBxkLh/aTXCuPOrd7R97cbmTf3tBsvopShAd2rhYZVXnChpr0BI5840zNyBN3+RksuCv
 pDU4pHD57XdjIyBKgMPioHw8IHfFmPeggSBXDtwvCpUknpq2/vgQMKI9wFUuDJXxiV22
 GFf3nPBaqPXtmOFOjvQwcAHA9seK3iyBvXpDe0eYwVTe3j9aHrT2Rc4iPo5dj5bgSRGH
 y45as3KX9exbNHVC+AAWPGZ2Wl+1ns0HTwvas/0qQwB9Yn2ub3tqD0bDWEaOD9Ozj6z1
 zXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UGEvSBlqCbH7r/XeVff2EFEE3W3a/89hWK9X3Eu9+ZI=;
 b=NxTH4iGhQqzlG80svJE41MjKo/WU3R3/KzevEoBR6dJmGukxJHihHQfEvUAkyEl+Hj
 LkdlHPr0FWDLOGZtqZFIjhKvdFZcRGD9klSDvmsXzLcL5Ii27A53mZ9DnGv0iYGdoOQQ
 ugx8cJK8HQ2Pku9YMxf9L215VGzHRNrX0azhKL3POxCWnWK6hgiyPDu++qaL457ipuru
 jmr96+0ntVGr4Wir5ZpRhZS798RP3j9TXPiSP+EbeLm952DivXArTJ+94y8RgfJo7XNI
 4NZfJxcZMkXNThDC3rxLHBzUTVPNIn7PSzu8B1VxX9489sYJc5ouZ4fpSdBd9cFaAVl/
 rP2A==
X-Gm-Message-State: AOAM533nQzEFsNnbx/4fpCxsqZ9N6tSoEipYQPy+pllMZhKyy+O2cl8f
 kFv4EyyiGTNzXizh+B8MAD3WPA==
X-Google-Smtp-Source: ABdhPJwr2K1NnepE5uXMHDTSc5jfBqdvp6zG1zCPfe5GimQyYat9Pv1/3IU0ouG58kOUTa/MpOy4Gw==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id
 n11mr5453925pjq.162.1603864873109; 
 Tue, 27 Oct 2020 23:01:13 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id ei4sm3821960pjb.4.2020.10.27.23.01.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:01:12 -0700 (PDT)
Date: Wed, 28 Oct 2020 11:31:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Message-ID: <20201028060109.qlggrsza5jjfno4y@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-4-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-4-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm: Convert to
 devm_pm_opp_set_supported_hw
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
Cc: nm@ti.com, freedreno@lists.freedesktop.org, eric@anholt.net,
 airlied@linux.ie, vireshk@kernel.org, tiny.windzz@gmail.com,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org, sboyd@kernel.org,
 robdclark@gmail.com, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 kholk11@gmail.com, sean@poorly.run, linux-kernel@vger.kernel.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12-10-20, 21:55, Frank Lee wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Use the devm_pm_opp_set_supported_hw() to avoid memory leaks in some cases.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 91726da82ed6..8d88f119a59f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1487,7 +1487,7 @@ static void check_speed_bin(struct device *dev)
>  		nvmem_cell_put(cell);
>  	}
>  
> -	dev_pm_opp_set_supported_hw(dev, &val, 1);
> +	devm_pm_opp_set_supported_hw(dev, &val, 1);
>  }
>  
>  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)

Rob: Can I have your Ack to pick this patch up please ?

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
