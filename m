Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAD721409
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 03:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8220110E095;
	Sun,  4 Jun 2023 01:58:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4E510E095
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 01:58:07 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b1a4250b07so41741791fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685843885; x=1688435885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
 b=n9E+rRx0AO5FR0rquegNF4I26nDcU5SOvG3whnQ3ArY0bI4PoWP4DRf70ubPAK0bUV
 PrKuzgKBii9XWP0o1uDVQUdljf1CZq2wOOLOZC/XJwDiDu4oB0N3JEOEB19ZGAdsLzJQ
 C/PTbSgKycbx6WyODQdX7b3DwEzWy8rMeDeSKEygJ1rNV8FjiOrVQFwqqSlK2QZgKS8I
 zNNwpJvlKSJs44J3vbiihA+Wup4e38wSUlm31CAdUBdHvJ83laX8iDYOvb2I914vyrRG
 CXXsqR4wqgh5jC9XhNcaQQ/5nbnM/64Q6dlP6kl+ubbZ76B0nBVvFRChFUZZEgYx7EZH
 XwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685843885; x=1688435885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
 b=B0EcGmvfKjztTwfytBMX25sQoTvdEijrf6GcgVnCry5NjkwV2n6onBMZ5cAnJes/si
 gJzTrX4EoNvUdJOMuR3VIAE7mWN2qc+IXNGbIgkRNnLCKdmXFrVrfm58z+XprwoR7Px3
 og/U+9LecqUtTZUlf/FkIDh9K8/+BHct78iDAB6QtV26VHrd3UsKvDWfHQMriAsLWfjs
 KBykLTnePNYJca+iAxmrHLAQnL76zoMljyoi4OKfz1gbdpU9uwPEfY4Ncg99NAe1/Mgt
 AEBevS94vjesZ6ecBR/SjFuidFDO7joKT0ocxX0PsAz3P060vejCTLoj36Nr/8ERnXLW
 wIKg==
X-Gm-Message-State: AC+VfDwomhOcFU/T9MhIEw2/TXlLK8vchUykuq512blb58/jEGoz+477
 mswmeRBEkYhRh/gI3pcMJumGgg==
X-Google-Smtp-Source: ACHHUZ75Cw+rmmH9r3AmD2CjoBK8KWeZVioVZDvuSIkimmNEVZfs8IpYHmDoXKzsvs9dItdifAGhXw==
X-Received: by 2002:a2e:a41b:0:b0:2b1:a8b9:4543 with SMTP id
 p27-20020a2ea41b000000b002b1a8b94543mr2026139ljn.53.1685843885452; 
 Sat, 03 Jun 2023 18:58:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i21-20020ac25235000000b004ec7c0f2178sm645352lfl.63.2023.06.03.18.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 18:58:04 -0700 (PDT)
Message-ID: <de718a32-cc3d-849e-522a-dca9a17e1a4b@linaro.org>
Date: Sun, 4 Jun 2023 04:58:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230522191701.13406-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Use struct fb_info.screen_buffer
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/05/2023 22:17, Thomas Zimmermann wrote:
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
> 
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

