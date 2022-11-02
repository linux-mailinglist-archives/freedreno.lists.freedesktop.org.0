Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1361671A
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 17:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0653710E4F4;
	Wed,  2 Nov 2022 16:08:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C4110E4F4
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 16:08:04 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z24so25669296ljn.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0I/ROXPneInb/MGZ/Nkeqw8uPPG8K3m2UvjVJMSd+70=;
 b=DyRbaApygVrXJkd7rDhA17TXgTM8qZGDpV0ZixOzyhL+ihS++mbs2tMfh70u97VEyQ
 WsBXCvglwmSJp5likmQuSY9dR640qAqrf55JQUnG4QbgBeA7TM/NKo+3mCh4v2kPJ/2U
 XleqdzJkpJngIp8pZilmw9CKU2OSxMWSPu8BD95womQt147bfrADoJhJWPGmCBjxyN+l
 pPMmt9/l4aElNauCvyltO12mamCd6HOlpyXFaqn2/QvpZA/PjvkkzwE0Zw+B2SugbTYk
 pdYjWR0rocQnCPJU3gs6K2DHJcq5JjCi/u5NqBYaL88JDzIg1QDAGvFsod20obUw7t+C
 /hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0I/ROXPneInb/MGZ/Nkeqw8uPPG8K3m2UvjVJMSd+70=;
 b=VDNoEx2N2gVCLvY/ZP4W4djgp0e2a/8GXwFO/uJTdYiC3Vb/Et4OhjYIBm/ZSaipGb
 JaNMxFsCOhgSha94NwryWofXbPW7sYASLAlhJ9D5tbwCUBq7XszAcBgCsR0e1DBuF8tM
 pJJ9vv1vti6LX9TTMNmHDBDGX/4i4HBPNGNku5Y3Vj+hA95r+8jwK6QvZ3/UAW/GuLJj
 Ht5Osdq4ZDCW9WzcpB/I6pH0EhNV5ZwBmsdK8Ojni8mqiKFWpTE1AwkL90puKc53P1jj
 OgE7LPKSDD/ykQ7fC0nEIaiKbsK+2ui3NHNxf2eklRinzJdhWDrRmvYbE6QjyDeXugkg
 SsUQ==
X-Gm-Message-State: ACrzQf2vrqXC/enynqIKihRvFPCagvtquY2pbiQnApu96NGx3HHLzMN3
 OpWuQu2Esz9uC1ko2R5ikKMNUw==
X-Google-Smtp-Source: AMsMyM7eI3+VrOSND/7sen8ZMjN46C8wNN5N4+3XABwphMWhOTEit16bGY7lU052Pv/qcT+cOXqGtA==
X-Received: by 2002:a2e:a490:0:b0:277:e5b:ec07 with SMTP id
 h16-20020a2ea490000000b002770e5bec07mr10176814lji.371.1667405282393; 
 Wed, 02 Nov 2022 09:08:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a2e9d87000000b0026dcfc2bf4csm2221525ljj.57.2022.11.02.09.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 09:08:02 -0700 (PDT)
Message-ID: <ff01677d-b236-fa16-fde9-98cfe8a0722c@linaro.org>
Date: Wed, 2 Nov 2022 19:08:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220923173307.2429872-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220923173307.2429872-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Add MSM_INFO_GET_FLAGS
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/09/2022 20:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In some cases crosvm needs a way to query the cache flags to communicate
> them to the guest kernel for guest userspace mapping.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
>   include/uapi/drm/msm_drm.h    |  1 +
>   2 files changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

