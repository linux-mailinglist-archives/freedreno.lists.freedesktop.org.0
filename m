Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548F74EB80
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 12:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9610E35B;
	Tue, 11 Jul 2023 10:09:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F49810E357
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 10:09:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso8721769e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689070169; x=1691662169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dRYhDe8BiVEV0EBlHbMEnxi5wvB4qWMFbFVB8lXRts=;
 b=aFgnj794CZ/PSLsUzrOXSBGzhI4B7HswMutmsFqschHSz8cORA+/pDetACQMnLtiVf
 SmrzCFCT/cs+yM6BikKD/fqtRXullzc+RV31vTmrAL7rMnzI7g16FM72t2KqZivXVtiL
 fMRV7ruLnrIMLDcjsLJWEglSNQS1EXdKxUdtJ7xeV2OpYxq6LtL3o6/GCUCTxNGksEAq
 OaXuZwr3JCMIQ1l/iQaAsAXZe5TMsMdztIpr3EeEXtf9nprw/1zwlBw+P4lNXSRt+M6k
 rXc9W4f0n7upozPz3dJJtgCxGq6YYdfg3Q3boXohjB+hDA1PLH4SmzjbP61YS/E3XkvU
 pJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689070169; x=1691662169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dRYhDe8BiVEV0EBlHbMEnxi5wvB4qWMFbFVB8lXRts=;
 b=VKt4oPHXNS1CnaBc2ZrhUM4y8I1tHl044rtuHK3ax4fmESmJJHUc9NnvX3Sabl3GcT
 Dl0HHP9W9JkmbGvhcDuhxlDY09CatqQrlugOXE06ovIbsr9HMo7IGIPTFYn6Xmrv1/MY
 VESi+3LHHxR+XOZq9ExyXpuiWwfjnHjH/T7kjtge0+eP8/AWX+0onclU1Fmd3cHW7CMm
 oGSYllDMUStMBtDNRLjsHjIbvGdrXvNu/scpjfosoBmhY4n/qvqo5c1Jqfzm7740Qh5j
 IvUzidnzfAjmbBCHwIMS2Uu3Ysj601FI4tlred7PIky06YSle9DvH2f00Q67vJuzj772
 XKXA==
X-Gm-Message-State: ABy/qLYh4foPvwokf4hyYsMquLQIbs6dCNPSYsNSI3NgL79rZY91F/3J
 jC+SYWOJ6yjixEAUlSRPprtxww==
X-Google-Smtp-Source: APBJJlHdaYP6KQEeXomKRN9uoCu1+yo8uHO71sdRJ/mNUCNoupGWQiJZQ4tH2nJN9kqa4WSAGURoBQ==
X-Received: by 2002:a05:6512:2346:b0:4fb:7be5:8f4e with SMTP id
 p6-20020a056512234600b004fb7be58f4emr3008339lfu.6.1689070168929; 
 Tue, 11 Jul 2023 03:09:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 15-20020ac2482f000000b004fb88fffd19sm256372lft.146.2023.07.11.03.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 03:09:28 -0700 (PDT)
Message-ID: <1090089b-2fa9-9781-51a8-38957e261bfd@linaro.org>
Date: Tue, 11 Jul 2023 13:09:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
 <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/client: Send hotplug event after
 registering a client
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Duge <MoritzDuge@kolahilft.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/07/2023 09:07, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.07.23 um 23:11 schrieb Dmitry Baryshkov:
> [...]
>>> ---
>>>   drivers/gpu/drm/armada/armada_fbdev.c     |  4 ----
>>>   drivers/gpu/drm/drm_client.c              | 21 +++++++++++++++++++++
>>>   drivers/gpu/drm/drm_fbdev_dma.c           |  4 ----
>>>   drivers/gpu/drm/drm_fbdev_generic.c       |  4 ----
>>>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ----
>>>   drivers/gpu/drm/gma500/fbdev.c            |  4 ----
>>>   drivers/gpu/drm/msm/msm_fbdev.c           |  4 ----
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> 
> Thanks.
> 
>>
>>>   drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ----
>>>   drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ----
>>>   drivers/gpu/drm/tegra/fbdev.c             |  4 ----
>>>   10 files changed, 21 insertions(+), 36 deletions(-)
>>
>> BTW: As you have been clearing this area. I see that significant 
>> amount of DRM drivers use exactly the same code for 
>> msm_fbdev_client_funcs and for the significant part of 
>> foo_fbdev_setup(). Do you have any plans for moving that into a 
>> library / generic code? If not, I can take a look at crafting the patch.
>>
> 
> You're not the first to ask. :) I've so far not attempted to address 
> this duplication. I've been bitten by premature helperization before, so 
> I wanted to wait a bit longer. A lot of the fbdev and client code is 
> changing quite a bit. After things stabilized, I want to to try to do 
> some more code sharing.

Ack, thank you for sharing this.

-- 
With best wishes
Dmitry

