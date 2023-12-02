Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334B801EE5
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 23:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0410E0DA;
	Sat,  2 Dec 2023 22:07:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865410E0D5
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 22:06:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50abbb23122so4601541e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701554816; x=1702159616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8EEqQbM+NDSOnW/8JPVObWqPerbfzPFaOO/AA0Ia5kw=;
 b=xNA022xifIB5Z9CPGR3zuaM9EVI7Yh/eqBB70etqdhwJBvWd3U9dRYlty5hmV0in+a
 gumqc2iAodA2es2fPNYR3a3QdN49bkVrhU38m4Uq2S8MPsePjAM+jqEu9KFxwAtd/wnQ
 432EoOPPY6bh6WXMiRq8NsO/1RpPWVG3jIfazjTK2VVn9ic99mrIc6I5Ko+Bpwg5LmwK
 RI2wByK4KuHbUt2V56Tmmn9FGL+UeChly8bHPLqAH3sEM6XO51b0WrSVEwxfDEPAbLeh
 4rMbfh5AGh0FMgVBjSflkd49Qr905dhrY4v/anYrNp/VmhdjH1hmdtPKWwyGzOAQQxd0
 Yx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701554816; x=1702159616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EEqQbM+NDSOnW/8JPVObWqPerbfzPFaOO/AA0Ia5kw=;
 b=UwAv0DDuLU71Cwq2ofWoW++8fYWKv1QGk4Z3nnK7lLYcZujNk7QKOTptZUX/AZ8IDE
 B0g+Rzk+v6WHJAScfHwXhGOusNmbp4KwmI2mcBk3xHYWbEbC7zbjcsRNlnIqCFJrx50f
 TtQumHa3AQ6USKoDtnJe3a0eOWyFwL1yo4llRSoLiFO32akAnGwngduJVvUUVxYgL9Yl
 4t71Q+G6BKRHp5DsHLtrmdp26vMsRp0Lbh/SSjEkO5fRgQPx0rzscmtlnYgdrRiOm38z
 gU0LdDLgbJZ9YtHynwNC4cKK6KLfTxYEdEwJoVN6+z3vWQz0L0wMUBtSxj2PwYqVSZr6
 MA9A==
X-Gm-Message-State: AOJu0Yxw1IErGW6ufrkSmPp9RMtvF5Gak7BepAqdIm22o+RhGnxVqf65
 UfFdUoV2M05X16WcUHoNusU+Ew==
X-Google-Smtp-Source: AGHT+IH126mZ0/iFlCmfP9RcDvlY7iS5lYG457fIONwriSCdsyDra+BvTashg0w9kij8AjWyl3UGJw==
X-Received: by 2002:a05:6512:104f:b0:50b:e1ea:f7c5 with SMTP id
 c15-20020a056512104f00b0050be1eaf7c5mr929335lfb.138.1701554816497; 
 Sat, 02 Dec 2023 14:06:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a195048000000b0050be3c0b29bsm165323lfj.195.2023.12.02.14.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Dec 2023 14:06:56 -0800 (PST)
Message-ID: <37daa626-6f6f-4fce-aa35-6e6e8ba2ddb7@linaro.org>
Date: Sun, 3 Dec 2023 00:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in
 sc8180x catalog
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/12/2023 02:35, Bjorn Andersson wrote:
> Similar to SC8280XP, the misconfigured SAFE logic causes rather
> significant delays in __arm_smmu_tlb_sync(), resulting in poor
> performance for things such as USB.
> 
> Introduce appropriate SAFE values for SC8180X to correct this.
> 
> Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

