Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC44A52CF
	for <lists+freedreno@lfdr.de>; Tue,  1 Feb 2022 00:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AC010E3DD;
	Mon, 31 Jan 2022 23:02:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639B410E42D
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 23:02:00 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so3615074ooq.10
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=07IOc+4sCg1ox/edloQ1DbuVRJUKfQj2aCnLFjL6iTQ=;
 b=Bn4rW4n25XPNIJwkb8Lp3Y4CT3gpNhv1eeQJ4rYPyhwpCfkWPCbBXgTMVdpQQACd9t
 UtCxurE7RDaXdvezgp5HMXscwwHkIzqm8twxCDC7mzydP3LHwH/zqasn8tjOz4zGFSXD
 j9wJDatUBoCjkoIDxDMo3THoCecavFdfsnukm0buW9Mv3U0+PlqlqX2n3uem93mU/eLg
 hxoohDXZ6P2Sv/pWagelPRuq2bGIGGzzhkLZtgcdlB4ydM3Z8eKGnPY5R9B7ZdXJz9SB
 gh46OmYNt+YVZURMlSndeCdHc9qiGqKWgvNBQtrhkURfzwdoSfQhpHQrzfbG5qyIyj/l
 fNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07IOc+4sCg1ox/edloQ1DbuVRJUKfQj2aCnLFjL6iTQ=;
 b=kAM0duQmtTCWR8UmYVdRy7RzCjzlip1p3neBRxwrcsYXclJZwGTC7aco+9ZudsCp0c
 SMib1GrA4Yvos4+yEupyHfCAvghYQS3Qd3waHFQyei+ECO1eUpEi5hBngyYdtyMcRzwN
 JUUIvrOCcH3LglD5e8x7qH+QfERG5fVcsFM6d8Q7xh7HnRlObxCo6tCZwVtaMmJ5O/yI
 ma+awhBMtwT5DuWYP9GeKVfm2u7QduWE0ikQ7eSfI2SqwS/9gDhdTaMKkJVsASLs3yga
 YIrbQMwzuhPtXnKdpptvdYPqtnJ7KSOy7Hr1LLH+F65mUfScjCSgOwU478lQUfHQgMkw
 CMYA==
X-Gm-Message-State: AOAM53160k8C3hR16ruGKjLYpl0UwQ8xO9/VIyAKSv5gWPifXzqelVCu
 jWAYoxgZax7g7jGnXjle4VvgkQ==
X-Google-Smtp-Source: ABdhPJx/GYKJ4sp8QsQTJCGodwe9naihFp+6pOwgegfbICsiojZpoJdJyBjOVoo3GHiFJgM+vQVu9w==
X-Received: by 2002:a05:6830:19ed:: with SMTP id
 t13mr12872041ott.83.1643670119656; 
 Mon, 31 Jan 2022 15:01:59 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id n9sm5546723otf.9.2022.01.31.15.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:01:59 -0800 (PST)
Date: Mon, 31 Jan 2022 17:01:57 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Message-ID: <YfhqZZ4QLuCffQPC@builder.lan>
References: <20220119205012.v2.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220119205012.v2.4.Idbc978090270c7b838387acc74d8a06a186a3cf4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119205012.v2.4.Idbc978090270c7b838387acc74d8a06a186a3cf4@changeid>
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/adreno: Update the name of
 7c3 gpu
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 19 Jan 09:21 CST 2022, Akhil P Oommen wrote:

> Update the name in the gpulist for 7c3 gpu as per the latest
> recommendation.
> 

I was skeptical when this was introduced and you proved my point. Give
it a name based on the Adreno revision or possibly the part number and
leave it at that.

Regards,
Bjorn

> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 946f505..bd4d6a1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -330,7 +330,7 @@ static const struct adreno_info gpulist[] = {
>  		.hwcg = a660_hwcg,
>  	}, {
>  		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
> -		.name = "Adreno 7c Gen 3",
> +		.name = "Adreno 7c+ Gen 3",
>  		.fw = {
>  			[ADRENO_FW_SQE] = "a660_sqe.fw",
>  			[ADRENO_FW_GMU] = "a660_gmu.bin",
> -- 
> 2.7.4
> 
