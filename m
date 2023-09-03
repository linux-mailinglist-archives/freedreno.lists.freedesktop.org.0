Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94067790D51
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 19:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF51710E17B;
	Sun,  3 Sep 2023 17:34:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4210E17B
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 17:34:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99357737980so112406666b.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693762490; x=1694367290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFnqV560lAZ6YF/3E3DhwgPICGzqwbi6MBKG22yTZ8I=;
 b=R/P2p4+JgOPYpoUfJNb2idt7bjgbBE5627T1IEcnHRX1fsoTa32xQfmG6I0QLGUk+C
 lwUBhjQuOjuxOIt/Aujtvxnuf45NLqh2KC9LkMAd+IGSCsxCo4Hq39bkb/+o6vDHtHvZ
 DhS/4oZny83q40o2p2FuV2HFyZkSchZICMtRfG4mtq0J+OMG7/MiO7vV64+CVxImGRZE
 AvRKioLbINDbOGmrpjDzXz+uQiqI69bFoDWJxSMk5l1RTX4i3LgjWPiki5+JUtIpQDUO
 XH8c8jxxDGqyKn8f0jb5WyIVtqO0zIXp441IdDDE6dUBvcv9SiPq4d9VIO8OyVkG2Yoh
 HEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693762490; x=1694367290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFnqV560lAZ6YF/3E3DhwgPICGzqwbi6MBKG22yTZ8I=;
 b=AhdMmM3rrT6CYRCHm+ziWVip5co73VvKXh/Yt4zPDCdSxtlOCD1+K8f71HVuHE2z0M
 q7budqLhKElPvlVMbM25rOH4FT+dfUZIr2VMBO4bo45FYtQYA0Z6P0qlEi2FpD2l8qXB
 eb1tgyCaC7qhQ5XpTtWmxcmCQdpn4+Z5s8wK9kV8EnN+4jM4GIGEDZsNFUq3YxKNN8Gk
 b1WspkqcuVDSPyafjNymwQ/27E/+Sg35CpH9omeVRAxg5I9mUHnc5GJtBigy0oy+8FGo
 6Ak0F0ssejFIJWtKmJmBCUqehOnq64PFJP0lNo9OO6I/D/GK9BgfJJfupUHp421fgLsp
 Sbgg==
X-Gm-Message-State: AOJu0YzWqtk/N2FqaZ9Ca2tLBr29Xnh5Ernsj1/l9LvmS+QfnftdFu4t
 hqha+FO3cVXiNdkMOZhUt5iBBA==
X-Google-Smtp-Source: AGHT+IEe6KGCoDHH6YmYaRNcmoMmo0Ktbkc6BF0JUnIO99xIaVatxGpDQLavUlCRkTk6k8m2js43ww==
X-Received: by 2002:a17:906:f252:b0:9a1:eb67:c0ce with SMTP id
 gy18-20020a170906f25200b009a1eb67c0cemr6189371ejb.50.1693762490088; 
 Sun, 03 Sep 2023 10:34:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906078d00b009a5f1d15642sm4955313ejc.158.2023.09.03.10.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 10:34:49 -0700 (PDT)
Message-ID: <0fef71be-91c7-41ed-bb2c-965b8aa4e8e3@linaro.org>
Date: Sun, 3 Sep 2023 20:34:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
 <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 4/4] drm/msm/dsi: Enable widebus for DSI
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/08/2023 20:42, Jessica Zhang wrote:
> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
> 48 bits of compressed data instead of 24.
> 
> Enable this mode whenever DSC is enabled for supported chipsets.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c      |  2 +-
>   drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++----
>   3 files changed, 29 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

