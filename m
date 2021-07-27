Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C03D7CF3
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 19:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585536E929;
	Tue, 27 Jul 2021 17:59:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CF66E804
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 17:59:40 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r26so23147424lfp.5
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cqBzCBYK/WCh9fycS4ezNBnEiKw44dAJEHWTfNPIy0U=;
 b=c+MTlrWFU+6XLsvvTAgmQoRu6JG4hFHL7PCc9CGlg+QHotx0+E9GWWwgE7j2v629ZV
 2OGpyO/TeEfOUJHCzL0kQcEeN86a/ONA9L4FHtt26y2263IRBo1GvgOJ6EJWfxpCevdh
 rKHMQx4jSHfeqcIdr7d5/QxwS1fVEYG1WMlwBj6iJM+Jr2QDaAsul5cH5dTPj/i62boy
 YBa53QOoyXwE4H8J1yKVkeJuXiGwgGZaGFzmak9jQyk4/N6eHFxOH9gJ6tmWBQw6Dm0t
 5Gb0uidqiT0HxX+9+8i5/TbY91qYhcz1IGPdLACy3MhV98+LxUdg1KkZqqMjmKuCZ6wG
 yNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cqBzCBYK/WCh9fycS4ezNBnEiKw44dAJEHWTfNPIy0U=;
 b=B+xFd5VVjD59ZJqI4teko/sq32S5K535n99RZGkLUvBkNim+/s/0uKR0rZdq1+plle
 eKRQydBSeiwmzE9eEbdCn0NJqs5UYiVo0liRexwR5yCf1r/I8XXrYVTnUlhQswys4Tkc
 6vsWAO/TgnfCGZhfgyte7apxwyxdtm0S71RU96zaBdJAYq9W9VAXi80nCrrEenqTw8Bc
 y7kt4KZP/LUl5z9XmF/SPLYFHJlPNZRT9txYHzWp5BZ9rsrXeSCQzXx37B92tLyvEcfC
 wRERoOM+LlYGStdHq4HSYLdHJDcikgmJDvVeM05LVatrdhw7gh+stwUTvIGfqWxb12vj
 TVXA==
X-Gm-Message-State: AOAM530ylS+0J40dLs1ZwMTeGA2KkG5olCZ5zK3X0QE9hEnyYuM9qwz6
 8BNjAj6uRL0l/QQPi2daMf5F4A==
X-Google-Smtp-Source: ABdhPJwukGjgB72jD7seeBnE75lkf5Eai5MBBJGu4pl4BkBTJt7OIQdo8ByoSHNkxtWwh6fZ5ulPNQ==
X-Received: by 2002:a19:6d06:: with SMTP id i6mr18682045lfc.295.1627408778751; 
 Tue, 27 Jul 2021 10:59:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r16sm354131lfm.91.2021.07.27.10.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 10:59:38 -0700 (PDT)
