Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCF69F4B7
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 13:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB9710E442;
	Wed, 22 Feb 2023 12:38:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D335910E947
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 12:38:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id g8so6095563lfj.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
 b=GPy98UG1hDeEOAbM0MS3M8rzgN8mDX11UGL25N3HBRXisH1UpOsusVegf+3elyOg3x
 +Wcb5a0IZkREnVJKKWHsX7oYOjYtDEjIzjqeDqvdf3vFnlNO9WMykDg++hApTH8E8iz2
 Tj3xVjb27xBo+cB9OHps3IKea6jdpV0t018IEscafY4xBDi4oZHPQL9A5dUh5JvNtVm6
 R2oK5QRwIUgUmHehL3O9UlLpttppXdcyOS+HnDE9a4k5ATRBq6rjl0LWXZh2LlTSfTsr
 8Mso/9A+vQbbgZ5EeSduvwSMCAnHwMLtUp2/DzwL+LIFBs2dQsixQuVtTzztJFYVymGG
 4GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
 b=w9xMT0OhCUAdZheNXWbvv8fkBbD4JnPXmYsvSZe3DZlPIOKdDbhq0rdxFgx2b0uV9b
 ZJjYgkyFTsx3QpK5EhutTmpQi1GllgXeczoJuOljHCG1zKGfoXt60ppaOK7FMIXvKI8S
 7HkAQPPcWyZPCPWoIdvIuMQw2QTHhgD+0BAxF78KgHFjkJEBGCRKd0CToRP7NB1azneN
 wcuWnhXM3gWibdJnpTDK2/yHGT3HH0ZB9WBHaZWB/Yu77T+C27PO2blrw3rUag+ixgbo
 aDARTkGBVx1rnVx+Ma92IK43i+xtCRnwE+lRvvElJZC5cFMeT1Lhn7C2x1X3igF1ESy4
 a+2g==
X-Gm-Message-State: AO0yUKVY6rv6ukVNDh5otkgOkEX/oTjlZBETXonlKHfjpMVBBfHqZMSQ
 H3j65oKEja6Bvua3XJR4b/d7qw==
X-Google-Smtp-Source: AK7set8WUZHmq/ZcY7/crcIYkICMSvCczISO0Ju6oISPcKN2jF10u6hOClbBs7+/DIyEr6Y7bPl1wQ==
X-Received: by 2002:a05:6512:947:b0:4a4:68b8:f4f1 with SMTP id
 u7-20020a056512094700b004a468b8f4f1mr2922927lft.55.1677069479041; 
 Wed, 22 Feb 2023 04:37:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ac25589000000b004a9b9ccfbe6sm42818lfg.51.2023.02.22.04.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 04:37:58 -0800 (PST)
Message-ID: <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
Date: Wed, 22 Feb 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com
References: <20230222123712.5049-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222123712.5049-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix possible uninitialized access
 in fbdev
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
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/02/2023 14:37, Thomas Zimmermann wrote:
> Do not run drm_fb_helper_unprepare() if fbdev allocation fails. Avoids
> access to an uninitialized pointer. Original bug report is at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/ # 1
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

