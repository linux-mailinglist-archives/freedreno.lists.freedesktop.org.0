Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1669B4F2
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAFB10E469;
	Fri, 17 Feb 2023 21:42:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06FB10E465
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:42:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id be32so3138563lfb.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
 b=wzjVOLTW6zAlPTdYq7bgQm9Wzv5yjfA8OZFcEROYZZ2Mfnj+ZZ5MzH3IXa+sWZrRi+
 8QsMXdMyTXefyp6TLW/iHdR0owiFo7cQGipaAdZhemqcVNTyQ3Lj8/OVVkOmAJRlQCak
 xGd+hk0sxnIJaEB6GkAi8lX6NaHq83yde+Pyd4BWBASaUu9kl8KzfUgtxZa2svfkkrpC
 b0xLBfIBsqTOxLxKAiZP7/h6FPPlz6IWGSPUeNceoRcQhxn3Ft+P5ZCk6BKLgAwIRbyr
 4at0jYWC6i7Qm43dfl+X3D8yhwm3sl8yj4dZqM/8Gsiz4ZiOQ30h3HUgEBV8cK1/N/xh
 E7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
 b=k5VdxMc8A4xYfk8iMQM0i6cqOaO0NooL7WYBZzmxmynclEmoGAOEJ93tJhi8PVVUjK
 xQSCgl08f3lv7CVs7AcHtZvvFYukKppYzEWohLIm1wgdUqLrJGhNXC0TAquKnaCAFr2i
 9GiIE/oMyiRnkAi758JQp4c2Kp0ir2J9Dka9ugLO574DF+r/W2pLFgyiBFWglWc5uWPf
 LmcCWew2WJjjZZEHb2hppK3EiaZ9EG6qEehA4mB8RhJKt+M1quO8wPGoqucpZsYIOZsf
 aR7b2YtBYs/n1FggIm+FPQJUdPlrQO4FsfkH5sK36AULdJwQ0M+8K0VN5dpZg5YZsbGf
 XNDQ==
X-Gm-Message-State: AO0yUKWI5u9zxPLd9eWGKYdwjksOjwMM3mooZcgLe9XIXTMPfxfbM3ng
 WYJlIHt3PNazh+sZCTTrgihpnv14K4Cq4yKZ
X-Google-Smtp-Source: AK7set/CxZjGHo846Qka7vuunh7JdD0xMbvLWcB46lLmZmqb987pyAwT8cS37VQHh6qvPh/aW+XtdA==
X-Received: by 2002:a05:6512:24e:b0:4cc:5e3a:dd82 with SMTP id
 b14-20020a056512024e00b004cc5e3add82mr815421lfo.58.1676670174032; 
 Fri, 17 Feb 2023 13:42:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u9-20020ac25189000000b004dc84e73fd8sm310981lfi.278.2023.02.17.13.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:42:53 -0800 (PST)
Message-ID: <473f4c26-90cd-85ad-afe5-315fa224dc27@linaro.org>
Date: Fri, 17 Feb 2023 23:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-10-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-10-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 09/14] drm/msm/a6xx: Fix some A619
 tunables
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> Adreno 619 expects some tunables to be set differently. Make up for it.
> 
> Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