To: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210714152910.55093-1-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f77b75e2-a6b0-a5a5-938a-b9a1cd27f3ed@linaro.org>
Date: Tue, 27 Jul 2021 20:59:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714152910.55093-1-sean@poorly.run>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Initialize dp->aux->drm_dev
 before registration
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/07/2021 18:28, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Avoids the following WARN:
> [    3.009556] ------------[ cut here ]------------
> [    3.014306] WARNING: CPU: 7 PID: 109 at
> drivers/gpu/drm/drm_dp_helper.c:1796 drm_dp_aux_register+0xa4/0xac
> [    3.024209] Modules linked in:
> [    3.027351] CPU: 7 PID: 109 Comm: kworker/7:8 Not tainted 5.10.47 #69
> [    3.033958] Hardware name: Google Lazor (rev1 - 2) (DT)
> [    3.039323] Workqueue: events deferred_probe_work_func
> [    3.044596] pstate: 60c00009 (nZCv daif +PAN +UAO -TCO BTYPE=--)
> [    3.050761] pc : drm_dp_aux_register+0xa4/0xac
> [    3.055329] lr : dp_aux_register+0x40/0x88
> [    3.059538] sp : ffffffc010ad3920
> [    3.062948] x29: ffffffc010ad3920 x28: ffffffa64196ac70
> [    3.067239] mmc1: Command Queue Engine enabled
> [    3.068406] x27: ffffffa64196ac68 x26: 0000000000000001
> [    3.068407] x25: 0000000000000002 x24: 0000000000000060
> [    3.068409] x23: ffffffa642ab3400 x22: ffffffe126c10e5b
> [    3.068410] x21: ffffffa641dc3188 x20: ffffffa641963c10
> [    3.068412] x19: ffffffa642aba910 x18: 00000000ffff0a00
> [    3.068414] x17: 000000476f8e002a x16: 00000000000000b8
> [    3.073008] mmc1: new HS400 Enhanced strobe MMC card at address 0001
> [    3.078448] x15: ffffffffffffffff x14: ffffffffffffffff
> [    3.078450] x13: 0000000000000030 x12: 0000000000000030
> [    3.078452] x11: 0101010101010101 x10: ffffffe12647a914
> [    3.078453] x9 : ffffffe12647a8cc x8 : 0000000000000000
> [    3.084452] mmcblk1: mmc1:0001 DA4032 29.1 GiB
> [    3.089372]
> [    3.089372] x7 : 6c6064717372fefe x6 : ffffffa642b11494
> [    3.089374] x5 : 0000000000000000 x4 : 6d006c657869ffff
> [    3.089375] x3 : 000000006c657869 x2 : 000000000000000c
> [    3.089376] x1 : ffffffe126c3ae3c x0 : ffffffa642aba910
> [    3.089381] Call trace:
> [    3.094931] mmcblk1boot0: mmc1:0001 DA4032 partition 1 4.00 MiB
> [    3.100291]  drm_dp_aux_register+0xa4/0xac
> [    3.100292]  dp_aux_register+0x40/0x88
> [    3.100294]  dp_display_bind+0x64/0xcc
> [    3.100295]  component_bind_all+0xdc/0x210
> [    3.100298]  msm_drm_bind+0x1e8/0x5d4
> [    3.100301]  try_to_bring_up_master+0x168/0x1b0
> [    3.105861] mmcblk1boot1: mmc1:0001 DA4032 partition 2 4.00 MiB
> [    3.112282]  __component_add+0xa0/0x158
> [    3.112283]  component_add+0x1c/0x28
> [    3.112284]  dp_display_probe+0x33c/0x380
> [    3.112286]  platform_drv_probe+0x9c/0xbc
> [    3.112287]  really_probe+0x140/0x35c
> [    3.112289]  driver_probe_device+0x84/0xc0
> [    3.112292]  __device_attach_driver+0x94/0xb0
> [    3.117967] mmcblk1rpmb: mmc1:0001 DA4032 partition 3 16.0 MiB,
> chardev (239:0)
> [    3.123201]  bus_for_each_drv+0x8c/0xd8
> [    3.123202]  __device_attach+0xc4/0x150
> [    3.123204]  device_initial_probe+0x1c/0x28
> [    3.123205]  bus_probe_device+0x3c/0x9c
> [    3.123206]  deferred_probe_work_func+0x90/0xcc
> [    3.123211]  process_one_work+0x218/0x3ec
> [    3.131976]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
> [    3.134123]  worker_thread+0x288/0x3e8
> [    3.134124]  kthread+0x148/0x1b0
> [    3.134127]  ret_from_fork+0x10/0x30
> [    3.134128] ---[ end trace cfb9fce3f70f824d ]---
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Any Fixes: tag?

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 051c1be1de7e..987f9e330138 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -219,6 +219,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> +	dp->aux->drm_dev = drm;
>   	rc = dp_aux_register(dp->aux);
>   	if (rc) {
>   		DRM_ERROR("DRM DP AUX register failed\n");
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
