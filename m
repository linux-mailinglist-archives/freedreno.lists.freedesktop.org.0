Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FD71F5B0
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 00:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5C10E5EC;
	Thu,  1 Jun 2023 22:11:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8ED10E5EA
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 22:11:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so3372381e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 15:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685657468; x=1688249468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cUjU1QLapAN+UOQb7bMW7gqVswYS7FmmwKe3gGeC7nU=;
 b=NzQu6xWyAFPvysWLbKbjyISj5llZOGjpXFor0IW7wWZYGGutpqSrbRPegCB1UNXbj1
 +Cfo6V6omcyq+wguGbUPSpbmATrIfifLQFztqwQ6zwKuyhp7cYRUceC5BzwBguLzGOG4
 HMh/jBDMKhW7pSVQGRt6iviF3gkVXhuU0fwbSdeSKwt4bDV3R3xrdccEGuie2JFzOwjX
 UYt7JQ3Sw4Wi5FObT3oob6cNsgLye6KZePYWne+7CYZBM+Dw10aZSZSKH5V3xxj2XjZ6
 UOQWGJxst7qfSD7cqJ8yHghKi1KL3dCUrtnmzAhC7eud1LJx/flZqmDAaNHsI/Jwb6FJ
 99Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685657468; x=1688249468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUjU1QLapAN+UOQb7bMW7gqVswYS7FmmwKe3gGeC7nU=;
 b=FAho3rwdZVFHFRIy6YjBsXsSKi6lK579dJKSGxGR8ib98YLdsFbi81sKJViH1t1PwW
 FZgaZthAjnRO8AqVNXdlKwf2j1yBvl5tfUyjLayV/f5gib2m+/+YT/MeLHGeSPLEsX9v
 Sce19g5HS4jsLuiRDGVQ2KdS+bch1Sd8lwWMaRtmTzle81zNgDO84AutXYw3uwA8IuXA
 DSuPDvreKxLDuge/g9AUxsX+Y4l1SSVVTSt1Bw7Sg3YnUqNAVnVD4J4/WE53Bq3iUwO5
 V32sP81i7n1y3jE0KcBYNuCh0KgCdiFwBm6FQVSvgmkreVuP6h8uamK6OQQzWVyyX+bz
 tcog==
X-Gm-Message-State: AC+VfDznUAZISiDQt+96nxPODRNv2xXQ32y5/1I2Nm2Dho/ae3SEjHbr
 yTRqhLQtmR7CzM5i71Bq+g6InA==
X-Google-Smtp-Source: ACHHUZ4Z1RCAMlDskOyhcoYf/TmzLDNh/sz5WfMVyoGVLrhlKAvsxKhMJilmOZ4JHXoYcwc2vHQpug==
X-Received: by 2002:ac2:560c:0:b0:4f0:13e3:a291 with SMTP id
 v12-20020ac2560c000000b004f013e3a291mr319581lfd.28.1685657467880; 
 Thu, 01 Jun 2023 15:11:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e2-20020ac25462000000b004f38e55ae79sm1205559lfn.278.2023.06.01.15.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 15:11:07 -0700 (PDT)
Message-ID: <22853a86-b327-60db-3c47-cbb2e407c10e@linaro.org>
Date: Fri, 2 Jun 2023 01:11:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 0/2] retrieve DSI DSC through DRM bridge
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/06/2023 01:08, Kuogee Hsieh wrote:
> move retrieving DSC from setup_display to atomic_check() and delete struct drm_dsc_config
> from struct msm_display_info.

This is obvious from the patches themselves. You should be describing 
_why_ the changes are necessary, not what is changed.


What was changed between v1 and v2?

> 
> Kuogee Hsieh (2):
>    drm/msm/dpu: retrieve DSI DSC struct at atomic_check()
>    drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 --
>   3 files changed, 13 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

