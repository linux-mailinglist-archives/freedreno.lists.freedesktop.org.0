Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA96D6F38
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1D10E7C3;
	Tue,  4 Apr 2023 21:47:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EA010E7B1
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:46:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bi9so44097403lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IaMgVmMRKHB1boevYQWLg11Vsy/V0txo0GcIO7QVhSY=;
 b=K5q6ENwJTAVBJ28h2iiiJ0M4koQ1e5Du5loIQmLdyvhJdglioT749iWc2qzK26pdg6
 8PYoGbvV4CfhE9uVRBDRV/A7mTTHOTyQKKp/O2aXfw7qyN3K4QOy91al6NQ5/zukPaQg
 U1Y9SQI78KqYEt9S+B2XowaweVcD3zn5CDSlJxFmFBWCEh/iNhosjh7m5TloTBgpoNor
 Ldc2FKLguJe6O/8HtCZHSRDjKYW5m5Zq76cDdy9RVppbbmD+GS1KNdO1ghOn4UGjdH0E
 iRQEv0ttm5JNcZ/Qm2jzLQbjxsU7qSOxsxlHofvnpQ4Ujow6IUBkQ0XKbnUq8OqQj0pV
 EmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IaMgVmMRKHB1boevYQWLg11Vsy/V0txo0GcIO7QVhSY=;
 b=HfkdVALIrWdDZvsHGCQ1LCzXbNtEybqw7m2DsxTtC1cCSxM4hg+IylVFmUfpkTmzHK
 3+KHvK7NZieZ4paakv8/rQFtb6eHzCJI2lpELSixelTSfiAoMLJQeIjnUWZTXrJ/14Tk
 dByNlfPDGjMCEDFmJ+8kN+i+cmC7cjVf2x5DrRVMvhjzBOP8BSZsFhpXlSl4qiSkZfXA
 yU+zvCvxiOPX9HkfkjNjCEIaHrXOLOOW0cEL5Af83TxKQAyJELioBlYwxdbvX+t6WZXs
 eIe7e54pZbMHnC3oq1wbiUEvGSIM9qut/hmLYqK3C97hMG54wVmOUjOtv9AsvlOMUWFc
 d8Xg==
X-Gm-Message-State: AAQBX9fewutR+es+bs6nAoU3cMrclVpPJuFCaxOZUiPH1fwzFLLS2e7G
 jomC5ecsQzMQ+lnKAcyuRSFE7w==
X-Google-Smtp-Source: AKy350Zx/6LzBK1kcE3Wce4JVCT1BnSYDEdr597UJLWEF+wgXO7Pp8BkSfgb95szKgjGci+SBZWX1g==
X-Received: by 2002:ac2:44bb:0:b0:4ea:e799:59f9 with SMTP id
 c27-20020ac244bb000000b004eae79959f9mr936935lfm.66.1680644816055; 
 Tue, 04 Apr 2023 14:46:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25303000000b004db2978e330sm2503392lfh.258.2023.04.04.14.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:46:55 -0700 (PDT)
Message-ID: <b952430c-7342-07ed-8834-24e2c1d63a65@linaro.org>
Date: Wed, 5 Apr 2023 00:46:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-9-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 8/8] drm/msm: Implement fbdev emulation
 as in-kernel client
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

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Move code from ad-hoc fbdev callbacks into DRM client functions
> and remove the old callbacks. The functions instruct the client
> to poll for changed output or restore the display. The DRM core
> calls both, the old callbacks and the new client helpers, from
> the same places. The new functions perform the same operation as
> before, so there's no change in functionality.
> 
> Replace all code that initializes or releases fbdev emulation
> throughout the driver. Instead initialize the fbdev client by a
> single call to msm_fbdev_setup() after msm has registered its
> DRM device. As in most drivers, msm's fbdev emulation now acts
> like a regular DRM client.
> 
> The fbdev client setup consists of the initial preparation and the
> hot-plugging of the display. The latter creates the fbdev device
> and sets up the fbdev framebuffer. The setup performs display
> hot-plugging once. If no display can be detected, DRM probe helpers
> re-run the detection on each hotplug event.
> 
> A call to drm_dev_unregister() releases the client automatically.
> No further action is required within msm. If the fbdev framebuffer
> has been fully set up, struct fb_ops.fb_destroy implements the
> release. For partially initialized emulation, the fbdev client
> reverts the initial setup.
> 
> v2:
> 	* handle fbdev module parameter correctly (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c |   1 +
>   drivers/gpu/drm/msm/msm_drv.c     |  15 +---
>   drivers/gpu/drm/msm/msm_drv.h     |  10 ++-
>   drivers/gpu/drm/msm/msm_fbdev.c   | 115 ++++++++++++++++++------------
>   4 files changed, 81 insertions(+), 60 deletions(-)
> 
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # RB5

-- 
With best wishes
Dmitry

