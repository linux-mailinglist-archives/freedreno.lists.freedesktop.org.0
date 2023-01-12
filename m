Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2A6669C6
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 04:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F1210E180;
	Thu, 12 Jan 2023 03:47:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9D10E180
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 03:47:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bp15so26557226lfb.13
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jan 2023 19:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQYqYg9Pvj612oz2A6wstg+zTxm/640VEb1b8jFKzKY=;
 b=NG/a010yYgMe0V8bnns5bMOUITbfBeKe6BcaynN1/8l/akuR5B07hcKX7InJUVtk8P
 eLnix9w5n8EeCSYm0gysU7iAieHkRBv/npEsfi4iNWh9GooToNmZHp2PpxAc2854I+AB
 3GOS0RtoksmdR0GUPNFgVZpdJ30qYBX4Zg+bm8ZH66iWvn/hrwFiAJxtftDl1iXYVn+7
 NygLfSgsFMKec6d3bxsevwz+xYh/6AF3Rj2mGuI9wMKR+AP/iALmpjKaImyNHjosusbf
 u6Ke5Mixb2jyjJmKuv8OqzBwoEmYzil/xT747f86jtBX3VO1qDM7vEf7A233c0OdVSyZ
 UIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQYqYg9Pvj612oz2A6wstg+zTxm/640VEb1b8jFKzKY=;
 b=s7UviRTj/YbP5gjn8jQPUXQ3jv0VyxDZ5IsRkm8/Y5Xjfrwx/9fgQswlDPRvCkxwIb
 NItfFgkv+p1XC1jf4QhlFXb/8ESOBvUqWpxyLGv8PW9iEv9MPRYiOcPX/eihX8Wf7z34
 h2wKK6sivXXooodjOXgJuLi3Ck/JQyTHoM4szh1EQlgY6EbVt4hv1c8TxnDaSrXHpG5d
 /eS4FpZMJCN97xgLEUgqrvw4Xle/uLQIPB4/5BvNe8HgSlbkiRj2Cu5CYqFHzPLJUWGj
 d4kNnboKLDpCDgIcsoNm1mKXuVcvVcv5Sxz92FDSK+sD7mEYT7X0RlwPxihj/lHEgbjI
 dcKw==
X-Gm-Message-State: AFqh2kp8xcpA+4QnSRkEKOk9H8nwpSEGQjGkwG+lkFupcnwlzah913Qx
 wyc7Uwr5lN9dSkeFr7neuuNGqA==
X-Google-Smtp-Source: AMrXdXsi2xPyrWsA5gCYXCg4QTk727+HhHDcPNoB3o0tRZPxYvEOu7ldi0T60rLzg9X146OdEOYE9g==
X-Received: by 2002:a05:6512:31cc:b0:4b0:1305:6ebf with SMTP id
 j12-20020a05651231cc00b004b013056ebfmr25444639lfe.53.1673495255305; 
 Wed, 11 Jan 2023 19:47:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a056512098600b004b4e67c3c00sm3053639lft.53.2023.01.11.19.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 19:47:34 -0800 (PST)
Message-ID: <2fea078c-c6fc-31bf-c02d-73cdc600d19c@linaro.org>
Date: Thu, 12 Jan 2023 05:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
 <20230112001600.12791-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112001600.12791-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/2] drm/msm/dsi: implement opp table
 based check for dsi_mgr_bridge_mode_valid()
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/01/2023 02:16, Abhinav Kumar wrote:
> Currently there is no protection against a user trying to set
> an unsupported mode on DSI. Implement a check based on the opp
> table whether the byte clock for the mode can be supported by
> validating whether an opp table entry exists.
> 
> For devices which have not added opp table support yet, skip
> this check otherwise it will break bootup on those devices.
> 
> changes in v3:
> 	- make the comment shorter
> 	- handle all errors except ENODEV
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

