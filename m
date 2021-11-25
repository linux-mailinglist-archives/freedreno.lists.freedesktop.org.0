Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6045D95F
	for <lists+freedreno@lfdr.de>; Thu, 25 Nov 2021 12:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2FA6E9E6;
	Thu, 25 Nov 2021 11:39:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6CD6E9A2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 11:39:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t26so15563197lfk.9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QQHaD9Txbs+YqnVFTQVUah9dRuHXv52COwlrZP0qSXA=;
 b=Q9MZsBn9M6sfe4zNLAumUeRG31c3T58WM1qgrRkMxZvPi0HVLMHruCd+DUVxA2YRMn
 A1c7q6QRGSvPLhVNUr+zLWFJ263bLNEYVeSwI2p1p8EjDixpgR3zbmaS02sIL6q6FAP9
 Ns3qFlU6iAlhPcDSrqpJmneiqw+wsbfud3qleFDBGVfTVX+cQfK5cx9J4/GxspqJMFLt
 RVG8R1ySmvyy3LRTlLHajNm4jIoBQher3c5JOJt1wTGWS1W7qWbdgF8ojX86sbO1jXF0
 +O081hT3yldBAavYUtzp5WCwGjUW/g+jqlh49G8ADgFf5b++U3nQmzIILHhj/GjH8gDW
 +zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QQHaD9Txbs+YqnVFTQVUah9dRuHXv52COwlrZP0qSXA=;
 b=xjRmMeHxtjFed+t2OAMZXB1Y5WsdoMulwhJ+mJbIKNQY71l9N652fewiIuGh0tfB5h
 xED81rAuRpe7PWxa3H4n/SYZ2ofNm07fYKflK6xNHf0DH0fq2zDGUS4YpUUWeG4cHiQL
 EXLyvIILCuUM4YAzsgxzPwNACJ+pJeH/DfhrQTiqcYo9aoHwPRQjKySBDywfQTp9iJnE
 ZY2bLjdO7wf6i0mhsubFv2xIFjB0ksmZ0In7vzHVjgUIUrjYiZOaTVwd7CeWh9cOMvMy
 6XCHnZGTUid6IpkNy8fMiNO2bkdKi8mhM1mr/66ne2rIiH/wyTeptiF5yfFnlEo3vOTD
 DvtA==
X-Gm-Message-State: AOAM533t4zJOcSBHukOjCBY/tSgUAW2TZVWEvjk+PIqUxFqIm4GHS3rM
 5G697rtFp86oz/rkm4gpmRZwZg==
X-Google-Smtp-Source: ABdhPJzlG30kK4JbRdw/TaSOXXDqNQj9vIewf6GaWsy2uQD/hxhmzBejbbNG+maY/xnuolKOKq+1qw==
X-Received: by 2002:ac2:4aca:: with SMTP id m10mr23035513lfp.437.1637840346426; 
 Thu, 25 Nov 2021 03:39:06 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h20sm241601lfv.248.2021.11.25.03.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 03:39:06 -0800 (PST)
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org
References: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <efe700b3-9e08-10fa-405f-bc608f617407@linaro.org>
Date: Thu, 25 Nov 2021 14:39:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1628699407-28358-1-git-send-email-khsieh@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 0/6] add fixes to pass DP Link Layer
 compliance test cases
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/08/2021 19:30, Kuogee Hsieh wrote:
> drm/msm/dp: add fixes to pass DP Link Layer compliance test cases
> 
> Kuogee Hsieh (6):
>    drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
>    drm/msm/dp: reduce link rate if failed at link training 1
>    drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
>    drm/msm/dp: replug event is converted into an unplug followed by an
>      plug events
>    drm/msm/dp: return correct edid checksum after corrupted edid checksum
>      read
>    drm/msm/dp: do not end dp link training until video is ready
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     |   3 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_display.c |  14 ++--
>   drivers/gpu/drm/msm/dp/dp_panel.c   |   9 ++-
>   4 files changed, 102 insertions(+), 61 deletions(-)

Previous version of this patchset is already merged. If there are any 
changes on top of it, please submit the incremental diff/fixup.


-- 
With best wishes
Dmitry
