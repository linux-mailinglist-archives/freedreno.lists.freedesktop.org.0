Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9E47621B
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42110E1EF;
	Wed, 15 Dec 2021 19:49:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B2910E2BB
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:49:30 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m12so34979953ljj.6
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2Jdbxx8yhXD15gHEUpM6lHyLqMwp2IChCOBO/z10+7k=;
 b=Lww4o1mOGnsQcztPqGeqiJAHh8oityHaAea90qQKRPI8ultTJ7YAcj5V2zEfNqK4rG
 iDmYqr9up1TXQWaxUd/jf2dxzmrgOMQNZb1gvjRWv4GP6M63ixqU08dqjmE52V/1m+2M
 +EXWwJ02l+jhNVulEbDYpxUGrwH7fmtwkxU9espd27qqg10ZGPGzgY7QDGMnlmdwa8pz
 WtQ9Hhr2bghLzlYu3SWvSvRWfCacpOlOv3dY4rpmqrygKJgLUuEe8JponEszaekTatT8
 9gOVUtp6TexDQe0yT34c0TjfZNYUzPMjD0PaLMd3K4vy+A8HEQSoSteizObwLorh3/CT
 OUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Jdbxx8yhXD15gHEUpM6lHyLqMwp2IChCOBO/z10+7k=;
 b=4xslyGeg9VJrt6IRvnDlFznFm+SG+98sqR8TShpY2hOPacM/T2t30oa2Ut9mXMaPPz
 iApvhcuThicmxmnyGYcQ/yJc3aVPnfQFgWBmo8OEKOsxqwAm0FwdbwDOCpCsLc/TBLmd
 HgllPlC3UpZTZ1UE7Ku8KhI0fAtIR8UPkZsFNeMm7G2cnZX/LnHzuZ+yGynG5uqKOjj6
 CHlw8h8MDcPNTPUz3Ozqlynios9ZB4nrsmcuyhSpDJ4oLZSLJDW765vWCnADCg90osmF
 89PtXf17ZXQCGS8HoqhayMRxnpWBXkpAOuIx1pU21MzSGCAwKxaIIxjWtRco2oBIKR8y
 NO6w==
X-Gm-Message-State: AOAM533+7aVL8DtBf4DX0pRSjtkYS/Le6XqGYOrLjKUbiZKwm3PW3iFO
 69iDRLSiuRtq0vPZQuNFIOn6xQ==
X-Google-Smtp-Source: ABdhPJzExouZ/WhriICLDITDfeC8Z9c4Cg/WczYq5K2alaBvVhuaktrZ/1hWVV+3tXuFko9PZQjrYQ==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr11613559ljk.291.1639597769020; 
 Wed, 15 Dec 2021 11:49:29 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id d10sm467446lfe.106.2021.12.15.11.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:49:00 -0800 (PST)
Message-ID: <195d6835-c1ee-e818-3760-835a60b94402@linaro.org>
Date: Wed, 15 Dec 2021 22:48:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211215174524.1742389-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm/debugfs: Add display/kms
 state snapshot
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/12/2021 20:45, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2: Drop unneeded msm_kms_show_priv [Dmitry B]
> 
>   drivers/gpu/drm/msm/msm_debugfs.c | 75 +++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)-- 
With best wishes
Dmitry
