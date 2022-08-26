Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7375A23C1
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B4F10E7A8;
	Fri, 26 Aug 2022 09:10:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8A10E797
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:10:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id l23so996630lji.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=j2KtObeVweB4PtewYavPBdUZLz9VJwwib5xRQ67zdyc=;
 b=oKatiD/7aR17ObA6DF3MveHscjyhwPg0qhz3TCUeRFLBGKOJXf6NDR9oYbEVbRXUzO
 B6O5F/uHMUPxl3Q9UWZSLS8+IPMUzbCOXFZV4BEQtycIHZb16hTRjNwCh6Rj4Xr4YjRH
 kTu3QlmCEFqpygZnHvdXFzHYEWkjLhtCKDMbsrzu8WAgw9O+T92h9c/Y7+FTBttw2UPf
 4cL3kChUNV/QKrKXSnhFEH1g25t38XfapJw2PcPGg9H79moryop6ylmJAhRKULvZ3UrY
 wONZnzpvcfWzCIr+HKn2WleikcsQUJQnCkgPHBAuPRzoiJHlwgrvG4G1KYEODqYk2P4u
 eM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=j2KtObeVweB4PtewYavPBdUZLz9VJwwib5xRQ67zdyc=;
 b=23qEbIJLwnoR+Z7Gwh89jqqEV+UxGdQ11NrKms7gYmEqo1yADVYsa358WpmB48Krv9
 BEk4JMEwWVWIsAKmntAJ2t0MVKMGCywXQBS3TnEqsE7FZyeABadrnTFyMmn0pLMs4rwM
 R7c6uPd4kwmtAoZi9uJFcO/sUs3BMTnFsm9ts9Qa1UtTZyWarqOm1H+KFrqNvKL3r9Um
 LJ4u5kIL8oa0TnblV+67kkld06E/lX/3TwWJX8r07eSjhjmqK/UJvZ5eUCEIV9A3LOm7
 keA+b080R3PAZ9uM99nS6MQTmLhT/VJemvQejHj8y4+gz8zrJ7na0PAELEPtsbnvyMfw
 1XTA==
X-Gm-Message-State: ACgBeo013aDL47truc/XgYK556wGq2PkxE4gypZHKhAzhYX1H/ddqLp4
 Ohvkumg+85vJvfhGyqEjLj9lg4NucezvLQ==
X-Google-Smtp-Source: AA6agR48eHVuu7caQCj51Y7Sljt2mlqruCtMZ32WU62CLQcXPd24ORg6/ufVrMRPia1ZCj244CTMFg==
X-Received: by 2002:a2e:9d5a:0:b0:25e:2c67:edaf with SMTP id
 y26-20020a2e9d5a000000b0025e2c67edafmr2097255ljj.437.1661505000270; 
 Fri, 26 Aug 2022 02:10:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a05651c048300b0025e42174f0csm387180ljc.70.2022.08.26.02.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:09:59 -0700 (PDT)
Message-ID: <713dbfbc-0111-f100-bc59-f664a25bdc3d@linaro.org>
Date: Fri, 26 Aug 2022 12:09:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: sunliming <sunliming@kylinos.cn>, christian.koenig@amd.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com
References: <20220826084917.95409-1-sunliming@kylinos.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826084917.95409-1-sunliming@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/dsi: fix the inconsistent
 indenting
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
Cc: inux-arm-msm@vger.kernel.org, kelulanainsley@gmail.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/08/2022 11:49, sunliming wrote:
> Fix the inconsistent indenting in function msm_dsi_dphy_timing_calc_v3().
> 
> Fix the following smatch warnings:
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:350 msm_dsi_dphy_timing_calc_v3() warn: inconsistent indenting
> 
> Fixes: f1fa7ff44056 ("drm/msm/dsi: implement auto PHY timing calculator for 10nm PHY")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

